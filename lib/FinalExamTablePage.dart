import 'package:flutter/material.dart';

class FinalExamTablePage extends StatelessWidget {
  const FinalExamTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Your exam JSON here
    final List<Map<String, dynamic>> examJson = [
      {
        "course": "CS202",
        "title": "Data Structures",
        "faculty": "FENS",
        "instructor": "Dr. Saima",
        "exam date": "12 Dec 2025",
        "time": "13:00–15:00",
        "rooms": "FENS L010"
      },
      {
        "course": "CS301",
        "title": "Algorithms",
        "faculty": "FENS",
        "instructor": "Dr. Gul",
        "exam date": "14 Dec 2025",
        "time": "10:00–12:00",
        "rooms": "FENS G029"
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Final Exam Schedule"),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateColor.resolveWith(
                (states) => Colors.grey.shade200,
          ),
          border: TableBorder.all(color: Colors.black), // border for full table

          columns: examJson.first.keys
              .map(
                (key) => DataColumn(
              label: Text(
                key.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
              .toList(),

          rows: examJson
              .map(
                (row) => DataRow(
              cells: row.values
                  .map(
                    (value) => DataCell(
                  Text(value.toString()),
                ),
              )
                  .toList(),
            ),
          )
              .toList(),
        ),
      ),
    );
  }
}
