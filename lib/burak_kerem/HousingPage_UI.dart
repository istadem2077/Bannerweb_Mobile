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
