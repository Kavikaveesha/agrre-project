import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constants/image_strings.dart';
import '../product_detail_page/product_detail_page.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key,
      required this.productName,
      required this.category,
      required this.index});
  final String productName;
  final String category;
  final int index;

  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final mediaQueryHeight = MediaQuery.of(context).size.height;

    final Brightness brightness = Theme.of(context).brightness;

    Color backgroundColor;
    if (brightness == Brightness.light) {
      backgroundColor = Colors.white; // Light mode background color
    } else {
      backgroundColor = Colors.black54; // Dark mode background color
    }

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: const Color.fromARGB(255, 86, 86, 86)),
          ),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    productName,
                    style: Theme.of(context).textTheme.headlineSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Image(
                  image: AssetImage(TImages.p1),
                  height: 100,
                  fit: BoxFit.fill,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Category:',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      category,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'RS 2400',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: mediaQueryWidth * 0.5,
          height: mediaQueryHeight * 0.07,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => ProductDetailPage(
                      productIndex: index,
                    ));
              },
              child: const Text('Buy Now'),
            ),
          ),
        ),
      ],
    );
  }
}
