import 'package:app/common/custom_shape/containers/circular_design_container.dart';
import 'package:app/common/custom_shape/widgets/dropdowns/dropdown1.dart';
import 'package:app/features/shop/screens/services/aqua_guard/image_container.dart';
import 'package:app/features/shop/screens/services/aqua_guard/water_bar_chart.dart';
import 'package:app/features/shop/screens/services/aqua_guard/water_description.dart';
import 'package:app/utils/constants/image_strings.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AquaGuard extends StatefulWidget {
  const AquaGuard({
    super.key,
  });

  @override
  State<AquaGuard> createState() => _AquaGuardState();
}

class _AquaGuardState extends State<AquaGuard> {
  // these are the list from back end

  // this list for bar chart data .data came from back end with according location
  List<double> weeklyUsage = [34.5, 20, 46.5, 56.8, 43.8, 33.9, 6];

  // this is location list.get location list from backend
  List<String> locations = [
    'Select Location',
    'Colombo',
    'Nuwara Eliya',
    'Hambanthota',
  ];
  @override
  Widget build(BuildContext context) {
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    final mediaqueryHeight = MediaQuery.of(context).size.height;
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
                  'Aqua Guard',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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

                    // This is horisontal row to display 3 images
                    SizedBox(
                        width: mediaqueryWidth * .95,
                        height: mediaqueryHeight * .3,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (_, index) {
                              return const ImageContainer(
                                  waterImage: TImages.farmer1);
                            })),
                    SizedBox(
                      height: mediaqueryHeight * .03,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Uses of Water",
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
                            "Water Using Chart in ${locations[0]}",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            "Y equals to 10K water Liters",
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
                    WaterBarChart(weeklyUsage: weeklyUsage)
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
