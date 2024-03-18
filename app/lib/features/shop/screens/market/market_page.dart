import 'package:app/features/shop/screens/market/products/all_products_grid/all_products_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/custom_shape/containers/gree_color_container.dart';
import '../../../../common/custom_shape/containers/search_container.dart';
import '../../../../common/custom_shape/widgets/appbar/app_bar.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/mediaQuery.dart';
import 'products/new_products/new_products_slider.dart';
import 'products/top_products/top_products_row.dart';
import '../test.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQueryheight = MediaQueryUtils.getHeight(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Custom App Bar
            CustomAppBar(
                iconBack: Icons.arrow_back_ios,
                onTapBack: () {
                  Get.back();
                },
                appbarTitle: 'Welcome to ECO Net Market',
                appbarSubtitle: 'Lets buy some fresh and organic foods',
                profileImage: TImages.farmer1,
                onTapProfile: () {}),

            GreenContainer(
                height: mediaQueryheight * .4,
                child: Column(
                  children: [
                    // Search container
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: SearchBarContainer(
                        resultPage: Test(),
                        text: 'Search......',
                      ),
                    ),
                    SizedBox(height: mediaQueryheight * 0.005),

                    // TopProducts row
                    const TopProducts()
                  ],
                )),

            //  This is Latest Product Slider
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  children: [
                    Text(
                      'Latest Products',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: mediaQueryheight * .01,
                    ),
                    const NewProductsSlider()
                  ],
                )),

            // This is All Products showing grid

            const AllProductsGrid()
          ],
        ),
      ),
    );
  }
}
