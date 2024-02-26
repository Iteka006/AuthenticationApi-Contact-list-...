// my_drawer.dart
import 'package:flutter/material.dart';
import 'package:tabnavigationbar/about_screen.dart';
// import 'package:tabnavigationbar/about_screen.dart';
import 'package:tabnavigationbar/settings_screen.dart';
import 'package:tabnavigationbar/signin_screen.dart';
import 'package:tabnavigationbar/signup_screen.dart';
import 'package:tabnavigationbar/main.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'contacts_helper.dart';

// import 'package:connectivity_plus/connectivity_plus.dart';


class MyDrawer extends StatelessWidget {
  final Function(int) onItemTap;

  MyDrawer({required this.onItemTap});

   // Function to handle logout
void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout Confirmation'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                // Implement your logout logic here
                // For example, clear user session, navigate to login page, etc.
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
         DrawerHeader(
  decoration: BoxDecoration(
    color: Colors.blue,
  ),
  child: Column(
    children: [
      // Add your profile picture here
      CircleAvatar(
        radius: 40, // Adjust the radius as needed
        backgroundImage: AssetImage('assets/images/profile.jpeg'),
      ),
      SizedBox(height: 10), // Add some spacing between the profile picture and text
      Text(
        'Drawer',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    ],
  ),
),

          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              onItemTap(0);
            },
          ),
          ListTile(
            leading: Icon(Icons.calculate),
            title: Text('Calculator'),
            onTap: () {
              onItemTap(1);
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              onItemTap(2);
            },
          ),
          ListTile(
            leading: Icon(Icons.new_releases),
            title: Text('News'),
            onTap: () {
              // Handle navigation to the News screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => NewsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Handle navigation to the Settings screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),

          // In MyDrawer widget

          ListTile(
            leading: Icon(Icons.contacts),
            title: Text('Contacts'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              requestContactPermission();
            },
          ),

            ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Logout'),
                      onTap: () {
                        _logout(context); // Call the logout function
                      },
                    ),

                  ],
                ),
              );
            }
          }
