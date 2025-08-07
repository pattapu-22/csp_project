import 'package:flutter/material.dart';

import 'package:empower_safe/screens/report_screen.dart';
import 'package:empower_safe/screens/resources_screen.dart';
import 'package:empower_safe/screens/forum_screen.dart';
import 'package:empower_safe/screens/safety_score_screen.dart';
import 'package:empower_safe/widgets/sos_button.dart';
import 'package:empower_safe/constants.dart';
import '../services/firebase_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseService firebaseService = FirebaseService();
    firebaseService.signInAnonymously();

    return Scaffold(
      appBar: AppBar(
        title: const Text('EmpowerSafe'),
        backgroundColor: kPrimaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
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
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Welcome to EmpowerSafe!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SOSButton(),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildCard(context, 'Report Incident', Icons.report, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const ReportScreen()));
                }),
                _buildCard(context, 'Resources', Icons.book, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ResourcesScreen()));
                }),
                _buildCard(context, 'Community Forum', Icons.forum, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const ForumScreen()));
                }),
                _buildCard(context, 'Safety Score', Icons.score, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const SafetyScoreScreen()));
                }),
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
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: kAccentColor),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import 'package:empower_safe/screens/report_screen.dart';
// import 'package:empower_safe/screens/resources_screen.dart';
// import 'package:empower_safe/screens/forum_screen.dart';
// import 'package:empower_safe/screens/safety_score_screen.dart';
// import 'package:empower_safe/widgets/sos_button.dart';
// import 'package:empower_safe/utils/app_theme.dart';
// import '../services/firebase_service.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final FirebaseService firebaseService = FirebaseService();
//     firebaseService.signInAnonymously();
//
//     final user = FirebaseAuth.instance.currentUser;
//     final String userName =
//         user?.uid.substring(0, 6) ?? 'User'; // Just an example for anonymous
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'EmpowerSafe',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: AppTheme.primaryColor,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout, color: Colors.white),
//             tooltip: 'Logout',
//             onPressed: () async {
//               await firebaseService.signOut();
//               Navigator.pushNamedAndRemoveUntil(
//                 context,
//                 '/landing',
//                 (route) => false,
//               );
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: AppTheme.getBackgroundGradient(),
//         ),
//         child: Column(
//           children: [
//             Center(
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Container(
//                     width: 140,
//                     height: 140,
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.redAccent,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.red,
//                           blurRadius: 30,
//                           spreadRadius: 8,
//                         ),
//                       ],
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // TODO: Add SOS logic
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('SOS Activated')),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       shape: const CircleBorder(),
//                       backgroundColor: Colors.red,
//                       padding: const EdgeInsets.all(40),
//                       elevation: 8,
//                     ),
//                     child: const Text(
//                       'SOS',
//                       style: TextStyle(
//                         fontSize: 24,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 'Welcome to EmpowerSafe, $userName!',
//                 style:
//                     const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//             ),
//             Expanded(
//               child: ListView(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 children: [
//                   _buildFullCard(
//                     context,
//                     title: 'Report Incident',
//                     icon: Icons.report,
//                     onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (_) => const ReportScreen()),
//                     ),
//                   ),
//                   _buildFullCard(
//                     context,
//                     title: 'Resources',
//                     icon: Icons.book,
//                     onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (_) => const ResourcesScreen()),
//                     ),
//                   ),
//                   _buildFullCard(
//                     context,
//                     title: 'Community Forum',
//                     icon: Icons.forum,
//                     onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (_) => const ForumScreen()),
//                     ),
//                   ),
//                   _buildFullCard(
//                     context,
//                     title: 'Safety Score',
//                     icon: Icons.score,
//                     onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (_) => const SafetyScoreScreen()),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildFullCard(
//     BuildContext context, {
//     required String title,
//     required IconData icon,
//     required VoidCallback onTap,
//   }) {
//     return Card(
//       elevation: 6,
//       margin: const EdgeInsets.only(bottom: 16),
//       child: ListTile(
//         contentPadding: const EdgeInsets.all(20),
//         leading: Icon(icon, size: 36, color: AppTheme.secondaryColor),
//         title: Text(
//           title,
//           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//         onTap: onTap,
//         tileColor: Colors.white,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       ),
//     );
//   }
// }
