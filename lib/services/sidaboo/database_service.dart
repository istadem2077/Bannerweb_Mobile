import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Collection reference
  CollectionReference get _examsRef => _db.collection('final_exams');

  // Helper to get ID safely for testing
  String get _currentUserId {
    final User? user = _auth.currentUser;
    // If no user is logged in, use a test ID so the app doesn't crash during development
    return user?.uid ?? 'test_user_id';
  }

  // 1. CREATE: Add a new exam
  Future<void> addExam({
    required String courseName,
    required String time,
    required String date,
    required String instructor,
    required String location,
  }) async {
    await _examsRef.add({
      'courseName': courseName,
      'time': time,
      'date': date,
      'instructor': instructor,
      'location': location,
      'createdBy': _currentUserId, // Required field per instructions
      'createdAt': FieldValue.serverTimestamp(), // Required field per instructions
    });
  }

  // 2. READ: Get a stream of exams
  Stream<QuerySnapshot> getExamsStream() {
    // We still filter by ID in the UI so users don't see each other's test data
    return _examsRef
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  // 3. UPDATE
  Future<void> updateExam({
    required String docId,
    required String courseName,
    required String time,
    required String date,
    required String instructor,
    required String location,
  }) async {
    await _examsRef.doc(docId).update({
      'courseName': courseName,
      'time': time,
      'date': date,
      'instructor': instructor,
      'location': location,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  // 4. DELETE
  Future<void> deleteExam(String docId) async {
    await _examsRef.doc(docId).delete();
  }
}
