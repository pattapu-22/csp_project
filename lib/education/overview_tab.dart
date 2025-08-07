import 'package:flutter/material.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'What is Menstruation?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Menstruation is a natural monthly process where the uterus sheds its lining. '
              'This is a normal part of the female reproductive cycle and usually lasts between 3 to 7 days.',
            ),
            SizedBox(height: 20),
            Text(
              'Why is it Important?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'It indicates healthy reproductive functioning and hormonal balance. '
              'Learning about it reduces stigma and helps girls and women manage it confidently.',
            ),
          ],
        ),
      ),
    );
  }
}
