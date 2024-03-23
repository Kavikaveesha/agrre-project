import 'package:app/features/shop/screens/services/green_scope/green_scope_page.dart';
import 'package:flutter/material.dart';
import '../common/custom_shape/widgets/charts/pi_charts.dart';
import 'package:app/utils/constants/mediaQuery.dart';
import 'package:fl_chart/fl_chart.dart';
import '../common/custom_shape/containers/circular_design_container.dart';
import '../common/custom_shape/widgets/dropdowns/dropdown1.dart';
import '../utils/constants/colors.dart';

class Co2Page extends StatefulWidget {
  const Co2Page({Key? key}) : super(key: key);

  @override
  State<Co2Page> createState() => _Co2PageState();
}

class _Co2PageState extends State<Co2Page> {
  late String selectedLocation; // To track the selected location
  List<Map<String, dynamic>> locationData = [
    {'location': 'Colombo', 'value': '30'},
    {'location': 'Gampaha', 'value': '35'},
    {'location': 'Kalutara', 'value': '32'},
    {'location': 'Kandy', 'value': '38'},
    {'location': 'Matale', 'value': '37'},
    {'location': 'Nuwara Eliya', 'value': '40'},
    {'location': 'Galle', 'value': '36'},
    {'location': 'Matara', 'value': '33'},
    {'location': 'Hambantota', 'value': '40'},
    {'location': 'Jaffna', 'value': '31'},
    {'location': 'Mannar', 'value': '34'},
    {'location': 'Vavuniya', 'value': '39'},
    {'location': 'Mullaitivu', 'value': '35'},
    {'location': 'Kilinochchi', 'value': '36'},
    {'location': 'Batticaloa', 'value': '37'},
    {'location': 'Ampara', 'value': '38'},
    {'location': 'Trincomalee', 'value': '39'},
    {'location': 'Kurunegala', 'value': '34'},
    {'location': 'Puttalam', 'value': '32'},
    {'location': 'Anuradhapura', 'value': '31'},
    {'location': 'Polonnaruwa', 'value': '38'},
    {'location': 'Badulla', 'value': '33'},
    {'location': 'Monaragala', 'value': '37'},
    {'location': 'Ratnapura', 'value': '35'},
  ];

  List<String> locations = [
    'Colombo',
    'Gampaha',
    'Kalutara',
    'Kandy',
    'Matale',
    'Nuwara Eliya',
    'Galle',
    'Matara',
    'Hambantota',
    'Jaffna',
    'Mannar',
    'Vavuniya',
    'Mullaitivu',
    'Kilinochchi',
    'Batticaloa',
    'Ampara',
    'Trincomalee',
    'Kurunegala',
    'Puttalam',
    'Anuradhapura',
    'Polonnaruwa',
    'Badulla',
    'Monaragala',
    'Ratnapura',
  ];

  @override
  void initState() {
    super.initState();
    selectedLocation = 'Colombo'; // Default selected location
  }

  @override
  Widget build(BuildContext context) {
    final mediaqueryWidth = MediaQueryUtils.getWidth(context);
    final mediaqueryHeight = MediaQueryUtils.getHeight(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            CircularDesignContainer(
              backText: 'Back',
              child: Column(
                children: [
                  SizedBox(height: mediaqueryHeight * .2),
                  Text(
                    'Measure CO2 Percentage',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: mediaqueryHeight * .02),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Dropdown1(
                      listName: locations,
                      selectedItem: selectedLocation,
                      onItemSelected: (value) {
                        setState(() {
                          selectedLocation = value; // Update selected location
                        });
                      },
                    ),
                  ),
                  Stack(
                    children: [
                      Positioned(
                        top: mediaqueryHeight * .2,
                        left: mediaqueryWidth * .35,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'CO2',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            Text(
                              '${locationData.firstWhere((data) => data['location'] == selectedLocation)['value']}%',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 400,
                        child: Padding(
                          padding: const EdgeInsets.all(40),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 21, 21, 21)
                                      .withOpacity(0.4),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // Changes the shadow position
                                ),
                              ],
                            ),
                            child: PieChart(
                              swapAnimationDuration:
                                  const Duration(milliseconds: 500),
                              swapAnimationCurve: Curves.bounceIn,
                              PieChartData(sections: [
                                PieChartSectionData(
                                    title: '',
                                    color: Colors.white,
                                    value: 100.0 -
                                        double.parse(locationData.firstWhere(
                                            (data) =>
                                                data['location'] ==
                                                selectedLocation)['value'])),
                                PieChartSectionData(
                                    title: '',
                                    color: TColors.appPrimaryColor,
                                    value: double.parse(locationData.firstWhere(
                                        (data) =>
                                            data['location'] ==
                                            selectedLocation)['value'])),
                              ]),
                              // Add your animation here
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
