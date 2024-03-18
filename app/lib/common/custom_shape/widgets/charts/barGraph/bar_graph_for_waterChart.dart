import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../../../utils/constants/colors.dart';
import 'bar-data_water_chart copy.dart';

class MyBargraph extends StatelessWidget {
  final List weeklyUsage;
  const MyBargraph({super.key, required this.weeklyUsage});

  @override
  Widget build(BuildContext context) {
    // data
    BarDataForWaterChart myBarData = BarDataForWaterChart(
      sunUsage: weeklyUsage[0],
      monUsage: weeklyUsage[1],
      tueUsage: weeklyUsage[2],
      wedUsage: weeklyUsage[3],
      thuUsage: weeklyUsage[4],
      friUsage: weeklyUsage[5],
      satUsage: weeklyUsage[6],
    );

    myBarData.initializedData(); // Call the method to initialize data

    return BarChart(
      BarChartData(
        maxY: 100,
        minY: 0,
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(
            show: true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true, getTitlesWidget: getBottumTitles))),
        barGroups: myBarData.barDataforWaterChart
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                      toY: data.y,
                      color: TColors.appPrimaryColor,
                      width: 15,
                      borderRadius: BorderRadius.circular(.4))
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

Widget getBottumTitles(double value, TitleMeta meta) {
  const style =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14);
  Widget text;

  switch (value.toInt()) {
    case 1:
      text = const Text(
        'S',
        style: style,
      );
      break;
    case 2:
      text = const Text(
        'M',
        style: style,
      );
      break;
    case 3:
      text = const Text(
        'T',
        style: style,
      );
      break;
    case 4:
      text = const Text(
        'W',
        style: style,
      );
      break;
    case 5:
      text = const Text(
        'T',
        style: style,
      );
      break;
    case 6:
      text = const Text(
        'F',
        style: style,
      );
    case 7:
      text = const Text(
        'S',
        style: style,
      );
      break;

    default:
      text = const Text(
        '',
        style: style,
      );
      break;
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
