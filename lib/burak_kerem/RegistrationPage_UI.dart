import 'package:bannerweb_mobile/providers/ismayil/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ismayil/Routes.dart';

class RegistrationScreen extends StatelessWidget {
  static const String routeName = '/registration';

  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final registrationOptions = const [
      'Select Term',
      'Add/Drop Classes',
      'Look-up Classes to Add',
      'Student Schedule by Day & Time',
      'Student Detail Schedule',
      'Check Your Registration Status',
      'Request to Withdrawal Form',
      'Request to Course Substitution Form',
      'Application for Course Registration Override',
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: null,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Registration',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD700),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      auth.fullName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Student ID: ${auth.studentId}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: registrationOptions.map((option) {
                    return _RegistrationMenuItem(
                      title: option,
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.courseinfoex);
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegistrationMenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _RegistrationMenuItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            const Text(
              '>',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1155CC),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1155CC),
                  letterSpacing: 0.2,
                ),
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey.shade600, size: 20),
          ],
        ),
      ),
    );
  }
}
