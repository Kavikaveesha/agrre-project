import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../common/custom_shape/containers/circular_design_container.dart';
import '../../../../common/custom_shape/widgets/text_inputs/text_input_field.dart';
import '../../../../utils/constants/mediaQuery.dart';
import '../../../../utils/constants/text_strings.dart';
import '../reset_password.dart';

class VerifyGetCodeEmail extends StatelessWidget {
  const VerifyGetCodeEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController optCodeController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: CircularDesignContainer(
          backText: 'Back',
          child: Column(
            children: [
              SizedBox(height: MediaQueryUtils.getHeight(context) * 0.3),
              // Header text
              Center(
                child: Text(
                  EcoTexts.pvgHeader,
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

              // Get opt input
              EcoInputField(
                controller: optCodeController,
                icon: Icons.password,
                labelText: 'Enter get code(******)',
              ),

              SizedBox(height: MediaQueryUtils.getHeight(context) * 0.025),

              SizedBox(
                width: MediaQueryUtils.getWidth(context) * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    // Check if OTP code is okay
                    var optCodeIsOk = int.tryParse(optCodeController.text);
                    if (optCodeIsOk != null && optCodeIsOk == 12345) {
                      Get.to(() => const ResetPasswordForm());
                    } else {
                      // Show a message box with a message and an OK button
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Error"),
                            content: const Text(
                                "Invalid OTP code. Please try again."),
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
                  },
                  child: const Text(
                    EcoTexts.evgBtn1,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
