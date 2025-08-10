import 'package:flutter/material.dart';

class LawsProtectionTab extends StatelessWidget {
  const LawsProtectionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Know Your Rights & Protections',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              '1. Domestic Violence Laws:\n'
              '- Provide protection orders against abusers.\n'
              '- Ensure safe housing and counseling support.',
            ),
            SizedBox(height: 10),
            Text(
              '2. Sexual Harassment Laws:\n'
              '- Safeguard against harassment in workplaces, schools, and public spaces.\n'
              '- Allow victims to file confidential complaints.',
            ),
            SizedBox(height: 10),
            Text(
              '3. Equal Opportunity Laws:\n'
              '- Guarantee equal pay for equal work.\n'
              '- Prevent discrimination based on gender.',
            ),
            SizedBox(height: 10),
            Text(
              '4. Reporting & Helplines:\n'
              '- National women’s helplines and police emergency numbers.\n'
              '- NGOs providing legal aid and shelter homes.',
            ),
            SizedBox(height: 20),
            Text(
              'Social Equality:\n'
              'Promoting equal access to education, jobs, and decision-making roles '
              'is essential to breaking the cycle of abuse.',
            ),
          ],
        ),
      ),
    );
  }
}
