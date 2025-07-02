import 'package:flutter/material.dart';

/// colors
class UiColors {
  UiColors._();

  static const Color surface = Color(0xFFEAEBE1);
  static const Color card = Color(0xFFFCFDF9);
  static const Color inputFilled = Color(0xFFFCFDF9);
  static const Color selectSheetTextButton = Color(0xFFFCFDF9);
  static const Color primary = Color(0xFF3A2D20);
  static const Color secondary = Color(0xFF998D82);
  static const Color accent = Color(0xFF474E2D);
  static const Color accentSecondary = Color(0xFFCED2AE);
  static const Color pink = Color(0xFFF4D5C8);
  static const Color orange = Color(0xFFCC661D);
  static const Color elevatedButtonBackgroundColor1 = Color(0xFFCED2AE);
  static const Color elevatedButtonTextColor1 = Color(0xFF3F412E);
  static const Color hintTextColor = Color(0xFF8E8276);
  static const Color bonusCardColor = Color(0xFFDAE8F5);
  static const Color specialistRatingTextColor = Color(0xFF5D663E);
  static const Color appointmentEditColor = Color(0xFF8E8276);
}

class ThemeConfiguration {
  static final bottomSheetThemeLight = const BottomSheetThemeData(
    backgroundColor: UiColors.card,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(24)),
    ),
  );

  static final light = ThemeData(
    fontFamily: 'Manrope',
    brightness: Brightness.light,
    scaffoldBackgroundColor: UiColors.surface,
    inputDecorationTheme: const InputDecorationTheme(fillColor: UiColors.inputFilled),
    bottomSheetTheme: bottomSheetThemeLight,
  );

  static final dark = ThemeData(
    fontFamily: 'Manrope',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: UiColors.surface,
    inputDecorationTheme: const InputDecorationTheme(fillColor: UiColors.inputFilled),
    bottomSheetTheme: bottomSheetThemeLight,
  );
}
