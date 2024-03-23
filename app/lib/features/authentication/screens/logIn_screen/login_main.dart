import 'package:app/common/custom_shape/containers/circular_design_container.dart';
import 'package:app/common/custom_shape/widgets/text_inputs/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controller/sign_in_controller.dart';
import '../forgot_password_method_screen/forgot_password_method.dart';
import '../register_screen/sign_up_main.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final SignInController _signInController = Get.put(SignInController());
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: CircularDesignContainer(
        backText: '',
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: mediaQueryHeight * .15),
              Center(
                child: Text(
                  EcoTexts.welbackHeader,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(height: mediaQueryHeight * .01),
              Image(
                image: const AssetImage(
                  TImages.ecoIcon,
                ),
                height: mediaQueryHeight * .3,
              ),

              // Start login form
              SizedBox(height: mediaQueryHeight * .005),
              EcoInputField(
                  controller: _emailController,
                  icon: Icons.email,
                  labelText: 'Enter your email'),
              SizedBox(height: mediaQueryHeight * .015),
              EcoInputField(
                  controller: _passwordController,
                  icon: Icons.lock,
                  labelText: 'Enter your password'),
              SizedBox(height: mediaQueryHeight * .01),

              // This is button to go forget password page
              TextButton(
                onPressed: () {
                  Get.to(() => const ForgotPasswordMethod());
                },
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    EcoTexts.welbackForgotPassword,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              SizedBox(height: mediaQueryHeight * .01),

              // This is signin button
              SizedBox(
                width: mediaQueryWidth * .9,
                child: ElevatedButton(
                  onPressed: () {
                    _signInController.signIn(
                        _emailController.text, _passwordController.text);
                  },
                  child: Text(
                    EcoTexts.welbackSignIn,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: mediaQueryHeight * .02),

              // this is form footer
              // Using signup button goto registration page
              const Text(
                EcoTexts.welbackDontHave,
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => const SignUp());
                },
                child: const Text(
                  EcoTexts.welbackSignUp,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
