import 'package:app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard(
      {super.key,
      required this.x,
      required this.height,
      required this.imageName,
      required this.title,
      required this.onTap});
  final double x;
  final double height;
  final String imageName;
  final String title;
  final VoidCallback onTap;

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
          children: [
            ClipOval(
              child: Image.asset(
                imageName,
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
