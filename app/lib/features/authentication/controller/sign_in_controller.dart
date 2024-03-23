import 'package:app/common/custom_shape/widgets/snack_bar/snack_bar.dart';
import 'package:app/utils/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../navigation_menu.dart';

class SignInController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      // Navigate to home page after successful sign-in
      SnackbarHelper.showSnackbar(
          title: 'Login success!',
          message: 'Welcome back ',
          backgroundColor: TColors.appPrimaryColor);
      // Redirect to another page after 3 seconds
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAll(() => const NavigationMenu());
      });
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'An error occurred.';
      // Check error code and set appropriate error message
      if (e.code == 'invalid-email') {
        errorMessage = 'Invalid email address.';
      } else if (e.code == 'user-not-found') {
        errorMessage = 'User not found. Please check your email address.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Incorrect password. Please try again.';
      }
      SnackbarHelper.showSnackbar(
          title: 'Login Error!',
          message: errorMessage,
          backgroundColor: Colors.red);
    } catch (e) {
      print('Error occurred: $e');
      SnackbarHelper.showSnackbar(
          title: 'Login Error!',
          message: 'An unexpected error occurred',
          backgroundColor: Colors.red);
    }
  }
}
