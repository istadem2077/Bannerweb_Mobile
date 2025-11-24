import 'package:bannerweb_mobile/ismayil/Routes.dart';
import 'package:flutter/material.dart';

class StudentHelpScreen extends StatelessWidget {
  const StudentHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Help'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildHelpButton(context, 'Final Exams Schedule', () {
              Navigator.pushNamed(context, AppRoutes.finals);
            }),
            const SizedBox(height: 15),
            _buildHelpButton(context, 'Student Petition Form', () {}),
            const SizedBox(height: 15),
            _buildHelpButton(context, 'Information System User Guide', () {}),
            const SizedBox(height: 15),
            _buildHelpButton(context, 'Dormitory Application Results', () {}),
            const SizedBox(height: 15),
            _buildHelpButton(context, 'Alumni Connect', () {}),
            const SizedBox(height: 60),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 15,
                ),
                side: BorderSide(color: Theme.of(context).colorScheme.primary),
              ),
              child: Text(
                'Back',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpButton(
    BuildContext context,
    String text,
    VoidCallback onPressed,
  ) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        side: BorderSide(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      ),
    );
  }
}
