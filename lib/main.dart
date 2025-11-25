import 'package:flutter/material.dart';

// The main entry point for the application
void main() {
  runApp(const MyApp());
}

// MyApp is the root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Disables the debug banner in the top-right corner
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // Sets the primary color swatch for the app
        primarySwatch: Colors.blue,
        // Use Material 3 design
        useMaterial3: true,
      ),
      // Sets the home screen of the app
      home: const MainScreen(),
    );
  }
}

// MainScreen is a StatefulWidget because the BottomNavigationBar
// needs to maintain a 'state' (the currently selected tab)
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

// This is the associated State class for MainScreen
class _MainScreenState extends State<MainScreen> {
  // This variable holds the index of the currently selected tab
  int _selectedIndex = 0;

  // This method is called when a navigation bar item is tapped
  void _onItemTapped(int index) {
    // setState notifies Flutter that the state has changed,
    // so it needs to re-run the build method and update the UI
    setState(() {
      _selectedIndex = index;
    });
  }

  // This is a placeholder list of widgets to show for each tab.
  // We are just using placeholder text for this example.
  static const List<Widget> _widgetOptions = <Widget>[
    // Content for "Home" tab
    ButtonScreen(),
    // Content for "Search" tab
    Center(
      child: Text(
        'Index 0: Search',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
    // Content for "Profile" tab
    Center(
      child: Text(
        'Index 2: Profile',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Scaffold is the basic layout structure for a Material Design screen
    return Scaffold(
      appBar: AppBar(
        // The title of the app bar
        title: const Text('My App'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      // The body of the scaffold shows the widget corresponding
      // to the currently selected tab
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      // The bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        // The list of tabs (BottomNavigationBarItem)
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        // The index of the currently selected tab
        currentIndex: _selectedIndex,
        // The color of the selected tab's icon and label
        selectedItemColor: Colors.blue.shade700,
        // The callback function that is called when a tab is tapped
        onTap: _onItemTapped,
      ),
    );
  }
}

// This is the widget for the "Home" tab (Index 0)
// It displays the placeholder buttons as requested
class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // Column arranges its children vertically
      child: Column(
        // MainAxisAlignment.center centers the children vertically
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // An ElevatedButton with a placeholder action
          ElevatedButton(
            onPressed: () {
              // Placeholder action for Button 1
              print('Button 1 Pressed');
            },
            child: const Text('Placeholder Button 1'),
          ),
          // SizedBox adds some spacing between the buttons
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Placeholder action for Button 2
              print('Button 2 Pressed');
            },
            child: const Text('Placeholder Button 2'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Placeholder action for Button 3
              print('Button 3 Pressed');
            },
            child: const Text('Placeholder Button 3'),
          ),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:bannerweb_mobile/burak_kerem/HomePage_UI.dart'; // Your existing HomePage_UI.dart

// void main() {
//   runApp(const BannerWebApp());
// }

