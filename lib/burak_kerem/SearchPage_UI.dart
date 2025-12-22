import 'package:bannerweb_mobile/ismayil/app_scaffold.dart';
import 'package:bannerweb_mobile/providers/ismayil/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
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
    final auth = context.watch<AuthProvider>();
    final filtered = _allItems
        .where((e) => e.toLowerCase().contains(_query.toLowerCase()))
        .toList();

    return AppScaffold(
      currentIndex: 1,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.5),
                  width: 1.2,
                ),
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
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 8,
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.separated(
              itemCount: filtered.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = filtered[index];
                return ListTile(
                  title: Text(
                    item,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
