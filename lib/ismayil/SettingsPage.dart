import 'package:bannerweb_mobile/didar/ProfileHeaderCard.dart'; // 1. Fixed Import
import 'package:bannerweb_mobile/ismayil/Routes.dart';
import 'package:bannerweb_mobile/ismayil/app_scaffold.dart';
import 'package:bannerweb_mobile/providers/ismayil/auth_provider.dart';
import 'package:bannerweb_mobile/providers/ismayil/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false;
  int _selectedLanguage = 0; // 0 for English, 1 for Türkçe

  @override
  void initState() {
    super.initState();
    _loadThemeSettings(); // 2. Load settings when page opens
  }

  // Helper to load the saved state
  Future<void> _loadThemeSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // Default to false if no key exists
      _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentIndex: 2,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const ProfileHeaderCard(),
            const SizedBox(height: 40),
            Column(
              children: [
                _buildSectionHeader('Language'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildLanguageButton(0, 'English'),
                    const SizedBox(width: 20),
                    _buildLanguageButton(1, 'Türkçe'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSectionHeader('Dark Mode'),
                Switch(
                  value: Provider.of<ThemeProvider>(context).isDarkMode,
                  onChanged: (value) {
                    // This updates the provider, which updates main.dart, which updates the app
                    Provider.of<ThemeProvider>(
                      context,
                      listen: false,
                    ).toggleTheme(value);
                  },
                  activeColor: Colors.red,
                ),
              ],
            ),
            const Spacer(),
            OutlinedButton(
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.login,
                  (route) => false,
                );
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 15,
                ),
                side: const BorderSide(color: Colors.red, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    );
  }

  Widget _buildLanguageButton(int index, String text) {
    final isSelected = _selectedLanguage == index;
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _selectedLanguage = index;
        });
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected
            ? Colors.green.shade100
            : Colors.transparent,
        side: BorderSide(
          color: isSelected
              ? Colors.green
              : Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
          width: 1.5,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected
              ? Colors.green.shade800
              : Theme.of(context).textTheme.bodyLarge?.color,
          fontSize: 16,
        ),
      ),
    );
  }
}
