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
