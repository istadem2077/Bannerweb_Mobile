import 'package:bannerweb_mobile/ismayil/Routes.dart';
import 'package:flutter/material.dart';

class DepartmentListScreen extends StatelessWidget {
  const DepartmentListScreen({super.key});

  // Data based on your second image
  List<String> get _departmentData => [
    "Academic Literacies (AL)",
    "Accounting (ACC)",
    "Ac.Pract.&Dev. (GR)",
    "Action Res.&Transf. (MART)",
    "Arabic (ARA)",
    "Business Analytics (BAN)",
    "Chemistry (CHEM)",
    "Civic Involvement Project (CIP)",
    "Computer Sci.& Eng (CS)",
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
                  hintStyle: const TextStyle(fontSize: 18),
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

            // 2. Department List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                itemCount: _departmentData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 30.0,
                    ), // Spacing between items
                    child: GestureDetector(
                      onTap: () {
                        // If user taps "Academic Literacies", go to the specific course list
                        if (index == 0) {
                          Navigator.pushNamed(context, AppRoutes.alscreen);
                        }
                      },
                      child: Text(
                        _departmentData[index],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // 3. Home Icon (Goes back to Main Menu)
            GestureDetector(
              onTap: () {
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
