import 'package:app/common/custom_shape/containers/circular_design_container.dart';
import 'package:app/utils/constants/mediaQuery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../common/custom_shape/widgets/text_inputs/text_input_field.dart';
import '../../../utils/constants/text_strings.dart';
import '../logIn_screen/login_main.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

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
                    SizedBox(height: MediaQueryUtils.getHeight(context) * .2),
                    Center(
                      child: Text(
                        EcoTexts.vryHeader,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    SizedBox(height: MediaQueryUtils.getHeight(context) * .01),
                    Image(
                      image: const AssetImage(
                        TImages.vryImg,
                      ),
                      height: MediaQueryUtils.getHeight(context) * .3,
                    ),

                    // Start login form
                    SizedBox(height: MediaQueryUtils.getHeight(context) * .005),
                    const EcoInputField(
                        icon: Icons.email, labelText: 'Enter Code Here...'),
                    SizedBox(height: MediaQueryUtils.getHeight(context) * .02),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            EcoTexts.vryInboxEmail,
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                              height: MediaQueryUtils.getHeight(context) * .02),
                          Row(
                            children: [
                              Text(EcoTexts.vryCheckEmail,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                              Text(EcoTexts.vryCheckEmail2,
                                  style:
                                      Theme.of(context).textTheme.bodyLarge!),
                            ],
                          ),
                          SizedBox(
                              height: MediaQueryUtils.getHeight(context) * .01),
                          Row(
                            children: [
                              Text(EcoTexts.vryCode,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                              InkWell(
                                onTap: () {},
                                child: Text(EcoTexts.vryCode2,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge!),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQueryUtils.getHeight(context) * .02),
                    SizedBox(
                      width: MediaQueryUtils.getWidth(context) * .9,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogIn()),
                          );
                        },
                        child: const Text(
                          EcoTexts.vryBtn,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
