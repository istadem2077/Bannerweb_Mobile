import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:bannerweb_mobile/mock/mock_settings_page.dart';
import 'package:bannerweb_mobile/providers/ismayil/auth_provider.dart' as app_auth;
import 'package:bannerweb_mobile/providers/ismayil/theme_provider.dart';

class MockAuthProvider extends ChangeNotifier implements app_auth.AuthProvider {
  @override String get fullName => 'Test Student';
  @override String get studentId => '00012345';
  @override bool get isLoading => false;
  @override bool get isAuthenticated => true;
  @override User? get user => null;
  @override String get firstName => 'Test';
  @override String get lastName => 'Student';
  @override Future<String?> login(String e, String p) async => null;
  @override Future<void> logout() async {}
  @override Future<String?> signUp({required String email, required String password, required String firstName, required String lastName}) async => null;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() => SharedPreferences.setMockInitialValues({}));

  testWidgets('SettingsPageMock renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider<app_auth.AuthProvider>(create: (_) => MockAuthProvider()),
        ],
        child: const MaterialApp(home: SettingsPageMock()),
      ),
    );

    expect(find.text('Test Student'), findsOneWidget);
    expect(find.text('Student ID: 00012345'), findsOneWidget);
    
    await tester.tap(find.byType(Switch));
    await tester.pump();
    
    final Switch sw = tester.widget(find.byType(Switch));
    expect(sw.value, isTrue);
  });
}