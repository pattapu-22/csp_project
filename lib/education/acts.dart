import 'package:flutter/material.dart';

class LawsProtectionTab extends StatelessWidget {
  const LawsProtectionTab({super.key});

  Widget buildCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(description,
                      style: const TextStyle(fontSize: 14, height: 1.4)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Know Your Rights & Protections',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
            buildCard(
              icon: Icons.home,
              title: 'Domestic Violence Laws',
              color: primaryColor,
              description: '• Protection orders to keep abusers away.\n'
                  '• Right to safe housing, emergency shelter, and counseling.\n'
                  '• Law enforcement must respond promptly to complaints.\n'
                  '• Financial support provisions for survivors in certain cases.',
            ),
            buildCard(
              icon: Icons.security,
              title: 'Sexual Harassment Laws',
              color: primaryColor,
              description:
                  '• Protection against harassment at work, schools, and public places.\n'
                  '• Confidential complaint mechanisms.\n'
                  '• Mandatory internal complaints committees at workplaces.\n'
                  '• Strict penalties for offenders, including dismissal from jobs.',
            ),
            buildCard(
              icon: Icons.balance,
              title: 'Equal Opportunity & Anti-Discrimination Laws',
              color: primaryColor,
              description: '• Equal pay for equal work.\n'
                  '• No discrimination in hiring, promotions, or benefits based on gender.\n'
                  '• Right to maternity leave and related protections.\n'
                  '• Access to education and vocational training without bias.',
            ),
            buildCard(
              icon: Icons.phone_in_talk,
              title: 'Reporting & Helplines',
              color: primaryColor,
              description: '• National women’s helpline: 181.\n'
                  '• Police emergency: 100.\n'
                  '• Cybercrime helpline: 155260.\n'
                  '• NGOs offering free legal aid, medical help, and safe shelters.',
            ),
            buildCard(
              icon: Icons.people,
              title: 'Social Equality & Empowerment',
              color: primaryColor,
              description:
                  '• Equal participation in politics, leadership, and decision-making.\n'
                  '• Access to education, jobs, and business opportunities.\n'
                  '• Community awareness programs to challenge harmful stereotypes.',
            ),
            buildCard(
              icon: Icons.gavel,
              title: 'Legal Aid & Support',
              color: primaryColor,
              description:
                  '• Free legal assistance through government and NGO programs.\n'
                  '• Victim & witness protection schemes.\n'
                  '• Fast-track courts for gender-based violence cases.',
            ),
            const SizedBox(height: 10),
            Text(
              'Remember: Laws are only effective if they are enforced. Knowing your rights empowers you to take action and seek justice.',
              style: TextStyle(
                  fontStyle: FontStyle.italic, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
