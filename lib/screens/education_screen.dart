import 'package:flutter/material.dart';
import 'package:empower_safe/education/overview_tab.dart';
import 'package:empower_safe/education/acts.dart';
import 'package:empower_safe/education/motivation_tab.dart';
import 'package:empower_safe/education/faq_tab.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Education',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: primaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          bottom: const TabBar(
            //isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Overview'),
              Tab(text: 'Acts'),
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
