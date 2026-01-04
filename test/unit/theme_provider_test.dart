import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bannerweb_mobile/providers/ismayil/theme_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ThemeProvider Tests', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    test('Initial theme mode is light', () {
      final provider = ThemeProvider();
      expect(provider.themeMode, ThemeMode.light);
      expect(provider.isDarkMode, false);
    });

    test('Toggle theme to dark changes state and notifies listeners', () async {
      final provider = ThemeProvider();
      bool listenerCalled = false;
      provider.addListener(() {
        listenerCalled = true;
      });

      provider.toggleTheme(true);

      expect(provider.themeMode, ThemeMode.dark);
      expect(provider.isDarkMode, true);
      expect(listenerCalled, true);
    });

    test('Toggle theme back to light works', () async {
      final provider = ThemeProvider();
      provider.toggleTheme(true); // First set to dark

      provider.toggleTheme(false); // Then back to light

      expect(provider.themeMode, ThemeMode.light);
      expect(provider.isDarkMode, false);
    });
  });
}
