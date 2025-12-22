import 'package:bannerweb_mobile/ismayil/Routes.dart';
import 'package:flutter/material.dart';

class DepartmentListScreen extends StatefulWidget {
  const DepartmentListScreen({super.key});

  @override
  State<DepartmentListScreen> createState() => _DepartmentListScreenState();
}

class _DepartmentListScreenState extends State<DepartmentListScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredDepartments = [];
  String _selectedTerm = "Select Term"; // Default text before selection

  // Data map based on scraped university schedule
  final Map<String, List<String>> _departmentDataMap = {
    "Fall 2024-2025": [
      "Academic Literacies (AL)",
      "Accounting (ACC)",
      "Ac.Pract.&Dev. (GR)",
      "Action Res.&Transf. (MART)",
      "Business Analytics (BAN)",
      "Chemistry (CHEM)",
      "Civic Involvement Project (CIP)",
      "Computer Sci.& Eng (CS)",
      "Conf. Analysis Res. (CONF)",
      "Cultural Studies (CULT)",
      "Data Analytics (DA)",
      "Data Science & Analytics (DSA)",
      "Data Science (DS)",
      "Economics (ECON)",
      "Electronics Engineering (EE)",
      "Energy (ENRG)",
      "Engineering Sciences (ENS)",
      "English (ENG)",
      "Finance (FIN)",
      "Finance(Master) (MFIN)",
      "Gender Studies (GEN)",
      "German (GER)",
      "History of Art (HART)",
      "History (HIST)",
      "Humanities (HUM)",
      "Industrial Engineering (IE)",
      "Interfaculty Course (IF)",
      "International Relations (IR)",
      "Management (MGMT)",
      "Managerial Research (MRES)",
      "Manufacturing (MFE)",
      "Manufacturing (MFG)",
      "Marketing(Master) (MIM)",
      "Marketing (MKTG)",
      "Materials Sci.& Nano Eng. (MAT)",
      "Mathematics (MATH)",
      "Mechatronics (ME)",
      "Mol.Bio.Genetic&Bioengin. (BIO)",
      "Natural Sciences (NS)",
      "Opera.&Info. Syst. Man. (OPIM)",
      "Organization (ORG)",
      "Persian (PERS)",
      "Philosophy (PHIL)",
      "Physics (PHYS)",
      "Political Sci.& Inter. Relati. (PSIR)",
      "Political Science (POLS)",
      "Project Course (PROJ)",
      "Project-Exchange (XM)",
      "Psychology (PSY)",
      "Qualifying Exam (QL)",
      "Security (SEC)",
      "Social & Political Sci. (SPS)",
      "Sociology (SOC)",
      "Turkish Lang.&Literature (TLL)",
      "Turkish Studies (TS)",
      "Turkish (TUR)",
      "Vis. Arts&Vis.l Comm Des. (VA)",
    ],
    "Spring 2024-2025": [
      "Academic Literacies (AL)",
      "Accounting (ACC)",
      "Ac.Pract.&Dev. (GR)",
      "Action Res.&Transf. (MART)",
      "Anthropology (ANTH)",
      "Business Analytics (BAN)",
      "Chemistry (CHEM)",
      "Civic Involvement Project (CIP)",
      "Computer Sci.& Eng (CS)",
      "Conf. Analysis Res. (CONF)",
      "Cultural Studies (CULT)",
      "Data Analytics (DA)",
      "Data Science & Analytics (DSA)",
      "Data Science (DS)",
      "Economics (ECON)",
      "Electronics Engineering (EE)",
      "Energy Tech. and Manag. (ETM)",
      "Energy (ENRG)",
      "Engineering Sciences (ENS)",
      "English (ENG)",
      "Entrepreneurship (ENT)",
      "Finance (FIN)",
      "Finance(Master) (MFIN)",
      "Gender Studies (GEN)",
      "German (GER)",
      "History of Art (HART)",
      "History (HIST)",
      "Humanities (HUM)",
      "Industrial Engineering (IE)",
      "Information Technology (IT)",
      "Interfaculty Course (IF)",
      "International Relations (IR)",
      "Law (LAW)",
      "Management (MGMT)",
      "Managerial Research (MRES)",
      "Manufacturing (MFE)",
      "Manufacturing (MFG)",
      "Marketing(Master) (MIM)",
      "Marketing (MKTG)",
      "Materials Sci.& Nano Eng. (MAT)",
      "Mathematics (MATH)",
      "Mechatronics (ME)",
      "Mol.Bio.Genetic&Bioengin. (BIO)",
      "Natural Sciences (NS)",
      "Opera.&Info. Syst. Man. (OPIM)",
      "Organization (ORG)",
      "Persian (PERS)",
      "Philosophy (PHIL)",
      "Physics (PHYS)",
      "Political Sci.& Inter. Relati. (PSIR)",
      "Political Science (POLS)",
      "Project Course (PROJ)",
      "Project-Exchange (XM)",
      "Psychology (PSY)",
      "Qualifying Exam (QL)",
      "Security (SEC)",
      "Social & Political Sci. (SPS)",
      "Sociology (SOC)",
      "Turkish Lang.&Literature (TLL)",
      "Turkish Studies (TS)",
      "Turkish (TUR)",
      "Vis. Arts&Vis.l Comm Des. (VA)",
    ],
    "Summer 2024-2025": [
      "Accounting (ACC)",
      "Computer Sci.& Eng (CS)",
      "Data Analytics (DA)",
      "Economics (ECON)",
      "Electronics Engineering (EE)",
      "Engineering Sciences (ENS)",
      "English (ENG)",
      "Finance (FIN)",
      "History of Art (HART)",
      "History (HIST)",
      "Humanities (HUM)",
      "Industrial Engineering (IE)",
      "Interfaculty Course (IF)",
      "Management (MGMT)",
      "Marketing (MKTG)",
      "Materials Sci.& Nano Eng. (MAT)",
      "Mathematics (MATH)",
      "Mechatronics (ME)",
      "Mol.Bio.Genetic&Bioengin. (BIO)",
      "Natural Sciences (NS)",
      "Opera.&Info. Syst. Man. (OPIM)",
      "Organization (ORG)",
      "Political Sci.& Inter. Relati. (PSIR)",
      "Project-Exchange (XM)",
      "Psychology (PSY)",
      "Security (SEC)",
      "Social & Political Sci. (SPS)",
      "Turkish Lang.&Literature (TLL)",
      "Vis. Arts&Vis.l Comm Des. (VA)",
    ],
    "Fall 2025-2026": [
      "Academic Literacies (AL)",
      "Accounting (ACC)",
      "Ac.Pract.&Dev. (GR)",
      "Action Res.&Transf. (MART)",
      "Arabic (ARA)",
      "Business Analytics (BAN)",
      "Chemistry (CHEM)",
      "Civic Involvement Project (CIP)",
      "Computer Sci.& Eng (CS)",
      "Conf. Analysis Res. (CONF)",
      "Cultural Studies (CULT)",
      "Data Analytics (DA)",
      "Data Science & Analytics (DSA)",
      "Data Science (DS)",
      "Economics (ECON)",
      "Electronics Engineering (EE)",
      "Energy Tech. and Manag. (ETM)",
      "Energy (ENRG)",
      "Engineering Sciences (ENS)",
      "English (ENG)",
      "Finance (FIN)",
      "Finance(Master) (MFIN)",
      "Gender Studies (GEN)",
      "German (GER)",
      "History of Art (HART)",
      "History (HIST)",
      "Humanities (HUM)",
      "Industrial Engineering (IE)",
      "Information Technology (IT)",
      "Interfaculty Course (IF)",
      "International Relations (IR)",
      "Literature (LIT)",
      "Management (MGMT)",
      "Managerial Research (MRES)",
      "Manufacturing (MFE)",
      "Manufacturing (MFG)",
      "Marketing(Master) (MIM)",
      "Marketing (MKTG)",
      "Materials Sci.& Nano Eng. (MAT)",
      "Mathematics (MATH)",
      "Mechatronics (ME)",
      "Mol.Bio.Genetic&Bioengin. (BIO)",
      "Natural Sciences (NS)",
      "Opera.&Info. Syst. Man. (OPIM)",
      "Organization (ORG)",
      "Persian (PERS)",
      "Philosophy (PHIL)",
      "Physics (PHYS)",
      "Political Sci.& Inter. Relati. (PSIR)",
      "Political Science (POLS)",
      "Project Course (PROJ)",
      "Psychology (PSY)",
      "Qualifying Exam (QL)",
      "Security (SEC)",
      "Social & Political Sci. (SPS)",
      "Turkish Lang.&Literature (TLL)",
      "Turkish Studies (TS)",
      "Turkish (TUR)",
      "Vis. Arts&Vis.l Comm Des. (VA)",
    ],
    "Spring 2025-2026": [
      "Academic Literacies (AL)",
      "Accounting (ACC)",
      "Ac.Pract.&Dev. (GR)",
      "Anthropology (ANTH)",
      "Arabic (ARA)",
      "Business Analytics (BAN)",
      "Chemistry (CHEM)",
      "Civic Involvement Project (CIP)",
      "Computer Sci.& Eng (CS)",
      "Conf. Analysis Res. (CONF)",
      "Cultural Studies (CULT)",
      "Data Science & Analytics (DSA)",
      "Data Science (DS)",
      "Economics (ECON)",
      "Electronics Engineering (EE)",
      "Energy Tech. and Manag. (ETM)",
      "Energy (ENRG)",
      "Engineering Sciences (ENS)",
      "English (ENG)",
      "Entrepreneurship (ENT)",
      "European Studies (ES)",
      "Finance (FIN)",
      "Gender Studies (GEN)",
      "German (GER)",
      "History of Art (HART)",
      "History (HIST)",
      "Humanities (HUM)",
      "Industrial Engineering (IE)",
      "Interfaculty Course (IF)",
      "International Relations (IR)",
      "Law (LAW)",
      "Literature (LIT)",
      "Management (MGMT)",
      "Managerial Research (MRES)",
      "Manufacturing (MFE)",
      "Manufacturing (MFG)",
      "Marketing (MKTG)",
      "Materials Sci.& Nano Eng. (MAT)",
      "Mathematics (MATH)",
      "Mechatronics (ME)",
      "Mol.Bio.Genetic&Bioengin. (BIO)",
      "Natural Sciences (NS)",
      "Opera.&Info. Syst. Man. (OPIM)",
      "Organization (ORG)",
      "Persian (PERS)",
      "Philosophy (PHIL)",
      "Physics (PHYS)",
      "Political Sci.& Inter. Relati. (PSIR)",
      "Political Science (POLS)",
      "Project Course (PROJ)",
      "Project-Exchange (XM)",
      "Psychology (PSY)",
      "Qualifying Exam (QL)",
      "Security (SEC)",
      "Social & Political Sci. (SPS)",
      "Sociology (SOC)",
      "Turkish Lang.&Literature (TLL)",
      "Turkish Studies (TS)",
      "Turkish (TUR)",
      "Vis. Arts&Vis.l Comm Des. (VA)",
    ],
  };

  final List<String> _availableTerms = [
    "Spring 2025-2026",
    "Fall 2025-2026",
    "Summer 2024-2025",
    "Spring 2024-2025",
    "Fall 2024-2025",
  ];

  @override
  void initState() {
    super.initState();
    _filteredDepartments = []; // Start empty until term is selected
    _searchController.addListener(_onSearchChanged);

    // Show the dialog after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showTermSelectionDialog();
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
      final currentList = _departmentDataMap[_selectedTerm] ?? [];
      _filteredDepartments = currentList
          .where(
            (department) => department.toLowerCase().contains(
              _searchController.text.toLowerCase(),
            ),
          )
          .toList();
    });
  }

  Future<void> _showTermSelectionDialog() async {
    await showDialog(
      context: context,
      barrierDismissible: true, // Allow user to dismiss by clicking outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Term"),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _availableTerms.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_availableTerms[index]),
                  onTap: () {
                    setState(() {
                      _selectedTerm = _availableTerms[index];
                      _filteredDepartments =
                          _departmentDataMap[_selectedTerm] ?? [];
                      // Clear search when changing terms
                      _searchController.clear();
                    });
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        );
      },
    );
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
                      hintStyle: const TextStyle(fontSize: 18),
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
                  const SizedBox(height: 10),
                  // Display selected term
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Term: $_selectedTerm",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                      TextButton(
                        onPressed: _showTermSelectionDialog,
                        child: const Text("Change"),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 2. Department List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                itemCount: _filteredDepartments.length,
                itemBuilder: (context, index) {
                  final department = _filteredDepartments[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 30.0,
                    ), // Spacing between items
                    child: GestureDetector(
                      onTap: () {
                        // Extract code from string, e.g., "Computer Sci.& Eng (CS)" -> "CS"
                        final RegExp regex = RegExp(r'\(([^)]+)\)$');
                        final match = regex.firstMatch(department);
                        String deptCode = "";
                        if (match != null) {
                          deptCode = match.group(1) ?? "";
                        }

                        Navigator.pushNamed(
                          context,
                          AppRoutes.alscreen,
                          arguments: {'term': _selectedTerm, 'dept': deptCode},
                        );
                      },
                      child: Text(
                        department,
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
