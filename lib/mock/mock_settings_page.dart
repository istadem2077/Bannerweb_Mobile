import 'package:flutter/material.dart';
import 'package:bannerweb_mobile/didar/ProfileHeaderCard.dart';
import 'package:bannerweb_mobile/ismayil/app_scaffold.dart';

class SettingsPageMock extends StatefulWidget {
  const SettingsPageMock({super.key});

  @override
  State<SettingsPageMock> createState() => _SettingsPageMockState();
}

class _SettingsPageMockState extends State<SettingsPageMock> {
  bool _isDarkMode = false; // Local mock state

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Dark Mode', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                Switch(
                  value: _isDarkMode,
                  onChanged: (value) => setState(() => _isDarkMode = value),
                  activeColor: Colors.red,
                ),
              ],
            ),
            const Spacer(),
            OutlinedButton(
              onPressed: () {
                debugPrint("Mock Logout Pressed");
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                side: const BorderSide(color: Colors.red, width: 2),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Logout', style: TextStyle(fontSize: 18, color: Colors.red)),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}