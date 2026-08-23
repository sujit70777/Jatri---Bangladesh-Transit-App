import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Jatri's color system, matching the palette documented in the
/// "Green Theme Recreation" Figma reference file.
class AppColors {
  static const primary = Color(0xFF006A4E);
  static const primaryPressed = Color(0xFF00543E);
  static const illustrationMid = Color(0xFF2FA37F);
  static const surfaceTint = Color(0xFFE0F2EC);
  static const cardTint = Color(0xFFE9F3F0);
  static const alert = Color(0xFFDC0451);
  static const illustrationLine = Color(0xFFF26D21);
  static const text = Color(0xFF1A1A1A);
  static const textMuted = Color(0xFF6E7370);
  static const border = Color(0xFFE6E8E6);
  static const surface = Color(0xFFF6F7F6);

  // Mode colors, kept distinct from brand chrome (wayfinding only)
  static const modeBus = Color(0xFF2166D6);
  static const modeMetro = Color(0xFFE8792D);
  static const modeTrain = Color(0xFF7B3FC4);
  static const modeLaunch = Color(0xFF16A0C4);
}

class AppTheme {
  static ThemeData get light {
    final base = ThemeData(useMaterial3: true, colorSchemeSeed: AppColors.primary);
    return base.copyWith(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.primary,
        error: AppColors.alert,
        surface: Colors.white,
      ),
      textTheme: GoogleFonts.nunitoTextTheme(base.textTheme).apply(
        bodyColor: AppColors.text,
        displayColor: AppColors.text,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.text,
        elevation: 0,
        centerTitle: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          textStyle: GoogleFonts.nunito(fontSize: 15, fontWeight: FontWeight.w700),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textMuted,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      dividerTheme: const DividerThemeData(color: AppColors.border, thickness: 1),
    );
  }
}
