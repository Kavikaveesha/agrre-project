import 'dart:async';

import 'package:app/common/custom_shape/containers/circular_design_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/custom_shape/widgets/text_inputs/text_input_field.dart';
import '../../../utils/constants/mediaQuery.dart';

class ChangePasswordMain extends StatefulWidget {
  const ChangePasswordMain({super.key});

  @override
  State<ChangePasswordMain> createState() => _ChangePasswordMainState();
}

class _ChangePasswordMainState extends State<ChangePasswordMain> {
  @override
  Widget build(BuildContext context) {
    final mediaqueryWidth = MediaQueryUtils.getWidth(context);
    final mediaqueryHeight = MediaQueryUtils.getHeight(context);
    return Scaffold(
      body: SingleChildScrollView(
          child: CircularDesignContainer(
              backText: 'Back',
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(height: MediaQueryUtils.getHeight(context) * .2),
                      Text('Change Password',
                          style: Theme.of(context).textTheme.headlineMedium),
                      SizedBox(
                          height: MediaQueryUtils.getHeight(context) * .05),
                      Center(
                        child: Column(
                          children: [
                            const EcoInputField(
                                icon: Icons.remove_red_eye_rounded,
                                labelText: 'Enter your old Password'),
                            SizedBox(
                                height:
                                    MediaQueryUtils.getHeight(context) * .015),
                            const EcoInputField(
                                icon: Icons.remove_red_eye_rounded,
                                labelText: 'Enter your New Password'),
                            SizedBox(
                                height:
                                    MediaQueryUtils.getHeight(context) * .015),
                            const EcoInputField(
                                icon: Icons.remove_red_eye_rounded,
                                labelText: 'Re Enter your Password'),
                            SizedBox(
                                height:
                                    MediaQueryUtils.getHeight(context) * .02),
                            SizedBox(
                              width: MediaQueryUtils.getWidth(context) * .9,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('Sava Password',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))),
    );
  }
}
