import 'package:flutter/material.dart';

import '../../../common/custom_shape/widgets/text_inputs/text_input_field.dart';
import '../../../utils/constants/mediaQuery.dart';

class UpdateProfileDetails extends StatefulWidget {
  const UpdateProfileDetails({super.key});

  @override
  State<UpdateProfileDetails> createState() => _UpdateProfileDetailsState();
}

class _UpdateProfileDetailsState extends State<UpdateProfileDetails> {
  @override
  Widget build(BuildContext context) {
    final mediaqueryWidth = MediaQueryUtils.getWidth(context);
    final mediaqueryHeight = MediaQueryUtils.getHeight(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text("Your Details",
                    style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(height: mediaqueryHeight * .1),
                const EcoInputField(icon: Icons.man, labelText: 'Kavindu'),
                SizedBox(height: MediaQueryUtils.getHeight(context) * .015),
                const EcoInputField(icon: Icons.man, labelText: 'Kaveesha'),
                SizedBox(height: MediaQueryUtils.getHeight(context) * .015),
                const EcoInputField(
                    icon: Icons.mail, labelText: 'Kavindu@gmail.com'),
                SizedBox(height: MediaQueryUtils.getHeight(context) * .015),
                const EcoInputField(
                    icon: Icons.mobile_friendly, labelText: '0771235405'),
                SizedBox(height: MediaQueryUtils.getHeight(context) * .015),
                const EcoInputField(
                    maxLines: 2,
                    icon: Icons.location_on,
                    labelText: 'N0:57,main street,colombo'),
                SizedBox(height: MediaQueryUtils.getHeight(context) * .015),
                const SizedBox(height: 30),
                SizedBox(
                  width: mediaqueryWidth * .9,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Confirmation'),
                            content: const Text("Do you want to Update?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('NO'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Write code here for "yes" action
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Update Details',
                        style: Theme.of(context).textTheme.headlineSmall),
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
