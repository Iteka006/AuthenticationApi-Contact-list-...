// about_screen.dart
import 'package:flutter/material.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';


class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Text('About Screen'),
      ),
    );
  }
}
