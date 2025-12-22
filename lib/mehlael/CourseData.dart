import 'data/CourseData_2025_2026_Spring.dart';
import 'data/CourseData_2024_2025_Fall.dart';
import 'data/CourseData_2024_2025_Spring.dart';
import 'data/CourseData_2024_2025_Summer.dart';
import 'data/CourseData_2025_2026_Fall.dart';

class CourseData {
  static const Map<String, List<String>> courseData = {
    ...courseData_2024_2025_Fall,
    ...courseData_2024_2025_Spring,
    ...courseData_2024_2025_Summer,
    ...courseData_2025_2026_Fall,
      ...courseData_2025_2026_Spring,
};
}
