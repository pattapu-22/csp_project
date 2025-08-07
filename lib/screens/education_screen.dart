import 'package:flutter/material.dart';
import 'package:empower_safe/education/overview_tab.dart';
import 'package:empower_safe/education/cycle_phases_tab.dart';
import 'package:empower_safe/education/dos_and_donts_tab.dart';
import 'package:empower_safe/education/faq_tab.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Menstrual Health Education'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Overview'),
              Tab(text: 'Cycle Phases'),
              Tab(text: "Do's & Don'ts"),
              Tab(text: 'FAQs'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            OverviewTab(),
            CyclePhasesTab(),
            DosAndDontsTab(),
            FAQsTab(),
          ],
        ),
      ),
    );
  }
}
