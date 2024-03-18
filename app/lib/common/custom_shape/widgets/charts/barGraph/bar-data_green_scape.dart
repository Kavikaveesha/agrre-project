import 'package:app/common/custom_shape/widgets/charts/barGraph/individual_bar.dart';

class BarDataforGreenScape {
  final double gsItem1;
  final double gsItem2;
  final double gsItem3;
  final double gsItem4;
  final double gsItem5;

  BarDataforGreenScape(
      {required this.gsItem1,
      required this.gsItem2,
      required this.gsItem3,
      required this.gsItem4,
      required this.gsItem5});

  List<IndividualBar> barDataforGreenScape = [];
  void initializedData() {
    barDataforGreenScape = [
      IndividualBar(x: 1, y: gsItem1),
      IndividualBar(x: 2, y: gsItem2),
      IndividualBar(x: 3, y: gsItem3),
      IndividualBar(x: 4, y: gsItem4),
      IndividualBar(x: 5, y: gsItem5)
    ];
  }
}
