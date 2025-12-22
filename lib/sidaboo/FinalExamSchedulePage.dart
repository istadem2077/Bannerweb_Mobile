import 'package:bannerweb_mobile/didar/ProfileHeaderCard.dart';
import 'package:bannerweb_mobile/ismayil/app_scaffold.dart';
import 'package:bannerweb_mobile/providers/ismayil/auth_provider.dart';
import 'package:bannerweb_mobile/services/sidaboo/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FinalExamSchedulePage extends StatefulWidget {
  const FinalExamSchedulePage({super.key});

  @override
  State<FinalExamSchedulePage> createState() => _FinalExamSchedulePageState();
}

class _FinalExamSchedulePageState extends State<FinalExamSchedulePage> {
  final DatabaseService _dbService = DatabaseService();

  void _showExamDialog({DocumentSnapshot? doc}) {
    final isEditing = doc != null;
    final courseController = TextEditingController(
      text: isEditing ? doc['courseName'] : '',
    );
    final timeController = TextEditingController(
      text: isEditing ? doc['time'] : '',
    );
    final dateController = TextEditingController(
      text: isEditing ? doc['date'] : '',
    );
    final instructorController = TextEditingController(
      text: isEditing ? doc['instructor'] : '',
    );
    final locationController = TextEditingController(
      text: isEditing ? doc['location'] : '',
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isEditing ? 'Edit Exam' : 'Add New Exam'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: courseController,
                decoration: const InputDecoration(
                  labelText: 'Course Name (e.g., CS 310)',
                ),
              ),
              TextField(
                controller: timeController,
                decoration: const InputDecoration(
                  labelText: 'Time (e.g., 15:00)',
                ),
              ),
              TextField(
                controller: dateController,
                decoration: const InputDecoration(
                  labelText: 'Date (e.g., 3.12.2026)',
                ),
              ),
              TextField(
                controller: instructorController,
                decoration: const InputDecoration(labelText: 'Instructor'),
              ),
              TextField(
                controller: locationController,
                decoration: const InputDecoration(labelText: 'Location'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final navigator = Navigator.of(context);
              final messenger = ScaffoldMessenger.of(context);
              try {
                if (isEditing) {
                  await _dbService.updateExam(
                    docId: doc.id,
                    courseName: courseController.text,
                    time: timeController.text,
                    date: dateController.text,
                    instructor: instructorController.text,
                    location: locationController.text,
                  );
                } else {
                  await _dbService.addExam(
                    courseName: courseController.text,
                    time: timeController.text,
                    date: dateController.text,
                    instructor: instructorController.text,
                    location: locationController.text,
                  );
                }
                navigator.pop();
              } catch (e) {
                messenger.showSnackBar(SnackBar(content: Text(e.toString())));
              }
            },
            child: Text(isEditing ? 'Save' : 'Add'),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Exam'),
        content: const Text('Are you sure you want to delete this exam?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              try {
                await _dbService.deleteExam(id);
              } catch (e) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(e.toString())));
              }
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final currentUid = auth.user?.uid;
    final name = auth.fullName.isEmpty ? 'Student' : auth.fullName;
    final studentId = auth.studentId.isEmpty ? '00000000' : auth.studentId;

    return AppScaffold(
      currentIndex: 2,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileHeaderCard(),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Final Exam Schedule',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.add_circle,
                    color: Colors.blue,
                    size: 30,
                  ),
                  onPressed: () => _showExamDialog(),
                ),
              ],
            ),
            const SizedBox(height: 10),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _dbService.getExamsStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasError)
                    return const Center(child: Text('Error loading exams'));
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (currentUid == null) {
                    return const Center(child: Text('No exams available.'));
                  }

                  final data = snapshot.data!.docs;
                  final filtered = data.where((doc) {
                    final map = doc.data() as Map<String, dynamic>;
                    return map['createdBy'] == currentUid;
                  }).toList();

                  if (filtered.isEmpty) {
                    return const Center(child: Text('No exams scheduled.'));
                  }

                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.builder(
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        final doc = filtered[index];
                        return _ExamCard(
                          doc: doc,
                          onEdit: () => _showExamDialog(doc: doc),
                          onDelete: () => _confirmDelete(doc.id),
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
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.orange),
                      onPressed: onEdit,
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: onDelete,
                    ),
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
