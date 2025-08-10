import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empower_safe/constants.dart';
import 'package:uuid/uuid.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _sectorNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // Fields
  String _sector = 'Domestic Work';
  String _category = 'Physical Abuse';
  DateTime? _incidentDateTime;
  bool _isAnonymous = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Incident'),
        backgroundColor: kPrimaryColor,
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
                items: ['Domestic Work', 'Public Space', 'Workplace', 'Online']
                    .map((sector) =>
                        DropdownMenuItem(value: sector, child: Text(sector)))
                    .toList(),
                onChanged: (value) => setState(() => _sector = value!),
                decoration: const InputDecoration(labelText: 'Sector'),
              ),

              const SizedBox(height: 16),

              // Category
              DropdownButtonFormField<String>(
                value: _category,
                items: [
                  'Physical Abuse',
                  'Verbal Abuse',
                  'Harassment',
                  'Discrimination'
                ]
                    .map(
                        (cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                    .toList(),
                onChanged: (value) => setState(() => _category = value!),
                decoration: const InputDecoration(labelText: 'Category'),
              ),

              const SizedBox(height: 16),

              // Sector-specific name
              TextFormField(
                controller: _sectorNameController,
                decoration: const InputDecoration(
                  labelText: 'Sector-specific Name (Location/Org/Household)',
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a name' : null,
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

              const SizedBox(height: 20),

              // Submit button
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate() &&
                      _incidentDateTime != null) {
                    final id = const Uuid().v4();

                    await FirebaseFirestore.instance
                        .collection('reports')
                        .doc(id)
                        .set({
                      'sector': _sector,
                      'category': _category,
                      'sectorName': _sectorNameController.text,
                      'description': _descriptionController.text,
                      'incidentDateTime':
                          Timestamp.fromDate(_incidentDateTime!),
                      'timestamp': Timestamp.now(),
                      'isAnonymous': _isAnonymous,
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Report submitted successfully')),
                    );
                    Navigator.pop(context);
                  } else if (_incidentDateTime == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please select date & time')),
                    );
                  }
                },
                child: const Text('Submit Report'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _sectorNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
