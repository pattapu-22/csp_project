import 'package:flutter/material.dart';

class CyclePhasesTab extends StatelessWidget {
  const CyclePhasesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Phases of the Menstrual Cycle',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              '1. Menstrual Phase:\nThe shedding of the uterine lining (3–7 days).',
            ),
            SizedBox(height: 10),
            Text(
              '2. Follicular Phase:\nThe body prepares to release an egg (Day 1 to 13).',
            ),
            SizedBox(height: 10),
            Text(
              '3. Ovulation:\nRelease of the egg (around Day 14).',
            ),
            SizedBox(height: 10),
            Text(
              '4. Luteal Phase:\nPreparation for pregnancy or next period (Day 15–28).',
            ),
          ],
        ),
      ),
    );
  }
}
