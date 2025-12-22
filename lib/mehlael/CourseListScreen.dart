import 'package:flutter/material.dart';
import 'CourseData.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({super.key});

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredCourses = [];
  String _currentTerm = "";
  String _currentDept = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      setState(() {
        _currentTerm = args['term'] ?? "";
        _currentDept = args['dept'] ?? "";

        final key = "$_currentTerm - $_currentDept";
        if (CourseData.courseData.containsKey(key)) {
          _filteredCourses = CourseData.courseData[key]!;
        } else {
          // Fallback or empty list
          _filteredCourses = [];
        }
      });
      _searchController.addListener(_onSearchChanged);
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      final key = "$_currentTerm - $_currentDept";
      final sourceList = CourseData.courseData[key] ?? [];

      _filteredCourses = sourceList
          .where(
            (course) => course.toLowerCase().contains(
              _searchController.text.toLowerCase(),
            ),
          )
          .toList();
    });
  }

  Future<void> _launchCourseUrl(String courseString) async {
    // Extract CRN (5-digit number)
    // Format: "Title - CRN - Code - Section"
    final parts = courseString.split(' - ');
    if (parts.length < 2) return;

    final crn = parts[1].trim();
    if (!RegExp(r'^\d{5}$').hasMatch(crn)) return; // Ensure it's a 5-digit CRN

    // Determine Term Code
    String termCode = "";
    if (_currentTerm.contains("Fall 2024-2025")) {
      termCode = "202401";
    } else if (_currentTerm.contains("Spring 2024-2025")) {
      termCode = "202402";
    } else if (_currentTerm.contains("Summer 2024-2025")) {
      termCode = "202403"; // Standard guess, usually Summer is 03 or 04
    } else {
      // For future terms not yet mapped, we might default or show error
      // But for now let's hope it's one of these.
      // If it's Fall 2025-2026, logic would be 202501 etc.
      if (_currentTerm.contains("Fall 2025-2026")) termCode = "202501";
      if (_currentTerm.contains("Spring 2025-2026")) termCode = "202502";
    }

    if (termCode.isEmpty) return;

    final url = Uri.parse(
      "https://suis.sabanciuniv.edu/prod/bwckschd.p_disp_detail_sched?term_in=$termCode&crn_in=$crn",
    );

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 1. Search Bar
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      prefixIcon: const Icon(Icons.search, size: 28),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1.5),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2.0),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                  if (_currentTerm.isNotEmpty && _currentDept.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "$_currentTerm | $_currentDept",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // 2. Scrollable List
            Expanded(
              child: _filteredCourses.isEmpty
                  ? const Center(
                      child: Text("No courses found for this selection."),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      itemCount: _filteredCourses.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: InkWell(
                            onTap: () =>
                                _launchCourseUrl(_filteredCourses[index]),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    _filteredCourses[index],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue, // Visual cue for link
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.open_in_new,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),

            // 3. Bottom Home Icon (Acts as a Back Button)
            GestureDetector(
              onTap: () {
                // Navigate back to the previous screen
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: const Icon(Icons.home, size: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
