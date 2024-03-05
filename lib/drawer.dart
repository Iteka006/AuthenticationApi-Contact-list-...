import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabnavigationbar/about_screen.dart';
import 'package:tabnavigationbar/settings_screen.dart';
import 'package:tabnavigationbar/signin_screen.dart';
import 'package:tabnavigationbar/signup_screen.dart';
import 'package:tabnavigationbar/main.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'contacts_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'contactpage.dart';

class MyDrawer extends StatelessWidget {
  final Function(int) onItemTap;

  MyDrawer({required this.onItemTap});

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();

    try {
      final pickedFile = await picker.pickImage(
        source: source,
      );

      if (pickedFile != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('profileImagePath', pickedFile.path);

        Navigator.pop(context); // Close the drawer
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile picture updated')),
        );
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

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
  child: FutureBuilder<ImageProvider<Object>>(
    future: _loadProfileImage(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return Column(
          children: [
            InkWell(
              onTap: () => _showImagePicker(context),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: snapshot.data,
                  ),
                  Positioned(
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                    bottom: 0,
                    right: 0,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Drawer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        );
      } else {
        return CircularProgressIndicator();
      }
    },
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
            ListTile(
  leading: Icon(Icons.contacts),
  title: Text('Contacts'),
  onTap: () {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContactPage(themeData: Theme.of(context)),
      ),
    );
  },
),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              _logout(context);
            },
          ),
        ],
      ),
    );
  }

  Future<ImageProvider<Object>> _loadProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('profileImagePath');

    return imagePath != null
        ? FileImage(File(imagePath))
        : AssetImage('assets/images/placeholder_image.jpg') as ImageProvider<Object>;
  }

  Future<void> _showImagePicker(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Choose an option'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () async {
                await _pickImage(context, ImageSource.camera);
              },
              child: Text('Take a picture'),
            ),
            SimpleDialogOption(
              onPressed: () async {
                await _pickImage(context, ImageSource.gallery);
              },
              child: Text('Choose from gallery'),
            ),
          ],
        );
      },
    );
  }
}
