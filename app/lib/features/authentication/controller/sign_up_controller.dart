import 'dart:async';

import 'package:app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/custom_shape/widgets/snack_bar/snack_bar.dart';
import '../screens/logIn_screen/login_main.dart';
import '../screens/verify_screen/verify_main_screen.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> register(
      String firstName,
      String lastName,
      String email,
      String mobile,
      String address,
      String passsword,
      String conformPassword,
      BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (passsword.trim() == conformPassword.trim()) {
        try {
          UserCredential userCredential =
              await _auth.createUserWithEmailAndPassword(
            email: email.trim(),
            password: passsword.trim(),
          );
          await sendVerificationEmail(userCredential.user!);
          String? imageUrl = await getImageURL();
          await addUser(
            firstName.trim(),
            lastName.trim(),
            email.trim(),
            int.parse(mobile), // Convert mobile to int
            address.trim(),
            imageUrl,
          );
          SnackbarHelper.showSnackbar(
            title: 'Verify User',
            message: 'Going to Verification page',
            backgroundColor: TColors.appPrimaryColor,
          );
          Future.delayed(const Duration(seconds: 1), () {
            navigateToNextScreen(context);
          });
        } catch (e) {
          SnackbarHelper.showSnackbar(
            title: 'Error',
            message: e.toString(),
            backgroundColor: Colors.red,
          );
        }
      } else {
        SnackbarHelper.showSnackbar(
          title: 'Error',
          message: 'Password and confirm password do not match',
          backgroundColor: Colors.red,
        );
      }
    } else {
      SnackbarHelper.showSnackbar(
        title: 'Error',
        message: 'Please fill all inputs',
        backgroundColor: Colors.red,
      );
    }
  }

  Future<String?> getImageURL() async {
    final ref = FirebaseStorage.instance.ref().child('profile_images/user.png');
    String downloadUrl = await ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> addUser(
    String firstName,
    String lastName,
    String email,
    int mobile,
    String address,
    String? imgUrl,
  ) async {
    await FirebaseFirestore.instance.collection('users').doc(email).set({
      'first_name': firstName,
      'last_name': lastName,
      'mobile': mobile,
      'email': email,
      'address': address,
      'imgUrl': imgUrl
    });
  }

  Future<void> sendVerificationEmail(User user) async {
    if (!user.emailVerified) {
      await user.sendEmailVerification();
      print('Verification email sent');
    }
  }

  Future<void> navigateToNextScreen(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('firstTimeLogin', false);
    Get.to(() => const VerificationScreen());
  }

  // Verify User
  Future<void> verifyUser() async {
    // Reload the user data to ensure the latest verification status
    await FirebaseAuth.instance.currentUser!.reload();

    // Check if the email is verified
    if (FirebaseAuth.instance.currentUser!.emailVerified) {
      SnackbarHelper.showSnackbar(
        title: 'Success',
        message: 'You have successfully signed up. Please proceed.',
        backgroundColor: TColors.appPrimaryColor,
      );

      // Navigate to the login screen after a delay
      Future.delayed(const Duration(seconds: 1), () {
        Get.offAll(() => const LogIn());
      });
    } else {
      // User has not verified the email
      Get.snackbar('Info', 'Please verify your email to continue',
          backgroundColor: Colors.red);
    }
  }

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your first name';
    }
    return null;
  }

  String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Last name';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!isValidEmail(value)) {
      return 'Please enter Valid email';
    }
    return null;
  }

  String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Mobile Number';
    }

    return null;
  }

  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Last name';
    }
    if (value.length < 6) {
      return 'Password Should be minimum 6 digits';
    }
    return null;
  }
}
