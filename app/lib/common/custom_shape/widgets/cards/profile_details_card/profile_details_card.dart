import 'package:app/utils/constants/mediaQuery.dart';
import 'package:flutter/material.dart';

class ProfileDetailsCard extends StatelessWidget {
  const ProfileDetailsCard(
      {super.key, required this.text, required this.onTap, required this.icon});
  final String text;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;

    Color backgroundColor;
    if (brightness == Brightness.light) {
      backgroundColor = Colors.white; // Light mode background color
    } else {
      backgroundColor = Colors.black54; // Dark mode background color
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQueryUtils.getWidth(context) * .9,
        height: MediaQueryUtils.getHeight(context) * .08,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 24,
              ),
              SizedBox(
                width: MediaQueryUtils.getWidth(context) * .06,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
