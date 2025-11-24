import 'package:bannerweb_mobile/burak_kerem/DegreeAuditPage_UI.dart';
import 'package:bannerweb_mobile/burak_kerem/FinancialAidScreenPage_UI.dart';
import 'package:bannerweb_mobile/burak_kerem/HomePage_UI.dart';
import 'package:bannerweb_mobile/burak_kerem/HousingPage_UI.dart';
import 'package:bannerweb_mobile/burak_kerem/ProfilePage_UI.dart';
import 'package:bannerweb_mobile/burak_kerem/RegistrationPage_UI.dart';
import 'package:bannerweb_mobile/burak_kerem/SearchPage_UI.dart';
import 'package:bannerweb_mobile/burak_kerem/StudentsRecords_UI.dart';
import 'package:bannerweb_mobile/ismayil/LoginPageUI.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String login = '/';
  static const String home = '/home';
  static const String search = '/search';
  static const String student = '/student';
  static const String registration = '/registration';
  static const String studentRecords = '/student-records';
  static const String financialAid = '/financial-aid';
  static const String degreeAudit = '/degree-audit';
  static const String housing = '/housing';

  static Map<String, WidgetBuilder> get routes => {
    login: (context) => const LoginPage(),
    home: (context) => const HomeScreen(),
    search: (context) => const SearchScreen(),
    student: (context) => const StudentScreen(),
    registration: (context) => const RegistrationScreen(),
    studentRecords: (context) => const StudentRecordsScreen(),
    financialAid: (context) => const FinancialAidScreen(),
    degreeAudit: (context) => const DegreeAuditScreen(),
    housing: (context) => const HousingScreen(),
  };
}
