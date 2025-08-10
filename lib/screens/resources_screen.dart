import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:empower_safe/constants.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

  Future<void> _launchPhone(String phone) async {
    final Uri uri = Uri(scheme: 'tel', path: phone);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $phone');
    }
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _buildResourceCard({
    required String title,
    required String description,
    required IconData icon,
    String? phone,
    String? url,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: kPrimaryColor, size: 30),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: url != null
            ? const Icon(Icons.open_in_new, color: kPrimaryColor)
            : null,
        onTap: () {
          if (phone != null) {
            _launchPhone(phone);
          } else if (url != null) {
            _launchURL(url);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resources'),
        backgroundColor: kPrimaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Emergency Helplines",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          _buildResourceCard(
            title: "Women Helpline (All India)",
            description: "Call for immediate help - 24/7 service",
            icon: Icons.phone_in_talk,
            phone: "1091",
          ),
          _buildResourceCard(
            title: "Police Emergency",
            description: "Call police for urgent help",
            icon: Icons.local_police,
            phone: "100",
          ),
          const SizedBox(height: 16),
          const Text(
            "Government & Legal Support",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          _buildResourceCard(
            title: "National Commission for Women",
            description:
                "Official government portal for women's safety and support",
            icon: Icons.account_balance,
            url: "https://www.ncw.gov.in/",
          ),
          _buildResourceCard(
            title: "Free Legal Aid - NALSA",
            description: "Access free legal services and advice",
            icon: Icons.gavel,
            url: "https://nalsa.gov.in",
          ),
          const SizedBox(height: 16),
          const Text(
            "Safety & Awareness",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          _buildResourceCard(
            title: "Women Safety Tips",
            description: "Learn safety practices and emergency responses",
            icon: Icons.shield,
            url:
                "https://www.placer.ca.gov/8848/Violence-against-women-general-safety-ti",
          ),
          _buildResourceCard(
            title: "One Stop Centres",
            description: "Support for women affected by violence",
            icon: Icons.support,
            url: "https://wdcw.ap.gov.in/Institutions/OSC ",
          ),
          const SizedBox(height: 16),
          const Text(
            "Mental Health & Counselling",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          _buildResourceCard(
            title: "iCall Helpline",
            description: "Mental health support for women",
            icon: Icons.health_and_safety,
            phone: "9152987821",
          ),
          _buildResourceCard(
            title: "Vandrevala Foundation Helpline",
            description: "24x7 Mental health counselling",
            icon: Icons.psychology,
            phone: "1860 266 2345",
          ),
        ],
      ),
    );
  }
}
