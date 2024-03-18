import 'package:app/common/custom_shape/containers/circular_design_container.dart';
import 'package:app/common/custom_shape/widgets/dropdowns/dropdown1.dart';
import 'package:app/features/shop/screens/services/aqua_guard/water_description.dart';

import 'package:flutter/material.dart';

import '../../../../../utils/constants/mediaQuery.dart';
import 'green_scape_chart.dart';
// these are the list from back end

// this list for bar chart data .data came from back end with according location
List<Map<String, dynamic>> greenScapeList = [
  {'itemName': 'Item 1', 'value': 34.5},
  {'itemName': 'Item 2', 'value': 20.0},
  {'itemName': 'Item 3', 'value': 46.5},
  {'itemName': 'Item 4', 'value': 56.8},
  {'itemName': 'Item 5', 'value': 43.8},
];

// this is location list.get location list from backend
List<String> locations = [
  'Select Location',
  'Colombo',
  'Nuwara Eliya',
  'Hambanthota',
];

class GreenScape extends StatefulWidget {
  const GreenScape({
    super.key,
  });

  @override
  State<GreenScape> createState() => _GreenScapeState();
}

class _GreenScapeState extends State<GreenScape> {
  @override
  Widget build(BuildContext context) {
       final mediaqueryHeight = MediaQueryUtils.getHeight(context);
       

    return Scaffold(
        body: SingleChildScrollView(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            CircularDesignContainer(
                backText: 'Back',
                child: Column(
              children: [
                SizedBox(
                  height: mediaqueryHeight * .2,
                ),
                Text(
                  'Green Scape',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: mediaqueryHeight * .02,
                    ),
                    // this is dropdown button.This is a common widget
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Dropdown1(
                          listName: locations,
                          selectedItem: 'Select Location',
                          onItemSelected: (value) {
                            print('Selected: $value');
                          },
                        )),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Bio Divercity",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    SizedBox(
                      height: mediaqueryHeight * .03,
                    ),

                    // water description
                    const WaterDiscription(
                        waterDescription:
                            "Your long paragraph goes here. Add as much content as neededYour long paragraph goes here. Add as much content as neededYour long paragraph goes here. Add as much content as neededYour long paragraph goes here. Add as much content as neededYour long paragraph goes here. Add as much content as neededYour long paragraph goes here. Add as much content as neededYour long paragraph goes here. Add as much content as neededYour long paragraph goes here. Add as much content as ."),

                    SizedBox(
                      height: mediaqueryHeight * .03,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Green Scope Chart of  ${locations[0]}",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            "Y equals to 10K ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: mediaqueryHeight * .01,
                    ),
                    GreenScapeChartWidget(
                      greenScapeList: greenScapeList,
                    ),
                  ],
                )
              ],
            )),
          ],
        ),
      ),
    ));
  }
}
