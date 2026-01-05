import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final FirebaseFirestore _db;
  final FirebaseAuth _auth;

  // Add a factory constructor for easier testing
  DatabaseService({
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  })  : _db = firestore ?? FirebaseFirestore.instance,
        _auth = auth ?? FirebaseAuth.instance;

  // For testing, allow overriding the current user
  String get _currentUserId {
    final User? user = _auth.currentUser;
    return user?.uid ?? 'test_user_id';
  }

  // Collection reference
  CollectionReference get _examsRef => _db.collection('final_exams');

  // 1. CREATE
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
      'createdBy': _currentUserId,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  // 2. READ
  Stream<QuerySnapshot> getExamsStream() {
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