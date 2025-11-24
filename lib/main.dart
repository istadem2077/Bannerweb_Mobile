import 'package:bannerweb_mobile/ismayil/Routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const BannerWebApp());
}

class BannerWebApp extends StatefulWidget {
  const BannerWebApp({super.key});

  @override
  State<BannerWebApp> createState() => _BannerWebAppState();

  static _BannerWebAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_BannerWebAppState>();
}

class _BannerWebAppState extends State<BannerWebApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BannerWeb Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF1155CC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1155CC),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF1155CC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1155CC),
          brightness: Brightness.dark,
        ),
      ),
      themeMode: _themeMode,
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
    );
  }
}
