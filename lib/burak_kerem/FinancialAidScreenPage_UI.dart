import 'package:flutter/material.dart';

class FinancialAidScreen extends StatelessWidget {
  static const String routeName = '/financial-aid';

  const FinancialAidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final financialAidSections = const [
      _FinancialAidSection(
        title: 'My Eligibility',
        description:
            'Review Financial Aid Holds (which may prevent payment of awards) and document requirements; Display academic progress history; View academic transcript.',
      ),
      _FinancialAidSection(
        title: 'My Award Information',
        description:
            'View account summary; Review awards by aid year; Accept award offers by aid year; Review award history; Display award payment schedule; View history of loan applications.',
      ),
      _FinancialAidSection(
        title: 'Scholarship, Financial Aid and Part-time Job Applications',
        description:
            'In order to apply for Financial Aid Scholarship, other private scholarships and Part-time Jobs you must fill in the application form. To display your applications click \'My Prior Application\', to display application announcements click \'Scholarship, Financial Aid and Part-time Job Announcements\', for manual click \'View Manual\'.',
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
              // Header Section
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Financial Aid Title
                    const Text(
                      'Financial Aid',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Yellow-green horizontal line
                    Container(
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color(0xFFADFF2F), // Yellow-green color
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Content Sections
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: financialAidSections.map((section) {
                    return _FinancialAidSectionWidget(
                      section: section,
                      onTap: () {
                        // TODO: Navigate to specific financial aid feature
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Selected: ${section.title}'),
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

class _FinancialAidSection {
  final String title;
  final String description;

  const _FinancialAidSection({required this.title, required this.description});
}

class _FinancialAidSectionWidget extends StatelessWidget {
  final _FinancialAidSection section;
  final VoidCallback onTap;

  const _FinancialAidSectionWidget({
    required this.section,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section title with ">" prefix
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Orange-brown ">" prefix
                const Text(
                  '>',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFCD853F), // Orange-brown color
                  ),
                ),
                const SizedBox(width: 8),
                // Section title in blue bold
                Expanded(
                  child: Text(
                    section.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1155CC),
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Description text in black
            Padding(
              padding: const EdgeInsets.only(left: 26),
              child: Text(
                section.description,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
