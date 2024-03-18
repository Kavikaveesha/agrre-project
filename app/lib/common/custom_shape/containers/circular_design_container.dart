import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'circular_container.dart';

class CircularDesignContainer extends StatelessWidget {
  const CircularDesignContainer({super.key, required this.child, required this.backText});
  final Widget child;
  final String backText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(top: -110, left: -5, child: TCircularContainer()),
        const Positioned(top: -40, left: -110, child: TCircularContainer()),
        Positioned(
          top: 10,
          right: 20,
          child: TextButton(
              onPressed: () {
                Get.back();
              },
              child:
                  Text(backText, style: Theme.of(context).textTheme.bodyMedium)),
        ),
        Container(
          child: child,
        )
      ],
    );
  }
}
