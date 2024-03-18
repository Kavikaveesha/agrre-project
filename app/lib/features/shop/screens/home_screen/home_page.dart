import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/custom_shape/containers/gree_color_container.dart';
import '../../../../common/custom_shape/containers/search_container.dart';
import '../../../../common/custom_shape/widgets/appbar/app_bar.dart';
import '../../../../common/custom_shape/widgets/cards/main_card/rectangle_card_001.dart';
import '../../../../utils/constants/image_strings.dart';
import '../market/market_page.dart';
import '../test.dart';
import 'service_button_set.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen height
    final mediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // this is appbar
            CustomAppBar(
              appbarTitle: 'Welcome Kavindu',
              appbarSubtitle: 'Let\'s build an agricultural country',
              profileImage: TImages.farmer1,
              onTapProfile: () {},
            ),

            // Green color container start
            GreenContainer(
                height: mediaQueryHeight * .15,
                child: const Column(
                  children: [
                    // Search container
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: SearchBarContainer(
                        resultPage: Test(),
                        text: 'Search......',
                      ),
                    ),
                  ],
                )),
            SizedBox(height: mediaQueryHeight * 0.02),
            // Main Category buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: RectangleCard(
                x: 1,
                height: 100,
                title: 'Visit To Market Place',
                subtitle:
                    'You can Buy best Aggriculture\nproducts to your growing',
                onTap: () {
                  Get.to(() => const MarketPage());
                },
                iconName: Icons.shop_two_outlined,
              ),
            ),

            // This is Service button set
            const ServiceButtonsSet()
          ],
        ),
      ),
    );
  }
}
