import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF8750BA);
  static const Color secondaryColor = Color(0xFF9A72A5);
  static const Color tertiaryColor = Color(0xFFFFFFFF);
  static const Color lightBackground = Color(0xFFC8C4C8);

  static ThemeData getTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static LinearGradient getGradient() {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [primaryColor, secondaryColor, tertiaryColor],
    );
  }

  static LinearGradient getCardGradient() {
    return const LinearGradient(
      colors: [primaryColor, secondaryColor],
    );
  }

  static LinearGradient getBackgroundGradient() {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [lightBackground, Colors.white],
    );
  }
}
