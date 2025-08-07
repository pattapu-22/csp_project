import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:empower_safe/constants.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resources'),
        backgroundColor: kPrimaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildResourceTile(
            context,
            'National Commission for Women',
            'http://ncw.nic.in',
            'Helpline: 1091',
          ),
          _buildResourceTile(
            context,
            'Women Safety Tips',
            'https://www.womensafety.gov.in',
            'Learn safety practices',
          ),
          _buildResourceTile(
            context,
            'Legal Aid Services',
            'https://nalsa.gov.in',
            'Free legal support',
          ),
        ],
      ),
    );
  }

  Widget _buildResourceTile(BuildContext context, String title, String url, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.open_in_new, color: kAccentColor),
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
    );
  }
}