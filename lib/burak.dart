import 'package:flutter/material.dart';

void main() {
  runApp(const BannerWebApp());
}

class BannerWebApp extends StatelessWidget {
  const BannerWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BannerWeb Mobile',
      debugShowCheckedModeBanner: false,
      // named routes
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SearchScreen.routeName: (_) => const SearchScreen(),
        StudentScreen.routeName: (_) => const StudentScreen(),
        RegistrationScreen.routeName: (_) => const RegistrationScreen(),
        StudentRecordsScreen.routeName: (_) => const StudentRecordsScreen(),
        FinancialAidScreen.routeName: (_) => const FinancialAidScreen(),
        DegreeAuditScreen.routeName: (_) => const DegreeAuditScreen(),
        HousingScreen.routeName: (_) => const HousingScreen(),
      },
      theme: ThemeData(
        primaryColor: const Color(0xFF1155CC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1155CC),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}

/// ----------------- COMMON WIDGETS -----------------

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
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, SearchScreen.routeName);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, StudentScreen.routeName);
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
        unselectedItemColor: Colors.black87,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Student',
          ),
        ],
      ),
    );
  }
}

/// ----------------- HOME SCREEN -----------------

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

/// ----------------- SEARCH SCREEN -----------------

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search';

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();

  final List<String> _allItems = const [
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

  String _query = '';

  @override
  Widget build(BuildContext context) {
    final filtered = _allItems
        .where((e) => e.toLowerCase().contains(_query.toLowerCase()))
        .toList();

    return AppScaffold(
      currentIndex: 1,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black87, width: 1.2),
              ),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    _query = value;
                  });
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                ),
              ),
            ),
          ),

          // List of options
          Expanded(
            child: ListView.separated(
              itemCount: filtered.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = filtered[index];
                return ListTile(
                  title: Text(
                    item,
                    style: const TextStyle(
                      color: Color(0xFF1155CC),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // TODO: navigate to selected feature
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// ----------------- STUDENT SCREEN -----------------

class StudentScreen extends StatelessWidget {
  static const String routeName = '/student';

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
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Color(0xFF1155CC),
                      child: Icon(
                        Icons.person,
                        size: 48,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '[STUDENT NAME]',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Student ID: 00000000',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.green.shade300),
                      ),
                      child: const Text(
                        'Active Student',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Quick Info Section
            const Text(
              'Quick Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),

            // Info Cards
            _InfoCard(
              icon: Icons.school,
              title: 'Academic Status',
              value: 'Full-time',
              color: const Color(0xFF1155CC),
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
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: _ActionButton(
                    icon: Icons.schedule,
                    label: 'Schedule',
                    color: const Color(0xFF1155CC),
                    onTap: () {
                      Navigator.pushNamed(context, RegistrationScreen.routeName);
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
                      Navigator.pushNamed(context, StudentRecordsScreen.routeName);
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
                      Navigator.pushNamed(context, FinancialAidScreen.routeName);
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
                      Navigator.pushNamed(context, HousingScreen.routeName);
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
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
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
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

/// ----------------- REGISTRATION SCREEN -----------------

class RegistrationScreen extends StatelessWidget {
  static const String routeName = '/registration';

  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
                    // Registration Title
                    const Text(
                      'Registration',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Yellow horizontal line
                    Container(
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD700),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Menu Options List
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: registrationOptions.map((option) {
                    return _RegistrationMenuItem(
                      title: option,
                      onTap: () {
                        // TODO: Navigate to specific registration feature
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Selected: $option'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 32),

              // Separator line
              Container(
                height: 1,
                color: Colors.black87,
                margin: const EdgeInsets.symmetric(horizontal: 20),
              ),

              const SizedBox(height: 16),

              // Release version footer
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                child: const Text(
                  'RELEASE: 8.9.1',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    letterSpacing: 0.3,
                  ),
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

  const _RegistrationMenuItem({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            // ">" prefix symbol
            const Text(
              '>',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1155CC),
              ),
            ),
            const SizedBox(width: 12),
            // Menu option text
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
            // Chevron icon
            Icon(
              Icons.chevron_right,
              color: Colors.grey.shade600,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

/// ----------------- STUDENT RECORDS SCREEN -----------------

class StudentRecordsScreen extends StatelessWidget {
  static const String routeName = '/student-records';

  const StudentRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final studentRecordsOptions = const [
      'General Student Information',
      'Final Grades',
      'Academic Transcript',
      'Account Summary by Term',
      'View Holds',
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
                    // Student Records Title
                    const Text(
                      'Student Records',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
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

              // Menu Options List
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: studentRecordsOptions.map((option) {
                    return _StudentRecordsMenuItem(
                      title: option,
                      onTap: () {
                        // TODO: Navigate to specific student records feature
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Selected: $option'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 32),

              // Separator line
              Container(
                height: 1,
                color: Colors.black87,
                margin: const EdgeInsets.symmetric(horizontal: 20),
              ),

              const SizedBox(height: 16),

              // Release version footer
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                child: const Text(
                  'RELEASE: 8.9.1',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StudentRecordsMenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _StudentRecordsMenuItem({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            // ">" prefix symbol with orange-brown color
            const Text(
              '>',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFFCD853F), // Orange-brown color
              ),
            ),
            const SizedBox(width: 12),
            // Menu option text
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
            // Chevron icon
            Icon(
              Icons.chevron_right,
              color: Colors.grey.shade600,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

/// ----------------- FINANCIAL AID SCREEN -----------------

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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
                        color: Colors.black,
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

              const SizedBox(height: 32),

              // Dark blue separator line
              Container(
                height: 1,
                color: const Color(0xFF00008B), // Dark blue color
                margin: const EdgeInsets.symmetric(horizontal: 20),
              ),

              const SizedBox(height: 16),

              // Return to Menu footer
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Text(
                    'Return to Menu',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1155CC),
                      letterSpacing: 0.3,
                    ),
                  ),
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

  const _FinancialAidSection({
    required this.title,
    required this.description,
  });
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
                  color: Colors.black87,
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

/// ----------------- DEGREE AUDIT AND GRADUATION SCREEN -----------------

class DegreeAuditScreen extends StatelessWidget {
  static const String routeName = '/degree-audit';

  const DegreeAuditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final degreeAuditItems = const [
      _DegreeAuditItem(
        title: 'Major Declaration for Undergraduate Student',
        description: 'Complete your Final Major Declaration, view your all Major Declarations.',
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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
                    // Degree Audit and Graduation Title
                    const Text(
                      'Degree Audit and Graduation',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
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

              // Menu Items List
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: degreeAuditItems.map((item) {
                    return _DegreeAuditItemWidget(
                      item: item,
                      onTap: () {
                        // TODO: Navigate to specific degree audit feature
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

              const SizedBox(height: 32),

              // Dark blue separator line
              Container(
                height: 1,
                color: const Color(0xFF00008B), // Dark blue color
                margin: const EdgeInsets.symmetric(horizontal: 20),
              ),

              const SizedBox(height: 16),

              // Return to Menu footer
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Text(
                    'Return to Menu',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1155CC),
                      letterSpacing: 0.3,
                    ),
                  ),
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

  const _DegreeAuditItemWidget({
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Item title with ">" prefix
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
                // Item title - blue or red
                Expanded(
                  child: Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: item.isRed ? Colors.red : const Color(0xFF1155CC),
                      letterSpacing: 0.2,
                      decoration: item.isRed ? TextDecoration.underline : TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
            // Description text if available
            if (item.description != null) ...[
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 26),
                child: Text(
                  item.description!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
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

/// ----------------- HOUSING SCREEN -----------------

class HousingScreen extends StatelessWidget {
  static const String routeName = '/housing';

  const HousingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
                    // Housing Title
                    const Text(
                      'Housing',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
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
                    const SizedBox(height: 4),
                    // Dark blue horizontal line (close to yellow-green)
                    Container(
                      height: 1,
                      decoration: BoxDecoration(
                        color: const Color(0xFF00008B), // Dark blue color
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Menu Item
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    // TODO: Navigate to dormitory application form
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Opening Dormitory Application Form...'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
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
                        const SizedBox(width: 12),
                        // Menu option text in blue
                        Expanded(
                          child: Text(
                            'Yurt Başvuru Formu / Dormitory Application Form',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1155CC),
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                        // Chevron icon
                        Icon(
                          Icons.chevron_right,
                          color: Colors.grey.shade600,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Dark blue separator line
              Container(
                height: 1,
                color: const Color(0xFF00008B), // Dark blue color
                margin: const EdgeInsets.symmetric(horizontal: 20),
              ),

              const SizedBox(height: 16),

              // Release version footer
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                child: const Text(
                  'RELEASE: 8.9.1',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
