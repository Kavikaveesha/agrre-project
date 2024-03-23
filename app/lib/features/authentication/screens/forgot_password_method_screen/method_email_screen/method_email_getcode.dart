import 'dart:async';

import 'package:app/common/custom_shape/containers/circular_design_container.dart';
import 'package:app/common/custom_shape/widgets/text_inputs/text_input_field.dart';
import 'package:app/features/authentication/screens/logIn_screen/login_main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/mediaQuery.dart';
import '../../../../../utils/constants/text_strings.dart';

// Email validation function
bool isValidEmail(String email) {
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}

class MethodEmail extends StatelessWidget {
  const MethodEmail({Key? key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();

    // Function to handle password reset
    Future<void> passwordReset() async {
      String email = _emailController.text.trim();

      // Email validation
      if (!isValidEmail(email)) {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content:
                  Text('Invalid email format. Please enter a valid email.'),
            );
          },
        );
        // } else if (email != currentUser.email) {
        //   showDialog(
        //     context: context,
        //     builder: (context) {
        //       return const AlertDialog(
        //         content:
        //             Text('Entered email does not match with registered email.'),
        //       );
        //     },
        //   );
        // } else {
      }
      try {
        // Send password reset email
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

        // Show success dialog
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('Password reset link sent. Check your email.'),
            );
          },
        );

        // Redirect to login page after 3 seconds
        Timer(const Duration(seconds: 3), () {
          Get.to(() => const LogIn());
        });
      } on FirebaseException catch (e) {
        // Show error dialog if FirebaseException occurs
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          },
        );
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: CircularDesignContainer(
            backText: 'Back',
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(height: MediaQueryUtils.getHeight(context) * .3),
                  // Header text
                  Center(
                    child: Text(
                      EcoTexts.megHeader,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Eco image
                  Image(
                    image: const AssetImage(
                      TImages.ecoIcon,
                    ),
                    height: MediaQueryUtils.getHeight(context) * .3,
                  ),
                  SizedBox(
                    height: MediaQueryUtils.getHeight(context) * .005,
                  ),
                  // Email input field
                  EcoInputField(
                    controller: _emailController,
                    icon: Icons.mail,
                    labelText: 'Enter your email address',
                  ),
                  SizedBox(
                    height: MediaQueryUtils.getHeight(context) * .025,
                  ),
                  // Send code button
                  SizedBox(
                    width: MediaQueryUtils.getWidth(context) * .9,
                    child: ElevatedButton(
                      onPressed: passwordReset,
                      child: const Text(
                        'Send Code',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
