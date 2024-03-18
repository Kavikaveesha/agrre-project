import 'package:app/common/custom_shape/containers/circular_design_container.dart';
import 'package:app/common/custom_shape/containers/gree_color_container.dart';
import 'package:app/common/custom_shape/widgets/appbar/app_bar.dart';
import 'package:app/common/custom_shape/widgets/cards/groving_crops/groving_crops_display_card.dart';
import 'package:app/utils/constants/mediaQuery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import 'package:app/common/custom_shape/containers/search_container.dart';
import 'package:app/features/shop/screens/test.dart';
import 'package:app/utils/constants/image_strings.dart';

import 'growing_crop_details.dart';

List<Map<String, String>> growingCrops = [
  {'title': 'Growing Crop 1', 'imageName': TImages.p1},
  {'title': 'Growing Crop 2', 'imageName': TImages.p2},
  {'title': 'Growing Crop 3', 'imageName': TImages.p3},
  {'title': 'Growing Crop 4', 'imageName': TImages.p1},
  {'title': 'Growing Crop 5', 'imageName': TImages.p1},
  {'title': 'Growing Crop 6', 'imageName': TImages.p1},
  {'title': 'Growing Crop 7', 'imageName': TImages.p2},
  {'title': 'Growing Crop 7', 'imageName': TImages.p2},
];

class DisplayAllGrowingCrops extends StatelessWidget {
  const DisplayAllGrowingCrops({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaqueryWidth = MediaQueryUtils.getWidth(context);
    final mediaqueryHeight = MediaQueryUtils.getHeight(context);

    return Scaffold(
      body: SingleChildScrollView(
          child: CircularDesignContainer(
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
                  SizedBox(
                    height: mediaqueryHeight * .01,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: SearchBarContainer(
                      resultPage: Test(),
                      text: 'Search Growing Crops....',
                    ),
                  ),
                  SizedBox(
                    height: mediaqueryHeight * .01,
                  ),
                  // Add GridView here
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Text('All Growing Crops'),
                                Text('(10)'),
                              ],
                            ),
                            Row(
                              children: [
                                const Text('Filter Growing Crops'),
                                SizedBox(
                                  width: mediaqueryWidth * .01,
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.filter_list),
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: mediaqueryHeight * 0.02,
                        ),
                        SizedBox(
                          width: mediaqueryWidth,
                          height: mediaqueryHeight * 0.6, // Adjust the height
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 0,
                              mainAxisExtent: 190,
                            ),
                            itemCount: 8,
                            itemBuilder: (BuildContext context, int index) {
                              return GrovingCropsDisplayCard(
                                title: '${growingCrops[index]['title']}',
                                image: '${growingCrops[index]['imageName']}',
                                onTap: () {
                                  Get.to(() => GrowingCropDetailPage(
                                        index: index,
                                      ));
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
