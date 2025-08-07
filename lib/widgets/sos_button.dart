import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:empower_safe/constants.dart';

class SOSButton extends StatelessWidget {
  const SOSButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
        ),
        onPressed: () async {
          final uri = Uri.parse('tel:1091'); // Women's helpline in India
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
        child: const Text('SOS', style: TextStyle(fontSize: 24, color: Colors.white)),
      ),
    );
  }
}