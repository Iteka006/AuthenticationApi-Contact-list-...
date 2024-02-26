import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _initConnectivity(context); // Initialize connectivity

    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: NewsScreen(), // Replace with the desired starting screen
    );
  }

  void _initConnectivity(BuildContext context) {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        _showOfflineAlert(context);
      }
    });
  }

  void _showOfflineAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Offline'),
          content: Text('You are currently offline. Please check your internet connection.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Center(
        child: Text('News Screen Content'),
      ),
    );
  }
}
