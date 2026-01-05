import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

enum RegistrationMenuType {
  action,
  schedule,
  detailed,
}

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = {
      'Select Term': RegistrationMenuType.action,
      'Add/Drop Classes': RegistrationMenuType.action,
      'Look-up Classes to Add': RegistrationMenuType.action,
      'Student Schedule by Day & Time': RegistrationMenuType.schedule,
      'Student Detail Schedule': RegistrationMenuType.detailed,
      'Check Your Registration Status': RegistrationMenuType.action,
      'Request to Withdrawal Form': RegistrationMenuType.action,
      'Request to Course Substitution Form': RegistrationMenuType.action,
      'Application for Course Registration Override':
      RegistrationMenuType.action,
    };

    return Scaffold(
      appBar: AppBar(title: const Text('Registration')),
      body: ListView(
        children: items.entries.map((e) {
          return ListTile(
            title: Text(e.key),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Widget page;
              if (e.value == RegistrationMenuType.schedule) {
                page = const ScheduleCalendarPage();
              } else if (e.value == RegistrationMenuType.detailed) {
                page = const ScheduleDetailedPage();
              } else {
                page = RegistrationActionPage(title: e.key);
              }
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => page),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

class RegistrationActionPage extends StatelessWidget {
  final String title;
  const RegistrationActionPage({super.key, required this.title});

  static const url =
      'https://suis.sabanciuniv.edu/prod/twbkwbis.P_SabanciLogin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Courses and Course Registration',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Courses are taught mainly in English. Course codes define subject '
                  'area and level. Undergraduate courses are 1XX–4XX, graduate '
                  'courses are 5XX–9XX. Both SU credits and ECTS are used.',
            ),
            const SizedBox(height: 12),
            const Text(
              'Assessment methods include exams, projects, assignments and '
                  'attendance. Grading follows a 4.00 system with additional '
                  'statuses such as W, I and P.',
            ),
            const SizedBox(height: 12),
            const Text(
              'Registrations are completed online during announced periods. '
                  'Changes are only allowed until the end of add-drop.',
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final uri = Uri.parse(url);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(
                      uri,
                      mode: LaunchMode.externalApplication,
                    );
                  }
                },
                child: const Text('Go to SIS Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScheduleCalendarPage extends StatelessWidget {
  const ScheduleCalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
    final times = ['09:40', '10:40', '11:40', '13:40', '14:40', '15:40'];

    return Scaffold(
      appBar: AppBar(title: const Text('Weekly Schedule')),
      body: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 60),
              ...days.map(
                    (d) => Expanded(
                  child: Center(
                    child: Text(
                      d,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: ListView(
              children: [
                _row('09:40', ['', 'CS310', '', 'MATH201', '']),
                _row('10:40', ['', 'CS310', '', 'MATH201', '']),
                _row('11:40', ['PHYS101', '', '', '', '']),
                _row('12:40', ['PHYS101', '', '', '', '']),
                _row('13:40', ['', '', 'CS412', '', 'PHYS101']),
                _row('14:40', ['MATH201', '', 'CS412', 'HIST210', '']),
                _row('15:40', ['CS412', '', '', 'CS310', 'HIST210']),
                _row('16:40', ['', '', '', '', 'HIST210']),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(String time, List<String> courses) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          SizedBox(width: 60, child: Text(time)),
          ...courses.map(
                (c) => Expanded(
              child: _CalendarCell(course: c.isEmpty ? null : c),
            ),
          ),
        ],
      ),
    );
  }
}

class _CalendarCell extends StatelessWidget {
  final String? course;
  const _CalendarCell({this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: course == null ? Colors.grey.shade200 : Colors.blue.shade400,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          course ?? '',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class ScheduleDetailedPage extends StatelessWidget {
  const ScheduleDetailedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detailed Schedule')),
      body: ListView(
        children: const [
          ExpansionTile(
            title: Text('CS310 - Software Engineering'),
            children: [
              ListTile(title: Text('Tue 09:40–11:40 (2h)')),
              ListTile(title: Text('Thu 15:40–16:40 (Lab 1h)')),
              ListTile(title: Text('Location: FENS G032')),
            ],
          ),
          ExpansionTile(
            title: Text('PHYS101 - Physics I'),
            children: [
              ListTile(title: Text('Mon 11:40–13:40 (2h)')),
              ListTile(title: Text('Fri 13:40–14:40 (Recitation 1h)')),
              ListTile(title: Text('Location: FENS G018')),
            ],
          ),
          ExpansionTile(
            title: Text('CS412 - Machine Learning'),
            children: [
              ListTile(title: Text('Wed 13:40–14:40 (Lecture 1h)')),
              ListTile(title: Text('Wed 14:40–15:40 (Lecture 1h)')),
              ListTile(title: Text('Mon 15:40–16:40 (Lab 1h)')),
              ListTile(title: Text('Location: FENS G051')),
            ],
          ),
          ExpansionTile(
            title: Text('MATH201 - Calculus III'),
            children: [
              ListTile(title: Text('Thu 09:40–11:40 (2h)')),
              ListTile(title: Text('Mon 14:40–15:40 (Problem Session 1h)')),
              ListTile(title: Text('Location: FENS G021')),
            ],
          ),
          ExpansionTile(
            title: Text('HIST210 - Modern History'),
            children: [
              ListTile(title: Text('Thu 14:40–15:40 (Lecture 1h)')),
              ListTile(title: Text('Fri 15:40–17:40 (2h)')),
              ListTile(title: Text('Location: FASS B201')),
            ],
          ),
        ],
      ),
    );
  }
}
