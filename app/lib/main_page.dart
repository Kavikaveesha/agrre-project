import 'package:app/features/authentication/screens/logIn_screen/login_main.dart';
import 'package:app/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/authentication/screens/splash_screen/splash.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future:
            _checkFirstTimeLogin(), // Check if it's the first time the user logs in
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen(); // Show splash screen while checking login status
          } else {
            if (snapshot.data == true) {
              return LogIn(); // Navigate to login screen if it's the first time login
            } else {
              return const NavigationMenu(); // Navigate to home screen if not first time login
            }
          }
        },
      ),
    );
  }

  // Function to check if it's the first time the user logs in
  Future<bool> _checkFirstTimeLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('firstTimeLogin') ??
        true; // Default to true if the flag doesn't exist
  }
}
