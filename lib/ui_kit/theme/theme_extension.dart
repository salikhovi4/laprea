import 'package:flutter/material.dart';
import 'package:laprea/ui_kit/theme/theme.dart';

extension ThemeExtensions on BuildContext {
  /// Returns the current [ThemeData].
  ThemeData get theme => Theme.of(this);

  /// Returns the current [ColorScheme].
  ColorScheme get colorScheme => theme.colorScheme;

  /// Usable
  bool get isDarkMode => theme.brightness == Brightness.dark;
  Color get themePrimaryColor => isDarkMode ? Colors.white : UiColors.primary;
  Color get themePrimaryColorReverse => isDarkMode ? UiColors.primary : Colors.white;
  Color get themeBgColor => isDarkMode ? UiColors.surface : UiColors.surface;
  Color get themeSecondaryBgColor => isDarkMode ? UiColors.accentSecondary : UiColors.accentSecondary;
  Brightness get brightness => isDarkMode ? Brightness.dark : Brightness.light;
}
