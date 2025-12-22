import 'package:bannerweb_mobile/ismayil/app_scaffold.dart';
import 'package:flutter/material.dart';

class FinalExamSchedulePage extends StatelessWidget {
  const FinalExamSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentIndex: 2, // Assuming it's part of the student section
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                      child: Icon(Icons.person, size: 48, color: Colors.white),
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
                      style: TextStyle(fontSize: 16, color: Colors.black54),
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
            const SizedBox(height: 30),
            const Text(
              'Final Exam Schedule',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView(
                  children: const [
                    _ExamCard(
                      course: 'CS 310',
                      time: '15:00',
                      date: '3.12.2026',
                      instructor: 'Saima Gül',
                      location: 'FENS G014',
                    ),
                    _ExamCard(
                      course: 'CS 310',
                      time: '15:00',
                      date: '3.12.2026',
                      instructor: 'Saima Gül',
                      location: 'FENS G014',
                    ),
                    _ExamCard(
                      course: 'CS 310',
                      time: '15:00',
                      date: '3.12.2026',
                      instructor: 'Saima Gül',
                      location: 'FENS G014',
                    ),
                    _ExamCard(
                      course: 'CS 310',
                      time: '15:00',
                      date: '3.12.2026',
                      instructor: 'Saima Gül',
                      location: 'FENS G014',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExamCard extends StatelessWidget {
  final String course;
  final String time;
  final String date;
  final String instructor;
  final String location;

  const _ExamCard({
    required this.course,
    required this.time,
    required this.date,
    required this.instructor,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text('Time: $time'),
                const SizedBox(height: 2),
                Text('Date: $date'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  instructor,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(location),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
