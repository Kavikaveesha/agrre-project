import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainCard extends StatelessWidget {
  const MainCard(
      {super.key,
      required this.child,
      required this.x,
      required this.height,
      required this.imageName,
      required this.title, required this.onTap});
  final Widget child;
  final double x;
  final double height;
  final String imageName;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * x,
        height: height,
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          color: Colors.white, // Light ash color
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
        child: child
      ),
    );
  }
}
