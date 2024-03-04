import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabnavigationbar/info_screens.dart';
import 'drawer.dart';
import 'home_screen.dart'; // Import other pages as needed
import 'calculator_screen.dart';
import 'about_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;

  void _navigateToScreen(BuildContext context, int index) {
    // You can customize this logic based on your navigation requirements
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CalculatorScreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AboutScreen()),
        );
        break;
      // Add more cases for additional pages
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Dark Mode'),
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
                _saveThemePreference(value);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // Example: Navigate to HomeScreen when the button is pressed
                _navigateToScreen(context, 0);
              },
              child: Text('Go to Home Screen'),
            ),
            // Add more buttons or UI elements for additional pages as needed
          ],
        ),
      ),
      drawer: MyDrawer(onItemTap: (index) {
        // Handle drawer item tap as needed
        _navigateToScreen(context, index);
      }),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
        onTap: (index) {
          // Handle bottom navigation item tap as needed
          // You can use the same logic as in your MyHomePage widget
          // For example, updating the state to navigate to the selected page
          // You can replace the logic below with your desired navigation flow
          _navigateToScreen(context, index);
        },
      ),
    );
  }

  _saveThemePreference(bool isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("theme", isDarkMode);
  }
}
