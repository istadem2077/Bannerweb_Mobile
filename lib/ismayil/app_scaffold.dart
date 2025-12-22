import 'package:bannerweb_mobile/ismayil/Routes.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final int currentIndex;
  final Widget body;

  const AppScaffold({
    super.key,
    required this.currentIndex,
    required this.body,
  });

  void _onTapNav(BuildContext context, int index) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, AppRoutes.home);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, AppRoutes.search);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, AppRoutes.student);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(child: body),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => _onTapNav(context, i),
        // --- Theming Updates ---
        // Sets a dark background for dark mode, white for light mode
        backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,

        // Adjusts selected color for better visibility on dark backgrounds
        selectedItemColor: isDark
            ? Colors.blueAccent
            : Theme.of(context).primaryColor,

        // Adjusts unselected icons to be visible against the dark background
        unselectedItemColor: isDark ? Colors.grey[400] : Colors.grey,

        // Ensures the background color applies correctly
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Student',
          ),
        ],
      ),
    );
  }
}
