import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class GreenContainer extends StatelessWidget {
  const GreenContainer({super.key, required this.child, required this.height});
  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: TColors.appPrimaryColor,
      child: child,
    );
  }
}
