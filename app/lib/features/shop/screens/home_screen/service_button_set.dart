import 'package:app/features/shop/screens/services/aqua_guard/aqua_guard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/custom_shape/widgets/cards/main_card/service_card.dart';
import '../../../../utils/constants/image_strings.dart';
import '../services/green_scope/green_scope_page.dart';
import '../services/growing_crops/display_all_growing_crops.dart';

// this is service card title and image list
List<Map<String, String>> serviceCards = [
  {'title': 'Growing Crops', 'imageName': TImages.btnImg1},
  {'title': 'Green Scape', 'imageName': TImages.btnImg1},
  {'title': 'Aqua Guard', 'imageName': TImages.btnImg1},
  {'title': 'Eco Quead', 'imageName': TImages.btnImg1},
  {'title': 'Co2', 'imageName': TImages.btnImg1},
];
// this is service card  navigate pages list
List<Widget> pageWidgets = [
  const DisplayAllGrowingCrops(),
  const GreenScape(),
  const AquaGuard(),
  const AquaGuard(),
];

class ServiceButtonsSet extends StatelessWidget {
  const ServiceButtonsSet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ListView.builder(
        itemCount: serviceCards.length ~/ 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ServiceCard(
                    x: .4,
                    height: 120,
                    imageName: '${serviceCards[index]['imageName']}',
                    title: '${serviceCards[index]['title']}',
                    onTap: () {
                      Get.to(() => pageWidgets[index]);
                    },
                  ),
                  ServiceCard(
                    x: .4,
                    height: 120,
                    imageName:
                        '${serviceCards[index + serviceCards.length ~/ 2]['imageName']}',
                    title:
                        '${serviceCards[index + serviceCards.length ~/ 2]['title']}',
                    onTap: () {
                      Get.to(
                          () => pageWidgets[index + pageWidgets.length ~/ 2]);
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
