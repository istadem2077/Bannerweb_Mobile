import 'package:bannerweb_mobile/ismayil/app_scaffold.dart';
import 'package:bannerweb_mobile/services/sidaboo/database_service.dart'; // Make sure this path is correct
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FinalExamSchedulePage extends StatefulWidget {
  const FinalExamSchedulePage({super.key});

  @override
  State<FinalExamSchedulePage> createState() => _FinalExamSchedulePageState();
}

class _FinalExamSchedulePageState extends State<FinalExamSchedulePage> {
  final DatabaseService _dbService = DatabaseService();

  // Show dialog for Create and Update
  void _showExamDialog({DocumentSnapshot? doc}) {
    final isEditing = doc != null;
    final courseController = TextEditingController(text: isEditing ? doc['courseName'] : '');
    final timeController = TextEditingController(text: isEditing ? doc['time'] : '');
    final dateController = TextEditingController(text: isEditing ? doc['date'] : '');
    final instructorController = TextEditingController(text: isEditing ? doc['instructor'] : '');
    final locationController = TextEditingController(text: isEditing ? doc['location'] : '');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isEditing ? 'Edit Exam' : 'Add New Exam'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: courseController, decoration: const InputDecoration(labelText: 'Course Name (e.g., CS 310)')),
              TextField(controller: timeController, decoration: const InputDecoration(labelText: 'Time (e.g., 15:00)')),
              TextField(controller: dateController, decoration: const InputDecoration(labelText: 'Date (e.g., 3.12.2026)')),
              TextField(controller: instructorController, decoration: const InputDecoration(labelText: 'Instructor')),
              TextField(controller: locationController, decoration: const InputDecoration(labelText: 'Location')),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (isEditing) {
                _dbService.updateExam(
                  docId: doc.id,
                  courseName: courseController.text,
                  time: timeController.text,
                  date: dateController.text,
                  instructor: instructorController.text,
                  location: locationController.text,
                );
              } else {
                _dbService.addExam(
                  courseName: courseController.text,
                  time: timeController.text,
                  date: dateController.text,
                  instructor: instructorController.text,
                  location: locationController.text,
                );
              }
              Navigator.pop(context);
            },
            child: Text(isEditing ? 'Save' : 'Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentIndex: 2,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Static Header
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                    const Text('[STUDENT NAME]', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('Student ID: 00000000', style: TextStyle(fontSize: 16, color: Colors.black54)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Header Row with Add Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Final Exam Schedule',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle, color: Colors.blue, size: 30),
                  onPressed: () => _showExamDialog(),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Real-time List
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _dbService.getExamsStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return const Center(child: Text('Error loading exams'));
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final data = snapshot.data!.docs;

                  if (data.isEmpty) {
                    return const Center(child: Text('No exams scheduled.'));
                  }

                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final doc = data[index];
                        return _ExamCard(
                          doc: doc,
                          onEdit: () => _showExamDialog(doc: doc),
                          onDelete: () => _dbService.deleteExam(doc.id),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExamCard extends StatelessWidget {
  final DocumentSnapshot doc;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _ExamCard({
    required this.doc,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final data = doc.data() as Map<String, dynamic>;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['courseName'] ?? 'Unknown',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text('Time: ${data['time'] ?? '-'}'),
                  Text('Date: ${data['date'] ?? '-'}'),
                  Text('Loc: ${data['location'] ?? '-'}'),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  data['instructor'] ?? '',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    IconButton(icon: const Icon(Icons.edit, color: Colors.orange), onPressed: onEdit),
                    IconButton(icon: const Icon(Icons.delete, color: Colors.red), onPressed: onDelete),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}