import 'package:app/features/shop/screens/market/market_page.dart';
import 'package:app/features/shop/screens/market/products/product_detail_page/product_detail_page.dart';
import 'package:app/features/shop/screens/market/products/top_products/top_products_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';

class TopProducts extends StatelessWidget {
  const TopProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // top products title
              const Text(
                'Top Products',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              // more Productsd
              InkWell(
                onTap: () {
                  Get.to(() => const MarketPage());
                },
                child: const Text(
                  'More Products',
                  style: TextStyle(
                    fontSize: 15,
                    color: TColors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
        const TopProductHorisontalRowWidget()
      ],
    );
  }
}
// Top Products
     