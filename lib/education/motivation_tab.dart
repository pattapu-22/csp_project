import 'package:flutter/material.dart';

class MotivationTab extends StatelessWidget {
  const MotivationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Emotional & Mental Strength',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              'Your safety, dignity, and dreams matter. No one has the right to make you feel '
              'less than you are.\n\n'
              'Tips to Stay Mentally Strong:\n'
              '• Surround yourself with supportive people.\n'
              '• Practice self-care — healthy eating, sleep, exercise.\n'
              '• Speak up when you feel unsafe.\n'
              '• Celebrate your achievements, big or small.',
            ),
            SizedBox(height: 20),
            Text(
              'Motivational Reminder:\n'
              '“You are stronger than you think. Your voice can inspire change.”',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
