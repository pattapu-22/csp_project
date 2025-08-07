import 'package:flutter/material.dart';
import 'package:empower_safe/constants.dart';

class SafetyScoreScreen extends StatefulWidget {
  const SafetyScoreScreen({super.key});

  @override
  _SafetyScoreScreenState createState() => _SafetyScoreScreenState();
}

class _SafetyScoreScreenState extends State<SafetyScoreScreen> {
  int score = 0;
  final questions = [
    {'question': 'Do you know local emergency numbers?', 'value': 20},
    {
      'question': 'Do you avoid sharing personal details publicly?',
      'value': 30
    },
    {'question': 'Do you know self-defense techniques?', 'value': 50},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safety Score'),
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Answer these questions to get your Safety Score!'),
          ),
          ...questions
              .map((q) => CheckboxListTile(
                    title: Text(q['question'] as String),
                    value: (q['checked'] as bool?) ?? false,
                    onChanged: (value) {
                      setState(() {
                        q['checked'] = value as Object;
                        score = questions.fold(
                            0,
                            (sum, item) =>
                                sum +
                                ((item['checked'] as bool?) ?? false
                                    ? (item['value'] as int)
                                    : 0));
                      });
                    },
                  ))
              .toList(),
          Text('Your Safety Score: $score',
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          if (score < 50)
            const Text(
                'Tip: Learn more safety practices in the Resources section!'),
        ],
      ),
    );
  }
}
