import 'package:app/common/custom_shape/containers/circular_design_container.dart';
import 'package:app/utils/constants/mediaQuery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../common/custom_shape/widgets/text_inputs/text_input_field.dart';
import '../../../utils/constants/text_strings.dart';
import '../logIn_screen/login_main.dart';
import '../verify_screen/verify_main_screen.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: CircularDesignContainer(
              backText: 'Back',
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(height: MediaQueryUtils.getHeight(context) * .15),
                    // Register form header
                    Center(
                      child: Text(EcoTexts.welcomeHeaderRegister,
                          style: Theme.of(context).textTheme.headlineMedium),
                    ),
                    // This is eco image
                    Image(
                      image: const AssetImage(
                        TImages.ecoIcon,
                      ),
                      height: MediaQueryUtils.getHeight(context) * .3,
                    ),
                    SizedBox(height: MediaQueryUtils.getHeight(context) * .005),
                    const EcoInputField(
                        icon: Icons.man, labelText: 'Enter your First Name'),
                    SizedBox(height: MediaQueryUtils.getHeight(context) * .015),

                    const EcoInputField(
                        icon: Icons.man, labelText: 'Enter your Second Name'),
                    SizedBox(height: MediaQueryUtils.getHeight(context) * .015),
                    const EcoInputField(
                        icon: Icons.mail, labelText: 'Enter your Email'),
                    SizedBox(height: MediaQueryUtils.getHeight(context) * .015),

                    const EcoInputField(
                        icon: Icons.mobile_friendly,
                        labelText: 'Enter your Mobile Number'),
                    SizedBox(height: MediaQueryUtils.getHeight(context) * .015),

                    const EcoInputField(
                        icon: Icons.location_on,
                        labelText: 'Enter your Address'),
                    SizedBox(height: MediaQueryUtils.getHeight(context) * .015),

                    const EcoInputField(
                        icon: Icons.remove_red_eye_rounded,
                        labelText: 'Enter your Password'),
                    SizedBox(height: MediaQueryUtils.getHeight(context) * .015),
                    const EcoInputField(
                        icon: Icons.remove_red_eye_rounded,
                        labelText: 'ReEnter your Password'),
                    SizedBox(height: MediaQueryUtils.getHeight(context) * .015),
                    SizedBox(
                      width: MediaQueryUtils.getWidth(context) * .9,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => const VerificationScreen());
                        },
                        child: Text(
                          EcoTexts.welcomeRegister,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQueryUtils.getWidth(context) * .02),
                    const Text(
                      EcoTexts.welcomeAlreadyAccount,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const LogIn());
                      },
                      child: const Text(
                        EcoTexts.welcomeSignIn,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
