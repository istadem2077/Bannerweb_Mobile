class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final options = [
      const _HomeOption(
        title: 'Registration',
        subtitle: 'View/print schedule; add/drop; view classes.',
      ),
      const _HomeOption(
        title: 'Student Records',
        subtitle: 'Grades, transcripts, charges and payments.',
      ),
      const _HomeOption(
        title: 'Financial Aid',
        subtitle: 'Aid status; requirements; reviews.',
      ),
      const _HomeOption(
        title: 'Housing',
        subtitle: 'Dormitory applications; residence info.',
      ),
      const _HomeOption(
        title: 'Degree Audit & Graduation',
        subtitle: 'Degree audit and graduation progress.',
      ),
    ];

    return AppScaffold(
      currentIndex: 0,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Sabancı University Logo Banner
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Sabancı Logo Box
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF003366), // Dark blue
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text('•', style: TextStyle(color: Colors.white, fontSize: 8)),
                            const SizedBox(width: 4),
                            const Text('•', style: TextStyle(color: Colors.white, fontSize: 8)),
                            const SizedBox(width: 4),
                            const Text(
                              'Sabancı',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text('•', style: TextStyle(color: Colors.white, fontSize: 8)),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            const Text('•', style: TextStyle(color: Colors.white, fontSize: 8)),
                            const SizedBox(width: 4),
                            const Text('•', style: TextStyle(color: Colors.white, fontSize: 8)),
                            const SizedBox(width: 4),
                            const Text(
                              'Üniversitesi',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text('•', style: TextStyle(color: Colors.white, fontSize: 8)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Information System Text
                  const Expanded(
                    child: Text(
                      'Information System',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A5568), // Blue-grey color
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Profile Card
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, StudentScreen.routeName);
              },
              borderRadius: BorderRadius.circular(16),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 28,
                        child: Icon(Icons.person_outline, size: 32),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '[STUDENT NAME]',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '00000000',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Information System header bar
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Information System',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // List of big cards
            ...options.map(
              (opt) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 1,
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    leading: const Icon(Icons.check_box_outline_blank),
                    title: Text(
                      opt.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      opt.subtitle,
                      style: const TextStyle(fontSize: 13),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      if (opt.title == 'Registration') {
                        Navigator.pushNamed(context, RegistrationScreen.routeName);
                      } else if (opt.title == 'Student Records') {
                        Navigator.pushNamed(context, StudentRecordsScreen.routeName);
                      } else if (opt.title == 'Financial Aid') {
                        Navigator.pushNamed(context, FinancialAidScreen.routeName);
                      } else if (opt.title == 'Degree Audit & Graduation') {
                        Navigator.pushNamed(context, DegreeAuditScreen.routeName);
                      } else if (opt.title == 'Housing') {
                        Navigator.pushNamed(context, HousingScreen.routeName);
                      } else {
                        // TODO: navigate to other feature pages
                      }
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Big button: Student Schedule Day & Time
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                // TODO: go directly to schedule page
              },
              child: const Text(
                'Student Schedule Day & Time',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeOption {
  final String title;
  final String subtitle;

  const _HomeOption({required this.title, required this.subtitle});
}
