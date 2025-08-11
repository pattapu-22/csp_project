import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _whoHarmedController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? _sector;
  String? _category;
  DateTime? _incidentDateTime;
  bool _isAnonymous = true;
  bool _isSubmitting = false; // NEW: Track loading state

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Report Incident',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white), // Back arrow white
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sector
              DropdownButtonFormField<String>(
                value: _sector,
                hint: const Text('Please select sector'),
                items: ['Domestic Work', 'Public Space', 'Workplace', 'Online']
                    .map((sector) =>
                        DropdownMenuItem(value: sector, child: Text(sector)))
                    .toList(),
                onChanged: (value) => setState(() => _sector = value),
                validator: (value) =>
                    value == null ? 'Please select a sector' : null,
                decoration: const InputDecoration(labelText: 'Sector'),
              ),

              const SizedBox(height: 16),

              // Category
              DropdownButtonFormField<String>(
                value: _category,
                hint: const Text('Please select category'),
                items: [
                  'Physical Abuse',
                  'Verbal Abuse',
                  'Harassment',
                  'Discrimination'
                ]
                    .map(
                        (cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                    .toList(),
                onChanged: (value) => setState(() => _category = value),
                validator: (value) =>
                    value == null ? 'Please select a category' : null,
                decoration: const InputDecoration(labelText: 'Category'),
              ),

              const SizedBox(height: 16),

              // Who harmed
              TextFormField(
                controller: _whoHarmedController,
                decoration: const InputDecoration(
                  labelText: 'Who specifically harmed you?',
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter who harmed you' : null,
              ),

              const SizedBox(height: 16),

              // Description
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 4,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a description' : null,
              ),

              const SizedBox(height: 16),

              // Incident Date & Time Picker
              ListTile(
                title: Text(
                  _incidentDateTime == null
                      ? 'Select Incident Date & Time'
                      : _incidentDateTime.toString(),
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null) {
                      setState(() {
                        _incidentDateTime = DateTime(
                          date.year,
                          date.month,
                          date.day,
                          time.hour,
                          time.minute,
                        );
                      });
                    }
                  }
                },
              ),

              const SizedBox(height: 16),

              // Anonymous toggle
              SwitchListTile(
                title: const Text('Report Anonymously'),
                value: _isAnonymous,
                onChanged: (value) => setState(() => _isAnonymous = value),
              ),

              const SizedBox(height: 30),

              // Submit button in center
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: _isSubmitting
                      ? null // Disable button while submitting
                      : () async {
                          if (_formKey.currentState!.validate() &&
                              _incidentDateTime != null) {
                            setState(() => _isSubmitting = true);

                            try {
                              final id = const Uuid().v4();

                              await FirebaseFirestore.instance
                                  .collection('reports')
                                  .doc(id)
                                  .set({
                                'sector': _sector,
                                'category': _category,
                                'whoHarmed': _whoHarmedController.text,
                                'description': _descriptionController.text,
                                'incidentDateTime':
                                    Timestamp.fromDate(_incidentDateTime!),
                                'timestamp': Timestamp.now(),
                                'isAnonymous': _isAnonymous,
                              });

                              if (mounted) {
                                setState(() => _isSubmitting = false);
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Report Submitted'),
                                    content: const Text(
                                      'Your report has been successfully submitted.\n'
                                      'We will take action as soon as possible.\n'
                                      'You are brave for having the courage to report this.',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/home');
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            } catch (e) {
                              setState(() => _isSubmitting = false);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Failed to submit report')),
                              );
                            }
                          } else if (_incidentDateTime == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please select date & time')),
                            );
                          }
                        },
                  child: _isSubmitting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                              strokeWidth: 2, color: Colors.white),
                        )
                      : const Text(
                          'Submit Report',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _whoHarmedController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
