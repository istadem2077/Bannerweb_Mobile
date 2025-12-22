import 'package:flutter/material.dart';
import 'ProfileHeaderCard.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings';

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Settings', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Reusable Profile Header Card
            const ProfileHeaderCard(),

            const SizedBox(height: 24),

            // Language Selection
            const Text(
              'Language',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            const _LanguageSelector(),

            const SizedBox(height: 24),

            // Dark Mode Toggle (static)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark Mode',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Icon(Icons.dark_mode, color: Colors.grey),
              ],
            ),

            const SizedBox(height: 32),

            // Logout Button
            OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Logging out...')));
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.red, width: 2),
                padding: const EdgeInsets.all(16),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageSelector extends StatelessWidget {
  const _LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(10),
              ),
            ),
            child: const Text("English", style: TextStyle(color: Colors.white)),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(10),
              ),
            ),
            child: const Text("Türkçe", style: TextStyle(color: Colors.black)),
          ),
        ),
      ],
    );
  }
}
