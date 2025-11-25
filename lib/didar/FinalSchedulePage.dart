import 'package:flutter/material.dart';
import 'ProfileHeaderCard.dart';

class FinalScheduleScreen extends StatelessWidget {
  static const String routeName = '/final-schedule';

  const FinalScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Final Exam Schedule',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Reusable Profile Header Card
            const ProfileHeaderCard(),

            const SizedBox(height: 24),

            // Final Exam List Header
            const Text(
              'Your Final Exams',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // Static Final Exam Cards
            const _FinalExamCard(
              courseName: 'Mathematics I',
              professor: 'Prof. John Doe',
              time: '09:00 - 11:00',
              date: '2024-12-10',
              room: 'Room 101',
            ),
            const _FinalExamCard(
              courseName: 'Computer Science',
              professor: 'Prof. Jane Smith',
              time: '13:00 - 15:00',
              date: '2024-12-12',
              room: 'Room 202',
            ),
            const _FinalExamCard(
              courseName: 'Physics I',
              professor: 'Prof. Albert Einstein',
              time: '10:00 - 12:00',
              date: '2024-12-14',
              room: 'Room 303',
            ),
            const _FinalExamCard(
              courseName: 'Chemistry',
              professor: 'Prof. Marie Curie',
              time: '14:00 - 16:00',
              date: '2024-12-15',
              room: 'Room 404',
            ),
            const _FinalExamCard(
              courseName: 'English Literature',
              professor: 'Prof. William Shakespeare',
              time: '09:00 - 11:00',
              date: '2024-12-16',
              room: 'Room 505',
            ),
            const _FinalExamCard(
              courseName: 'History',
              professor: 'Prof. Howard Zinn',
              time: '13:00 - 15:00',
              date: '2024-12-18',
              room: 'Room 606',
            ),

            const SizedBox(height: 32),

            // Return Button
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Text(
                'Return to Menu',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Single Final Exam Card
class _FinalExamCard extends StatelessWidget {
  final String courseName;
  final String professor;
  final String time;
  final String date;
  final String room;

  const _FinalExamCard({
    required this.courseName,
    required this.professor,
    required this.time,
    required this.date,
    required this.room,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Left side
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(courseName,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('Time: $time'),
                  Text('Date: $date'),
                ],
              ),
            ),

            // Right side
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(professor),
                  const SizedBox(height: 4),
                  Text(room, style: const TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
