import 'package:flutter/material.dart';
import 'package:empower_safe/models/report.dart';
import 'package:empower_safe/services/firebase_service.dart';
import 'package:empower_safe/constants.dart';
import 'package:uuid/uuid.dart'; // Correct import for uuid package

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  String _category = 'Household Violence';
  bool _isAnonymous = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Incident'),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: _category,
                items: [
                  'Household Violence',
                  'Public Harassment',
                  'Workplace Disturbance'
                ]
                    .map((category) => DropdownMenuItem(
                        value: category, child: Text(category)))
                    .toList(),
                onChanged: (value) => setState(() => _category = value!),
                decoration: const InputDecoration(labelText: 'Category'),
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 4,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a description' : null,
              ),
              SwitchListTile(
                title: const Text('Report Anonymously'),
                value: _isAnonymous,
                onChanged: (value) => setState(() => _isAnonymous = value),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final report = Report(
                      id: const Uuid().v4(), // Generate unique ID
                      description: _descriptionController.text,
                      category: _category,
                      timestamp: DateTime.now(),
                      isAnonymous: _isAnonymous,
                    );
                    await FirebaseService().addReport(report);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Report submitted successfully')),
                    );
                    Navigator.pop(context);
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
    _descriptionController.dispose();
    super.dispose();
  }
}
