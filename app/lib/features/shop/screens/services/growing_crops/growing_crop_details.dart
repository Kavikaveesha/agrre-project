import 'package:app/common/custom_shape/containers/circular_design_container.dart';
import 'package:app/common/custom_shape/widgets/slider/growing_crop_slider/growing_crop_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../utils/constants/mediaQuery.dart';

class GrowingCropDetailPage extends StatelessWidget {
  const GrowingCropDetailPage({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final mediaqueryHeight = MediaQueryUtils.getHeight(context);
    final Brightness brightness = Theme.of(context).brightness;

    Color backgroundColor;
    if (brightness == Brightness.light) {
      backgroundColor = Colors.white; // Light mode background color
    } else {
      backgroundColor = Colors.black54; // Dark mode background color
    }
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
                      'Growing Crops 01',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const GrowingCropsSlider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Description",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        SizedBox(
                          height: mediaqueryHeight * .01,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
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
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Text(
                                "Your long paragraph goes here. Add as much content as neededYour long paragraph goes here. Add as much content as neededYour long paragraph goes here. Add as much content as neededYour long paragraph goes here. Add as much content as neededYour long paragraph goes here. Add as much content as neededYour long paragraph goes here. Add as much content as neededYour long paragraph goes here. Add as much content as neededYour long paragraph goes here. Add as much content as neededYour long paragraph goes here. Add as much content as neededYour long paragraph goes here. Add as much content as neededYour long paragraph goes here. Add as much content as neededYour long paragraph goes here. Add as much content as neededYour long paragraph goes here. Add as much content as neededYour long paragraph goes here. Add as much content as neededYour long paragraph goes here. Add as much content as neededYour long paragraph goes here. Add as much content as needed.",
                                style: Theme.of(context).textTheme.bodyLarge,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: mediaqueryHeight * .1,
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
