import 'package:flutter/material.dart';
import 'package:empower_safe/education/overview_tab.dart';
import 'package:empower_safe/education/laws_protection_tab.dart';
import 'package:empower_safe/education/motivation_tab.dart';
import 'package:empower_safe/education/faq_tab.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Empowering Women Against Violence'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Overview'),
              Tab(text: 'Laws & Rights'),
              Tab(text: 'Motivation'),
              Tab(text: 'FAQs'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            OverviewTab(),
            LawsProtectionTab(),
            MotivationTab(),
            FAQsTab(),
          ],
        ),
      ),
    );
  }
}
