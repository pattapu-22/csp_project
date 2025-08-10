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
              'Overview',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Violence against women can take many forms — physical, emotional, sexual, '
              'economic, or online harassment. It affects not only individuals but also '
              'families and communities.\n\n'
              'Empowerment means providing women with the knowledge, confidence, and '
              'resources to stand up for their rights, report abuse, and live without fear. '
              'Through awareness, education, and unity, we can build safer environments '
              'where women thrive.',
            ),
          ],
        ),
      ),
    );
  }
}
