import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../burak_kerem/ProfilePage_UI.dart'; 

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings';

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final studentData = Provider.of<StudentData>(context);
    final Color textColor = studentData.isDarkModeEnabled ? Colors.white : Colors.black;
    final Color subtitleColor = studentData.isDarkModeEnabled ? Colors.white70 : Colors.black54;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Settings',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: textColor),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Info card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(studentData.studentName,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor)),
                      const SizedBox(height: 4),
                      Text(studentData.studentId, style: TextStyle(color: subtitleColor)),
                      const SizedBox(height: 4),
                      Text(studentData.status, style: TextStyle(color: subtitleColor)),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Language
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Language',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor)),
                  const SizedBox(height: 12),
                  _LanguageSelector(
                    selectedLanguage: studentData.selectedLanguage,
                    onLanguageSelected: (lang) => studentData.setLanguage(lang),
                  ),
                  const SizedBox(height: 24),

                  // Dark mode
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Dark Mode',
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor)),
                      Switch(
                        value: studentData.isDarkModeEnabled,
                        onChanged: (value) => studentData.toggleDarkMode(value),
                      )
                    ],
                  ),

                  const SizedBox(height: 32),

                  OutlinedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Logging out...')),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.red, width: 2),
                      padding: const EdgeInsets.all(16),
                    ),
                    child: const Text('Logout',
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _LanguageSelector extends StatelessWidget {
  final String selectedLanguage;
  final ValueChanged<String> onLanguageSelected;

  const _LanguageSelector({
    required this.selectedLanguage,
    required this.onLanguageSelected,
  });

  @override
  Widget build(BuildContext context) {
    final studentData = Provider.of<StudentData>(context);

    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () => onLanguageSelected("English"),
            child: Container(
              padding: const EdgeInsets.all(12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selectedLanguage == "English"
                    ? Theme.of(context).primaryColor
                    : Colors.grey.shade300,
                borderRadius: const BorderRadius.horizontal(left: Radius.circular(10)),
              ),
              child: Text(
                "English",
                style: TextStyle(
                    color: selectedLanguage == "English" ? Colors.white : Colors.black),
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () => onLanguageSelected("Turkish"),
            child: Container(
              padding: const EdgeInsets.all(12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selectedLanguage == "Turkish"
                    ? Theme.of(context).primaryColor
                    : Colors.grey.shade300,
                borderRadius: const BorderRadius.horizontal(right: Radius.circular(10)),
              ),
              child: Text(
                "Türkçe",
                style: TextStyle(
                    color: selectedLanguage == "Turkish" ? Colors.white : Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
