import 'package:app/features/shop/screens/market/market_page.dart';
import 'package:app/features/shop/screens/market/products/top_products/top_products_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constants/colors.dart';

class TopProducts extends StatelessWidget {
  const TopProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // top products title
              Text(
                'Top Products',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              // more Productsd
             
            ],
          ),
        ),
        TopProductHorisontalRowWidget()
      ],
    );
  }
}
// Top Products
     