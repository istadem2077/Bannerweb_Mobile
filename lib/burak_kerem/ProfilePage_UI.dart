import 'package:bannerweb_mobile/didar/ProfileHeaderCard.dart';
import 'package:bannerweb_mobile/ismayil/Routes.dart';
import 'package:bannerweb_mobile/ismayil/app_scaffold.dart';
import 'package:flutter/material.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentIndex: 2,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile Header Card
            const ProfileHeaderCard(),

            const SizedBox(height: 24),

            // Quick Info Section
            const Text(
              'Quick Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Info Cards
            _InfoCard(
              icon: Icons.school,
              title: 'Academic Status',
              value: 'Full-time',
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 12),
            _InfoCard(
              icon: Icons.calendar_today,
              title: 'Current Term',
              value: 'Fall 2024',
              color: Colors.orange,
            ),
            const SizedBox(height: 12),
            _InfoCard(
              icon: Icons.school,
              title: 'Faculty',
              value: 'Faculty of Engineering and Natural Sciences',
              color: Colors.teal,
            ),
            const SizedBox(height: 12),
            _InfoCard(
              icon: Icons.business,
              title: 'Department',
              value: 'Computer Science',
              color: Colors.deepOrange,
            ),

            const SizedBox(height: 24),

            // Quick Actions
            const Text(
              'Quick Actions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: _ActionButton(
                    icon: Icons.schedule,
                    label: 'Schedule',
                    color: Theme.of(context).colorScheme.primary,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.registration);
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _ActionButton(
                    icon: Icons.assignment,
                    label: 'Grades',
                    color: Colors.orange,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.studentRecords);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _ActionButton(
                    icon: Icons.account_balance_wallet,
                    label: 'Financial Aid',
                    color: Colors.green,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.financialAid);
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _ActionButton(
                    icon: Icons.home,
                    label: 'Housing',
                    color: Colors.purple,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.housing);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _ActionButton(
                    icon: Icons.event,
                    label: 'Final Exam Schedule',
                    color: Colors.red,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.finalExamSchedule);
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _ActionButton(
                    icon: Icons.settings,
                    label: 'Settings',
                    color: Colors.grey,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.settings);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
