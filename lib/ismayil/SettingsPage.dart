import 'package:bannerweb_mobile/ismayil/Routes.dart';
import 'package:bannerweb_mobile/ismayil/app_scaffold.dart';
import 'package:bannerweb_mobile/main.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false;
  int _selectedLanguage = 0; // 0 for English, 1 for Türkçe

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentIndex: 2, // Assuming it's part of the student section
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              '[STUDENT NAME]',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              '00000000',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 40),
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
            const SizedBox(height: 30),
            _buildSectionHeader('Dark Mode'),
            const SizedBox(height: 10),
            Switch(
              value: _isDarkMode,
              onChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                });
                BannerWebApp.of(
                  context,
                )?.changeTheme(value ? ThemeMode.dark : ThemeMode.light);
              },
              activeColor: Colors.red,
            ),
            const Spacer(),
            OutlinedButton(
              onPressed: () {
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
