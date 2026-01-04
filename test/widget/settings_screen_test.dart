import 'package:bannerweb_mobile/didar/SettingsPage.dart';
import 'package:bannerweb_mobile/providers/ismayil/auth_provider.dart'
    as app_auth;
import 'package:bannerweb_mobile/providers/ismayil/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Mock AuthProvider
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

  testWidgets('SettingsScreen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider<app_auth.AuthProvider>(
            create: (_) => MockAuthProvider(),
          ),
        ],
        child: const MaterialApp(home: SettingsScreen()),
      ),
    );

    // Verify AppBar
    expect(find.text('Settings'), findsOneWidget);

    // Verify Language Selector
    expect(find.text('Language'), findsOneWidget);
    expect(find.text('English'), findsOneWidget);
    expect(find.text('Türkçe'), findsOneWidget);

    // Verify Dark Mode Toggle
    expect(find.text('Dark Mode'), findsOneWidget);
    expect(find.byIcon(Icons.dark_mode), findsOneWidget);

    // Verify Logout Button
    expect(find.text('Logout'), findsOneWidget);

    // Verify Profile Header presence (via Mock Data)
    expect(find.text('Test Student'), findsOneWidget);
  });
}
