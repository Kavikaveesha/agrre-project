import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/common/custom_shape/containers/circular_design_container.dart';
import 'package:app/features/authentication/screens/logIn_screen/login_main.dart';
import 'package:app/utils/constants/mediaQuery.dart';
import 'package:app/utils/constants/image_strings.dart';
import 'package:app/common/custom_shape/widgets/text_inputs/text_input_field.dart';
import 'package:app/utils/constants/text_strings.dart';
import '../../controller/sign_up_controller.dart';



class SignUp extends StatefulWidget {
  const SignUp({Key? key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController conformPasswordController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    mobileNumberController.dispose();
    addressController.dispose();
    conformPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.put(SignUpController());
    return Scaffold(
      body: SingleChildScrollView(
        child: CircularDesignContainer(
          backText: 'Back',
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  SizedBox(height: MediaQueryUtils.getHeight(context) * .15),
                  Center(
                    child: Text(
                      EcoTexts.welcomeHeaderRegister,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Image(
                    image: AssetImage(
                      TImages.ecoIcon,
                    ),
                    height: MediaQueryUtils.getHeight(context) * .3,
                  ),
                  SizedBox(height: MediaQueryUtils.getHeight(context) * .005),
                  EcoInputField(
                    validator: controller.validateFirstName,
                    controller: firstNameController,
                    icon: Icons.person,
                    labelText: 'Enter your First Name',
                  ),
                  SizedBox(height: MediaQueryUtils.getHeight(context) * .015),
                  EcoInputField(
                    validator: controller.validateLastName,
                    controller: lastNameController,
                    icon: Icons.person,
                    labelText: 'Enter your Last Name',
                  ),
                  SizedBox(height: MediaQueryUtils.getHeight(context) * .015),
                  EcoInputField(
                    validator: controller.validateEmail,
                    controller: emailController,
                    icon: Icons.mail,
                    labelText: 'Enter your Email',
                  ),
                  SizedBox(height: MediaQueryUtils.getHeight(context) * .015),
                  EcoInputField(
                    maxLength: 10,
                    keyboardtype: TextInputType.number,
                    validator: controller.validateMobileNumber, // Add validator
                    controller: mobileNumberController,
                    icon: Icons.phone,
                    labelText: 'Enter your Mobile Number',
                  ),
                  SizedBox(height: MediaQueryUtils.getHeight(context) * .015),
                  EcoInputField(
                    validator: controller.validateAddress,
                    controller: addressController,
                    icon: Icons.location_on,
                    labelText: 'Enter your Address',
                  ),
                  SizedBox(height: MediaQueryUtils.getHeight(context) * .015),
                  EcoInputField(
                    validator: controller.validatePassword,
                    controller: passwordController,
                    icon: Icons.lock,
                    labelText: 'Enter your Password',
                  ),
                  SizedBox(height: MediaQueryUtils.getHeight(context) * .015),
                  EcoInputField(
                    validator: controller.validatePassword,
                    controller: conformPasswordController,
                    icon: Icons.lock,
                    labelText: 'Re-enter your Password',
                  ),
                  SizedBox(height: MediaQueryUtils.getHeight(context) * .015),
                  SizedBox(
                    width: MediaQueryUtils.getWidth(context) * .9,
                    child: ElevatedButton(
                      onPressed: () {
                        // Call register method with required parameters
                        controller.register(
                          firstNameController.text,
                          lastNameController.text,
                          emailController.text,
                          mobileNumberController.text,
                          addressController.text,
                          passwordController.text,
                          conformPasswordController.text,
                          context, // Pass context to navigate method
                        );
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
                        color: Colors.blue,
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
