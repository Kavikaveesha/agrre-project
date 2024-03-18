import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';

class RectangleCard extends StatelessWidget {
  const RectangleCard(
      {super.key,
      required this.x,
      required this.height,
      required this.title,
      required this.onTap,
      required this.subtitle,
      required this.iconName});
  final double x;
  final double height;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final IconData iconName;

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;

    Color backgroundColor;
    if (brightness == Brightness.light) {
      backgroundColor = Colors.white; // Light mode background color
    } else {
      backgroundColor = TColors.appPrimaryColor; // Dark mode background color
    }
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * x,
        height: height,
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          color: backgroundColor, // Light ash color
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Icon(
                      iconName,
                      color: Colors.black,
                      size: 60.0,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight
                                  .bold, // Add your additional font weight here
                            ),
                      ),
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
