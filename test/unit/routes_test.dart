import 'package:flutter_test/flutter_test.dart';
import 'package:bannerweb_mobile/ismayil/Routes.dart';

void main() {
  group('AppRoutes Tests', () {
    test('All routes should start with /', () {
      final routes = [
        AppRoutes.login,
        AppRoutes.home,
        AppRoutes.search,
        AppRoutes.student,
        AppRoutes.registration,
        AppRoutes.studentRecords,
        AppRoutes.financialAid,
        AppRoutes.degreeAudit,
        AppRoutes.housing,
        AppRoutes.studentHelp,
        AppRoutes.courseInfoList,
        AppRoutes.courseSections,
        AppRoutes.finalExamSchedule,
        AppRoutes.settings,
        AppRoutes.finals,
        AppRoutes.alscreen,
        AppRoutes.courses,
        AppRoutes.courseinfoex,
        AppRoutes.register,
      ];

      for (final route in routes) {
        expect(
          route.startsWith('/'),
          isTrue,
          reason: 'Route $route does not start with /',
        );
      }
    });

    test('Essential routes exist', () {
      expect(AppRoutes.login, '/');
      expect(AppRoutes.home, '/home');
      expect(AppRoutes.settings, '/settings');
    });

    test('Route map keys match constants', () {
      final routeMap = AppRoutes.routes;
      expect(routeMap.containsKey(AppRoutes.home), isTrue);
      expect(routeMap.containsKey(AppRoutes.settings), isTrue);
    });
  });
}
