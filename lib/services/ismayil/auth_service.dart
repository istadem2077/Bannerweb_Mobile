import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;

  Future<User?> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      // 1. Create the user in Firebase Auth
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // 2. Generate a Unique 8-Digit ID
      String studentId = await _generateUniqueStudentId();

      // 3. Save extra details to Firestore using the Auth UID as the document key
      await _firestore.collection('users').doc(result.user!.uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'studentId': studentId,
        'uid': result.user!.uid,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return result.user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'An unknown error occurred';
    }
  }

  Future<String> _generateUniqueStudentId() async {
    final Random random = Random();
    String id = '';
    bool isUnique = false;

    while (!isUnique) {
      // Generate random number between 10000000 and 99999999
      int number = 10000000 + random.nextInt(90000000);
      id = number.toString();

      // Check Firestore to see if this ID is already taken
      final query = await _firestore
          .collection('users')
          .where('studentId', isEqualTo: id)
          .get();

      if (query.docs.isEmpty) {
        isUnique = true;
      }
    }
    return id;
  }

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'An unknown error occurred';
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
