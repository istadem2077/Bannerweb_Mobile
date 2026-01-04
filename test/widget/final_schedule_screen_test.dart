import 'package:bannerweb_mobile/didar/FinalSchedulePage.dart';
import 'package:bannerweb_mobile/providers/ismayil/auth_provider.dart'
    as app_auth;
import 'package:bannerweb_mobile/providers/ismayil/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Mock AuthProvider to avoid Firebase initialization in tests
class MockAuthProvider extends ChangeNotifier implements app_auth.AuthProvider {
  @override
  String get fullName => 'Test Student';

  @override
  String get studentId => '00012345';

  @override
  bool get isLoading => false;

  @override
  bool get isAuthenticated => true;

  @override
  User? get user => null;

  @override
  String get firstName => 'Test';

  @override
  String get lastName => 'Student';

  @override
  Future<String?> login(String email, String password) async => null;

  @override
  Future<void> logout() async {}

  @override
  Future<String?> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async => null;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('FinalScheduleScreen renders correctly', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider<app_auth.AuthProvider>(
            create: (_) => MockAuthProvider(),
          ),
        ],
        child: const MaterialApp(home: FinalScheduleScreen()),
      ),
    );

    // Verify AppBar title
    expect(find.text('Final Exam Schedule'), findsOneWidget);

    // Verify "Your Final Exams" header
    expect(find.text('Your Final Exams'), findsOneWidget);

    // Verify course cards are present
    expect(find.text('Mathematics I'), findsOneWidget);
    expect(find.text('Prof. John Doe'), findsOneWidget);
    expect(find.text('Computer Science'), findsOneWidget);

    // Verify Profile Header Data coming from MockAuthProvider
    expect(find.text('Test Student'), findsOneWidget);
    expect(find.text('Student ID: 00012345'), findsOneWidget);
  });
}
