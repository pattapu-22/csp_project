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
        ExpansionTile(
          title: Text("What are common signs of abuse?"),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Signs include unexplained injuries, withdrawal from friends/family, fearfulness, changes in behavior or mood."),
            )
          ],
        ),
        ExpansionTile(
          title: Text("Is counseling helpful after trauma?"),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Yes, counseling or therapy can support healing, provide coping strategies, and help regain confidence."),
            )
          ],
        ),
        ExpansionTile(
          title: Text("What emergency numbers should I keep handy?"),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Keep numbers like national women’s helpline, police emergency, medical emergency, and trusted NGOs saved on your phone."),
            )
          ],
        ),
        ExpansionTile(
          title: Text("Can I get protection orders?"),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Yes, many jurisdictions allow victims to apply for protection or restraining orders against abusers."),
            )
          ],
        ),
        ExpansionTile(
          title: Text("Are there helplines for cyber harassment?"),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Yes, many countries have dedicated cybercrime helplines to report online abuse and harassment."),
            )
          ],
        ),
        ExpansionTile(
          title: Text("What if I don’t trust the police?"),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Reach out to NGOs or legal aid groups who can assist with reporting and offer protection."),
            )
          ],
        ),
      ],
    );
  }
}
