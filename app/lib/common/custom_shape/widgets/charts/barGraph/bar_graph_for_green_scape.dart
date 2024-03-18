import 'package:app/common/custom_shape/widgets/charts/barGraph/bar-data_green_scape.dart';
import 'package:app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

// List<Map<String, dynamic>> greenScapeList = [
//   {'itemName': 'Item 1', 'value': 34.5},
//   {'itemName': 'Item 2', 'value': 20},
//   {'itemName': 'Item 3', 'value': 46.5},
//   {'itemName': 'Item 4', 'value': 56.8},
//   {'itemName': 'Item 5', 'value': 43.8},
//   {'itemName': 'Item 6', 'value': 33.9},
//   {'itemName': 'Item 7', 'value': 60},
// ];

class GreenScapeBarChart extends StatelessWidget {
  final List<Map<String, dynamic>> greenScapeList;

  const GreenScapeBarChart({
    super.key,
    required this.greenScapeList,
  });

  @override
  Widget build(BuildContext context) {
    // data
    BarDataforGreenScape mybarData = BarDataforGreenScape(
        gsItem1: greenScapeList[0]['value'],
        gsItem2: greenScapeList[1]['value'],
        gsItem3: greenScapeList[2]['value'],
        gsItem4: greenScapeList[3]['value'],
        gsItem5: greenScapeList[4]['value']);

    mybarData.initializedData(); // Call the method to initialize data

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
        barGroups: mybarData.barDataforGreenScape
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
        'gs1',
        style: style,
      );
      break;
    case 2:
      text = const Text(
        'gs2',
        style: style,
      );
      break;
    case 3:
      text = const Text(
        'gs3',
        style: style,
      );
      break;
    case 4:
      text = const Text(
        'gs4',
        style: style,
      );
      break;
    case 5:
      text = const Text(
        'gs5',
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
  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
