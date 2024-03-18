import 'package:flutter/material.dart';

import '../../../../../common/custom_shape/widgets/charts/barGraph/bar_graph_for_waterChart.dart';
import '../../../../../utils/constants/mediaQuery.dart';

class WaterBarChart extends StatelessWidget {
  const WaterBarChart({super.key, required this.weeklyUsage});
  final List<double> weeklyUsage;

  @override
  Widget build(BuildContext context) {
    final mediaqueryWidth = MediaQueryUtils.getWidth(context);
    final Brightness brightness = Theme.of(context).brightness;

    Color backgroundColor;
    if (brightness == Brightness.light) {
      backgroundColor = Colors.white; // Light mode background color
    } else {
      backgroundColor = Colors.black54; // Dark mode background color
    }
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Container(
            width: mediaqueryWidth,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: MyBargraph(
                  weeklyUsage: weeklyUsage,
                ),
              ),
            )));
  }
}
