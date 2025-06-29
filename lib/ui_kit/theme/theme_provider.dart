import 'package:common/di/get_it.dart';
import 'package:flutter/material.dart';
import 'package:service/service_flutter.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  ThemeNotifier() {
    _loadTheme();
  }

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _saveTheme(_themeMode);
    notifyListeners();
  }

  void setTheme(ThemeMode mode) {
    _themeMode = mode;
    _saveTheme(mode);
    notifyListeners();
  }

  Future<void> _loadTheme() async {
    //TODO Динар посмотри на говнокод
    final storageInteractor = getIt<StorageInteractor>();
    final themeString = await storageInteractor.readValue<String>('theme_mode');
    //
    if (themeString == 'dark') {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }

  Future<void> _saveTheme(ThemeMode mode) async {
    final themeString = mode == ThemeMode.dark ? 'dark' : 'light';
    //TODO Динар посмотри на говнокод
    final storageInteractor = getIt<StorageInteractor>();
    await storageInteractor.setValue('theme_mode', themeString);
  }
}

class ThemeInheritedNotifier extends InheritedNotifier<ThemeNotifier> {
  const ThemeInheritedNotifier({required ThemeNotifier super.notifier, required super.child, super.key});

  static ThemeNotifier of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeInheritedNotifier>()!.notifier!;
  }
}
