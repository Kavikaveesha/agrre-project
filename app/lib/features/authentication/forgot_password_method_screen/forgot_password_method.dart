import 'package:app/common/custom_shape/containers/circular_design_container.dart';
import 'package:app/utils/constants/mediaQuery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../utils/constants/text_strings.dart';
import 'method_email_screen/method_email_getcode.dart';
import 'method_phone_screen/method_phone_getcode.dart';

class ForgotPasswordMethod extends StatelessWidget {
  const ForgotPasswordMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: CircularDesignContainer(
        backText: 'Back',
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            SizedBox(height: MediaQueryUtils.getHeight(context) * .2),
            // Forget Password Header Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(EcoTexts.cvmHeader,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 20)),
            ),
            // Eco Image
            Image(
              image: const AssetImage(
                TImages.ecoIcon,
              ),
              height: MediaQueryUtils.getHeight(context) * .3,
            ),
            SizedBox(height: MediaQueryUtils.getHeight(context) * .005),

            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => const MethodEmail());
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 50),
                  ),
                  child: const Text(
                    EcoTexts.cvmBtn1,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: MediaQueryUtils.getHeight(context) * .02),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => const MethodPhone());
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 50),
                  ),
                  child: const Text(
                    EcoTexts.cvmBtn2,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    ));
  }
}
