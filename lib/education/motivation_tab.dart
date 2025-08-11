import 'package:flutter/material.dart';

class MotivationTab extends StatelessWidget {
  const MotivationTab({super.key});

  Widget buildCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 36, color: color),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 15, height: 1.5),
                  ),
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
              'Emotional & Mental Strength',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
            buildCard(
              icon: Icons.health_and_safety,
              color: primaryColor,
              title: 'Prioritize Your Safety',
              description:
                  'Your safety and dignity come first. Always speak up if you feel threatened and seek support from trusted people.',
            ),
            buildCard(
              icon: Icons.self_improvement,
              color: primaryColor,
              title: 'Self-Care Habits',
              description: '• Eat nutritious meals and stay hydrated.\n'
                  '• Maintain regular sleep patterns.\n'
                  '• Incorporate physical activity, even gentle walks.\n'
                  '• Practice mindfulness or meditation for calmness.',
            ),
            buildCard(
              icon: Icons.group,
              color: primaryColor,
              title: 'Build a Support Network',
              description:
                  'Surround yourself with positive, supportive people who uplift you emotionally and mentally. Community matters.',
            ),
            buildCard(
              icon: Icons.mic,
              color: primaryColor,
              title: 'Use Your Voice',
              description:
                  'Speak out against injustice and unsafe situations. Your voice is powerful and can inspire others to take action.',
            ),
            buildCard(
              icon: Icons.emoji_events,
              color: primaryColor,
              title: 'Celebrate Small Wins',
              description:
                  'Every step forward is progress. Recognize and reward yourself for achievements, no matter how small.',
            ),
            buildCard(
              icon: Icons.lightbulb,
              color: primaryColor,
              title: 'Positive Mindset',
              description:
                  'Replace negative thoughts with positive affirmations like "I am strong," and "I deserve happiness."',
            ),
            buildCard(
              icon: Icons.schedule,
              color: primaryColor,
              title: 'Set Realistic Goals',
              description:
                  'Break down your larger goals into smaller, manageable tasks. Celebrate progress regularly to stay motivated.',
            ),
            buildCard(
              icon: Icons.support_agent,
              color: primaryColor,
              title: 'Seek Professional Help',
              description:
                  'It’s okay to ask for help. Therapists, counselors, and support groups are valuable resources on your healing journey.',
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                '“You are stronger than you think. Your voice can inspire change.”',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 18,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Remember:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Healing is not linear. It takes time, patience, and self-compassion. You’re not alone, and every step forward is a victory.',
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}
