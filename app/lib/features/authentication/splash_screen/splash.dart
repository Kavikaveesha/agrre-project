import 'package:app/common/custom_shape/containers/circular_design_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../utils/constants/text_strings.dart';
import '../logIn_screen/login_main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: CircularDesignContainer(
        backText: '',
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: mediaQueryHeight * .2,
              ),
              // Eco Image
              Image(
                image: const AssetImage(
                  TImages.ecoIcon,
                ),
                height: mediaQueryHeight * .3,
              ),
              SizedBox(height: mediaQueryHeight * .01),

              // Main Titoe and sub title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Text(
                      EcoTexts.splashHeader,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(height: mediaQueryHeight * .05),
                    Text(
                      EcoTexts.splashSubHeader,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(height: mediaQueryHeight * .08),
              // Elevated button
              SizedBox(
                width: mediaQueryWidth * .8,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const LogIn());
                  },
                  child: Text(EcoTexts.splashbutton,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
