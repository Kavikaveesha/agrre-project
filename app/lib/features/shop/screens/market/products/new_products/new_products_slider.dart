import 'package:app/features/shop/screens/market/products/new_products/new_products_card.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/constants/mediaQuery.dart';

class NewProductsSlider extends StatelessWidget {
  const NewProductsSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQueryUtils.getWidth(context);
    final Brightness brightness = Theme.of(context).brightness;

    Color backgroundColor;
    if (brightness == Brightness.light) {
      backgroundColor = Colors.white; // Light mode background color
    } else {
      backgroundColor = Colors.black54; // Dark mode background color
    }

    return SizedBox(
      width: double.infinity,
      height: 210,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (_, index) {
          return Container(
              width: mediaQueryWidth * 0.9,
              height: 210,
              margin: const EdgeInsets.only(right: 16.0, bottom: 16),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: NewProductCard(
                productName: 'productName',
                category: 'category',
                price: 1200,
                index: index,
              ));
        },
      ),
    );
  }
}
