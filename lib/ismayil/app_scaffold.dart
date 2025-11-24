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
    return Scaffold(
      body: SafeArea(child: body),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => _onTapNav(context, i),
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).unselectedWidgetColor,
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
