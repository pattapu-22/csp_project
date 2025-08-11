import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:empower_safe/screens/home_screen.dart';
import 'package:empower_safe/screens/landing_page.dart';
import 'package:empower_safe/screens/sign_in_page.dart';
import 'package:empower_safe/screens/login_page.dart';
import 'package:empower_safe/screens/education_screen.dart';
import 'package:empower_safe/screens/forum_screen.dart';
import 'package:empower_safe/screens/report_screen.dart';
import 'package:empower_safe/screens/resources_screen.dart';

import 'utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const EmpowerSafeApp());
}

class EmpowerSafeApp extends StatelessWidget {
  const EmpowerSafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Women Empowerment',
      theme: AppTheme.getTheme(),
      debugShowCheckedModeBanner: false,

      // Automatically navigate based on auth state
      home: AuthGate(),

      routes: {
        '/landing': (context) => const LandingPage(),
        '/signin': (context) => const SignInPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomeScreen(),
        '/education': (context) => const EducationScreen(),
        '/forum': (context) => const ForumScreen(),
        '/report': (context) => const ReportScreen(),
        '/resource': (context) => const ResourcesScreen(),
      },
    );
  }
}

class AuthGate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // User is signed in
      return const HomeScreen();
    } else {
      // User not signed in
      return const LandingPage();
    }
  }
}
