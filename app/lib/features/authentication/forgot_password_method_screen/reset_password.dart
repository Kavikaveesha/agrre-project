import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../common/custom_shape/containers/circular_design_container.dart';
import '../../../common/custom_shape/widgets/text_inputs/text_input_field.dart';
import '../../../utils/constants/mediaQuery.dart';
import '../../../utils/constants/text_strings.dart';
import '../logIn_screen/login_main.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController reEnterNewPasswordController =
        TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: CircularDesignContainer(
          backText: 'Back',
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: MediaQueryUtils.getHeight(context) * 0.25),
                // Header text
                Center(
                  child: Text(
                    EcoTexts.fpfHeader,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ),

                // This is eco image
                Image(
                  image: const AssetImage(
                    TImages.ecoIcon,
                  ),
                  height: MediaQueryUtils.getHeight(context) * 0.3,
                ),
                SizedBox(height: MediaQueryUtils.getHeight(context) * 0.005),

                // Get new password input
                EcoInputField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Password';
                    }
                    // Add more validation logic as needed
                    return null; // Return null if validation succeeds
                  },
                  controller: newPasswordController,
                  icon: Icons.remove_red_eye,
                  labelText: 'Enter new password',
                ),

                SizedBox(height: MediaQueryUtils.getHeight(context) * 0.025),

                // Get reenter password input
                EcoInputField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Re Enter Password';
                    }
                    // Add more validation logic as needed
                    return null; // Return null if validation succeeds
                  },
                  controller: reEnterNewPasswordController,
                  icon: Icons.remove_red_eye,
                  labelText: 'ReEnter new password',
                ),

                SizedBox(height: MediaQueryUtils.getHeight(context) * 0.025),

                SizedBox(
                  width: MediaQueryUtils.getWidth(context) * .9,
                  child: ElevatedButton(
                    onPressed: () {
                      if (newPasswordController.text.isEmpty ||
                          reEnterNewPasswordController.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Error"),
                              content: const Text("Enter Password."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        if (newPasswordController.text.length < 5 ||
                            reEnterNewPasswordController.text.length < 5) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Error"),
                                content: const Text(
                                    "Password should be minimun 5 characters"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          // Check if passwords match
                          if (newPasswordController.text ==
                              reEnterNewPasswordController.text) {
                            Get.to(() => const LogIn());
                          } else {
                            // Show error message
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Error"),
                                  content: const Text(
                                      "Passwords do not match. Please try again."),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("OK"),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      }
                    },
                    child: const Text(
                      EcoTexts.fpfBtn1,
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
    );
  }
}
