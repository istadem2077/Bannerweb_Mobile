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
