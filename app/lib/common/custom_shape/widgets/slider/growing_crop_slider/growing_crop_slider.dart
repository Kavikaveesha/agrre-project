import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';

class GrowingCropsSlider extends StatelessWidget {
  const GrowingCropsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      height: mediaqueryHeight * .3,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (_, index) {
          return Container(
            width: mediaqueryWidth * .9,
            height: mediaqueryHeight * .24,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Image(
              image: AssetImage(TImages.farmer1),
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}
