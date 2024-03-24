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
      body: FutureBuilder<LoginStatus>(
        future: _checkLoginStatus(), // Check user login status
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen(); // Show splash screen while checking login status
          } else {
            switch (snapshot.data) {
              case LoginStatus.newUser:
                return const SplashScreen(); // Show splash screen for new users
              case LoginStatus.loggedIn:
                return const NavigationMenu(); // Show home screen for logged-in users
              case LoginStatus.loggedOut:
                return LogIn(); // Show login screen for logged-out users
              default:
                return const SplashScreen(); // Show splash screen for any other case
            }
          }
        },
      ),
    );
  }

  // Function to check user login status
  Future<LoginStatus> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstTimeLogin = prefs.getBool('firstTimeLogin');
    bool? isLoggedIn = prefs.getBool('isLoggedIn');

    if (isFirstTimeLogin == null || isFirstTimeLogin) {
      return LoginStatus.newUser; // User is new to the app
    } else if (isLoggedIn != null && isLoggedIn) {
      return LoginStatus.loggedIn; // User is logged in
    } else {
      return LoginStatus.loggedOut; // User is logged out
    }
  }
}

// Enum to represent different login statuses
enum LoginStatus {
  newUser, // User is new to the app
  loggedIn, // User is logged in
  loggedOut, // User is logged out
}
