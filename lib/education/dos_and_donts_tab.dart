import 'package:flutter/material.dart';

class DosAndDontsTab extends StatelessWidget {
  const DosAndDontsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: const [
          Text(
            "Do's",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text("• Maintain hygiene by changing pads regularly."),
          Text("• Stay hydrated and eat nutritious food."),
          Text("• Practice light exercise or yoga."),
          Text("• Track your cycle using an app or calendar."),
          SizedBox(height: 20),
          Text(
            "Don'ts",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text("• Don’t use the same sanitary product for too long."),
          Text("• Avoid junk food and caffeine in excess."),
          Text("• Don’t ignore extreme pain or irregularities."),
          Text("• Don’t believe in harmful myths or taboos."),
        ],
      ),
    );
  }
}
