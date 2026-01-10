import 'package:bannerweb_mobile/ismayil/app_scaffold.dart';
import 'package:bannerweb_mobile/providers/ismayil/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bannerweb_mobile/ismayil/Routes.dart';

import 'RegistrationPage_UI.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class SearchItem {
  final String title;
  final String? route;
  final WidgetBuilder? builder;

  const SearchItem({
    required this.title,
    this.route,
    this.builder,
  });
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();

  final List<SearchItem> _items = [
    SearchItem(title: 'Home', route: AppRoutes.home),
    SearchItem(title: 'Student Profile', route: AppRoutes.student),
    SearchItem(title: 'Registration', route: AppRoutes.registration),
    SearchItem(title: 'Student Records', route: AppRoutes.studentRecords),
    SearchItem(title: 'Financial Aid', route: AppRoutes.financialAid),
    SearchItem(title: 'Degree Audit', route: AppRoutes.degreeAudit),
    SearchItem(title: 'Housing', route: AppRoutes.housing),
    SearchItem(title: 'Final Exam Schedule', route: AppRoutes.finalExamSchedule),
    SearchItem(title: 'Finals', route: AppRoutes.finals),
    SearchItem(title: 'Settings', route: AppRoutes.settings),
    SearchItem(title: 'Student Help', route: AppRoutes.studentHelp),
    SearchItem(title: 'Courses', route: AppRoutes.courses),
    SearchItem(title: 'Course Info', route: AppRoutes.courseinfoex),

    // ---- Registration sub-items ----
    SearchItem(
      title: 'Select Term',
      builder: (_) => RegistrationActionPage(title: 'Select Term'),
    ),
    SearchItem(
      title: 'Add/Drop Classes',
      builder: (_) => RegistrationActionPage(title: 'Add/Drop Classes'),
    ),
    SearchItem(
      title: 'Look-up Classes to Add',
      builder: (_) => RegistrationActionPage(title: 'Look-up Classes to Add'),
    ),
    SearchItem(
      title: 'Student Schedule by Day & Time',
      builder: (_) => const ScheduleCalendarPage(),
    ),
    SearchItem(
      title: 'Student Detail Schedule',
      builder: (_) => const ScheduleDetailedPage(),
    ),
    SearchItem(
      title: 'Check Your Registration Status',
      builder: (_) =>
          RegistrationActionPage(title: 'Check Your Registration Status'),
    ),
    SearchItem(
      title: 'Request to Withdrawal Form',
      builder: (_) =>
          RegistrationActionPage(title: 'Request to Withdrawal Form'),
    ),
    SearchItem(
      title: 'Request to Course Substitution Form',
      builder: (_) =>
          RegistrationActionPage(title: 'Request to Course Substitution Form'),
    ),
    SearchItem(
      title: 'Application for Course Registration Override',
      builder: (_) => RegistrationActionPage(
        title: 'Application for Course Registration Override',
      ),
    ),
  ];



  String _query = '';

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final filtered = _items
        .where(
          (e) => e.title.toLowerCase().contains(_query.toLowerCase()),
    )
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
                  style: const TextStyle(fontSize: 14),
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
                    item.title,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    if (item.route != null) {
                      Navigator.pushNamed(context, item.route!);
                    } else if (item.builder != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: item.builder!),
                      );
                    }
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
