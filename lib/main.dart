import 'package:bannerweb_mobile/burak_kerem/HomePage_UI.dart';
import 'package:bannerweb_mobile/firebase_options.dart';
import 'package:bannerweb_mobile/ismayil/LoginPageUI.dart';
import 'package:bannerweb_mobile/ismayil/Routes.dart';
import 'package:bannerweb_mobile/providers/ismayil/auth_provider.dart';
import 'package:bannerweb_mobile/providers/ismayil/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const BannerWebApp(),
    ),
  );
}

class BannerWebApp extends StatelessWidget {
  const BannerWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'BannerWeb Mobile',
      themeMode: themeProvider.themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),

      home: Consumer<AuthProvider>(
        builder: (context, auth, _) {
          return auth.isAuthenticated
              ? const HomeScreen()
              : const LoginScreen();
        },
      ),
      routes: AppRoutes.routes,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => const SizedBox());
      },
    );
  }
}
