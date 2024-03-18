import 'package:flutter/material.dart';

import '../../../common/custom_shape/widgets/text_inputs/text_input_field.dart';
import '../../../utils/constants/mediaQuery.dart';
import '../../authentication/forgot_password_method_screen/forgot_password_method.dart';

class ChangePasswordMain extends StatefulWidget {
  const ChangePasswordMain({super.key});

  @override
  State<ChangePasswordMain> createState() => _ChangePasswordMainState();
}

class _ChangePasswordMainState extends State<ChangePasswordMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text('Change Password',
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 50),
                Center(
                  child: Column(
                    children: [
                      const EcoInputField(
                          icon: Icons.remove_red_eye_rounded,
                          labelText: 'Enter your old Password'),
                      SizedBox(
                          height: MediaQueryUtils.getHeight(context) * .015),
                      const EcoInputField(
                          icon: Icons.remove_red_eye_rounded,
                          labelText: 'Enter your New Password'),
                      SizedBox(
                          height: MediaQueryUtils.getHeight(context) * .015),
                      const EcoInputField(
                          icon: Icons.remove_red_eye_rounded,
                          labelText: 'Re Enter your Password'),
                      SizedBox(
                          height: MediaQueryUtils.getHeight(context) * .02),
                      SizedBox(
                        width: MediaQueryUtils.getWidth(context) * .9,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Sava Password',
                              style: Theme.of(context).textTheme.headlineSmall),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
