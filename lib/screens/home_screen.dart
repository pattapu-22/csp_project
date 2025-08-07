import 'package:flutter/material.dart';
import 'package:empower_safe/screens/report_screen.dart';
import 'package:empower_safe/screens/resources_screen.dart';
import 'package:empower_safe/screens/forum_screen.dart';
import 'package:empower_safe/screens/education_screen.dart';
import 'package:empower_safe/widgets/sos_button.dart';
import '../services/firebase_service.dart';
import 'package:empower_safe/utils/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseService firebaseService = FirebaseService();
    firebaseService.signInAnonymously();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EmpowerSafe',
          style: TextStyle(color: Colors.white), // White text for app bar title
        ),
        backgroundColor:
            AppTheme.primaryColor, // Use primary color from AppTheme
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white, // White logout icon
            ),
            tooltip: 'Logout',
            onPressed: () async {
              await firebaseService.signOut();
              // After logout, navigate to login screen
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/landing',
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Align left
          children: [
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                'Welcome to EmpowerSafe!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryColor,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SOSButton(),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20.0), // Increased padding
              crossAxisSpacing: 20.0, // Horizontal spacing between cards
              mainAxisSpacing: 20.0, // Vertical spacing between cards
              children: [
                _buildCard(
                  context,
                  'Report Incident',
                  Icons.report,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ReportScreen(),
                      ),
                    );
                  },
                ),
                _buildCard(
                  context,
                  'Resources',
                  Icons.book,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ResourcesScreen(),
                      ),
                    );
                  },
                ),
                _buildCard(
                  context,
                  'Community Forum',
                  Icons.forum,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ForumScreen(),
                      ),
                    );
                  },
                ),
                _buildCard(
                  context,
                  'Education Screen',
                  Icons.cast_for_education_sharp,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const EducationScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Card(
      elevation: 8,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: AppTheme.primaryColor, // Primary color for icons
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: AppTheme.primaryColor, // Primary color for text
              ),
            ),
          ],
        ),
      ),
    );
  }
}
