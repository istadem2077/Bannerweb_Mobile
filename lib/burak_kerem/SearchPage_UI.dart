import 'package:bannerweb_mobile/burak_kerem/HomePage_UI.dart';
import 'package:flutter/material.dart';

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
