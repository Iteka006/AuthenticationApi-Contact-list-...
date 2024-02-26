import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tabnavigationbar/signin_screen.dart';
import 'package:tabnavigationbar/signup_screen.dart';
import 'firebase_options.dart';
import 'package:permission_handler/permission_handler.dart';
import 'app.dart';
import 'contacts_helper.dart';
void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: ThemePreference().getTheme(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // Apply the selected theme
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SignInScreen(),
            theme: snapshot.data ?? false ? ThemeData.dark() : ThemeData.light(),
          );
        } else {
          // Show loading indicator or return a default theme
          return CircularProgressIndicator();
        }
      },
    );
  }
}

void checkInternetConnection() async {
  InternetConnectionStatus status = await InternetConnectionChecker().connectionStatus;

  if (status == InternetConnectionStatus.disconnected) {
    Fluttertoast.showToast(
      msg: "No internet connection",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}


