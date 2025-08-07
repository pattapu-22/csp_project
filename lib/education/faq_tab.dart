import 'package:flutter/material.dart';

class FAQsTab extends StatelessWidget {
  const FAQsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        ExpansionTile(
          title: Text("Is menstruation normal?"),
          children: [Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Yes, it is a completely natural and healthy process."),
          )],
        ),
        ExpansionTile(
          title: Text("How often should I change my pad?"),
          children: [Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Every 4 to 6 hours, or when it feels full."),
          )],
        ),
        ExpansionTile(
          title: Text("Can I exercise during periods?"),
          children: [Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Yes! Light exercise can help relieve cramps and boost mood."),
          )],
        ),
        ExpansionTile(
          title: Text("What should I eat during my period?"),
          children: [Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Iron-rich foods, fruits, vegetables, and plenty of water."),
          )],
        ),
      ],
    );
  }
}
