import 'package:bannerweb_mobile/providers/ismayil/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DegreeAuditScreen extends StatelessWidget {
  static const String routeName = '/degree-audit';

  const DegreeAuditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final degreeAuditItems = const [
      _DegreeAuditItem(
        title: 'Major Declaration for Undergraduate Student',
        description:
            'Complete your Final Major Declaration, view your all Major Declarations.',
        isRed: false,
      ),
      _DegreeAuditItem(
        title: 'Graduation Application Form',
        description: null,
        isRed: false,
      ),
      _DegreeAuditItem(
        title: 'Degree Evaluation (Summary)',
        description: null,
        isRed: true,
      ),
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
                      'Degree Audit and Graduation',
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
                        color: const Color(0xFFADFF2F),
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
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: degreeAuditItems.map((item) {
                    return _DegreeAuditItemWidget(
                      item: item,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Selected: ${item.title}'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
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

class _DegreeAuditItem {
  final String title;
  final String? description;
  final bool isRed;

  const _DegreeAuditItem({
    required this.title,
    this.description,
    required this.isRed,
  });
}

class _DegreeAuditItemWidget extends StatelessWidget {
  final _DegreeAuditItem item;
  final VoidCallback onTap;

  const _DegreeAuditItemWidget({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '>',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFCD853F),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: item.isRed ? Colors.red : const Color(0xFF1155CC),
                      letterSpacing: 0.2,
                      decoration: item.isRed
                          ? TextDecoration.underline
                          : TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
            if (item.description != null) ...[
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 26),
                child: Text(
                  item.description!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
