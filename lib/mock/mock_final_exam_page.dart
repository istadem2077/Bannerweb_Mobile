import 'package:flutter/material.dart';
import 'package:bannerweb_mobile/didar/ProfileHeaderCard.dart';
import 'package:bannerweb_mobile/ismayil/app_scaffold.dart';

class FinalExamSchedulePageMock extends StatelessWidget {
  const FinalExamSchedulePageMock({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data List
    final mockExams = [
      {'courseName': 'Mathematics I', 'time': '10:00', 'date': '03.01.2026', 'location': 'FENS G035', 'instructor': 'Prof. John Doe'},
      {'courseName': 'Computer Science', 'time': '14:00', 'date': '05.01.2026', 'location': 'FASS G022', 'instructor': 'Dr. Jane Smith'},
    ];

    return AppScaffold(
      currentIndex: 2, // Example index
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ProfileHeaderCard(),
            const SizedBox(height: 30),
            const Text(
              'Final Exam Schedule',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView.builder(
                  itemCount: mockExams.length,
                  itemBuilder: (context, index) {
                    final exam = mockExams[index];
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
                                Text(exam['courseName']!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Text('Time: ${exam['time']}'),
                                Text('Date: ${exam['date']}'),
                                Text('Loc: ${exam['location']}'),
                              ],
                            ),
                            Text(exam['instructor']!, style: const TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}