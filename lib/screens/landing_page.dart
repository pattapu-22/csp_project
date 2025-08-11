import 'package:flutter/material.dart';
import '/components/custom_button.dart';
import '/utils/app_theme.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.getGradient(),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.favorite,
                size: 100,
                color: Colors.white,
              ),
              const SizedBox(height: 30),
              const Text(
                'Women Empowerment',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Empowering women to support and uplift each other in their journey towards success and equality.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    CustomButton(
                      text: 'Get Started',
                      onPressed: () => Navigator.pushNamed(context, '/signin'),
                      backgroundColor: Colors.white,
                      textColor: AppTheme.primaryColor,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'Already have an account? Login',
                      onPressed: () => Navigator.pushNamed(context, '/login'),
                      isOutlined: true,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      textColor: AppTheme.primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
