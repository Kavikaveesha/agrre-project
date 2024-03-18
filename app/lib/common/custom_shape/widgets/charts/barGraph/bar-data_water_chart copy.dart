import 'package:app/common/custom_shape/widgets/charts/barGraph/individual_bar.dart';

class BarDataForWaterChart {
  final double sunUsage;
  final double monUsage;
  final double tueUsage;
  final double wedUsage;
  final double thuUsage;
  final double friUsage;
  final double satUsage;

  BarDataForWaterChart(
      {required this.sunUsage,
      required this.monUsage,
      required this.tueUsage,
      required this.wedUsage,
      required this.thuUsage,
      required this.friUsage,
      required this.satUsage});

  List<IndividualBar> barDataforWaterChart = [];
  void initializedData() {
    barDataforWaterChart = [
      IndividualBar(x: 1, y: sunUsage),
      IndividualBar(x: 2, y: monUsage),
      IndividualBar(x: 3, y: tueUsage),
      IndividualBar(x: 4, y: wedUsage),
      IndividualBar(x: 5, y: thuUsage),
      IndividualBar(x: 6, y: friUsage),
      IndividualBar(x: 7, y: satUsage),
    ];
  }
}
