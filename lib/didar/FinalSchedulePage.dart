import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../burak_kerem/ProfilePage_UI.dart'; 

class FinalScheduleScreen extends StatelessWidget {
  static const String routeName = '/final-schedule';

  const FinalScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final studentData = Provider.of<StudentData>(context);
    final Color textColor = studentData.isDarkModeEnabled ? Colors.white : Colors.black;
    final Color subtitleColor = studentData.isDarkModeEnabled ? Colors.white70 : Colors.black54;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: null,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Final Exam Schedule',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: textColor),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFA500),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Student Info Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(studentData.studentName,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
                        ),
                        const SizedBox(height: 4),
                        Text(studentData.studentId,
                            style: TextStyle(fontSize: 14, color: subtitleColor)),
                        const SizedBox(height: 4),
                        Text(studentData.status,
                            style: TextStyle(fontSize: 14, color: subtitleColor)),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Final Exam List
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your Final Exams',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor)),
                    const SizedBox(height: 16),

                    ...studentData.finalScheduleCourses.map(
                          (course) => _FinalScheduleCourseItem(course: course),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              Container(
                height: 1,
                color: studentData.isDarkModeEnabled ? Colors.white70 : Colors.black87,
                margin: const EdgeInsets.symmetric(horizontal: 20),
              ),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                child: InkWell(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _FinalScheduleCourseItem extends StatelessWidget {
  final FinalScheduleCourse course;

  const _FinalScheduleCourseItem({required this.course});

  @override
  Widget build(BuildContext context) {
    final studentData = Provider.of<StudentData>(context);
    final Color textColor = studentData.isDarkModeEnabled ? Colors.white : Colors.black;
    final Color subtitleColor = studentData.isDarkModeEnabled ? Colors.white70 : Colors.black54;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                  Text(course.courseName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      )),
                  const SizedBox(height: 8),
                  Text('Time: ${course.time}', style: TextStyle(color: textColor)),
                  Text('Date: ${course.date}', style: TextStyle(color: textColor)),
                ],
              ),
            ),

            // Right side
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(course.professor, style: TextStyle(color: subtitleColor)),
                  const SizedBox(height: 8),
                  Text(course.room,
                      style: TextStyle(fontWeight: FontWeight.w600, color: textColor)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

