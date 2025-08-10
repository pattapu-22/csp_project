import 'package:flutter/material.dart';

class FAQsTab extends StatelessWidget {
  const FAQsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        ExpansionTile(
          title: Text("What should I do if I face violence?"),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Ensure you are safe first. Contact trusted people or helplines, and report the incident to authorities."),
            )
          ],
        ),
        ExpansionTile(
          title: Text("Can I report anonymously?"),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "In many regions, yes. Check local police or NGO services for anonymous reporting options."),
            )
          ],
        ),
        ExpansionTile(
          title: Text("Where can I find legal help?"),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Contact women’s legal aid centers, NGOs, or government helplines for free or low-cost assistance."),
            )
          ],
        ),
        ExpansionTile(
          title: Text("How can I help someone facing abuse?"),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Listen without judgment, offer emotional support, and guide them towards professional help."),
            )
          ],
        ),
      ],
    );
  }
}
