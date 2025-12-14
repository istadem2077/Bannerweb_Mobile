import 'package:flutter/material.dart';

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  // Helper to generate the exact list from your image
  List<String> get _courseData => [
    "Academic Literacies - 10263 - AL 102 - A1",
    "Academic Literacies - 10267 - AL 102 - A2",
    "Academic Literacies - 10270 - AL 102 - A3",
    "Academic Literacies - 10271 - AL 102 - A4",
    "Academic Literacies - 12593 - AL 102 - A5",
    "Academic Literacies - 10273 - AL 102 - B1",
    "Academic Literacies - 10274 - AL 102 - B2",
    "Academic Literacies - 10275 - AL 102 - B3",
    "Academic Literacies - 10276 - AL 102 - B4",
    "Academic Literacies - 12594 - AL 102 - B5",
    "Academic Literacies - 10280 - AL 102 - C1",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 1. Search Bar
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.black, fontSize: 18),
                  prefixIcon: const Icon(Icons.search, size: 28),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
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
            ),

            // 2. Scrollable List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                itemCount: _courseData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Text(
                      _courseData[index],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
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
