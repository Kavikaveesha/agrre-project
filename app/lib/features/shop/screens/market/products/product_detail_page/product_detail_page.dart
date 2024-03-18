import 'package:app/features/shop/screens/market/products/product_detail_page/product_deatail_expanded_text.dart';
import 'package:app/utils/constants/colors.dart';
import 'package:app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constants/mediaQuery.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.productIndex});
  final int productIndex;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    final mediaQueryheight = MediaQueryUtils.getHeight(context);
    final mediaQueryWidth = MediaQueryUtils.getWidth(context);
    final Brightness brightness = Theme.of(context).brightness;

    Color backgroundColor;
    if (brightness == Brightness.light) {
      backgroundColor = Colors.white; // Light mode background color
    } else {
      backgroundColor = Colors.black54; // Dark mode background color
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: mediaQueryheight * 0.45,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: mediaQueryWidth,
                        height: mediaQueryheight * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Slide To Next',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: TColors.appPrimaryColor),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: TColors.appPrimaryColor,
                                ),
                              ],
                            ),
                            Image(
                              image: const AssetImage(TImages.p3),
                              width: mediaQueryWidth * .5,
                              fit: BoxFit.contain,
                            ),
                            Text(
                              '${index = index + 1}',
                              style: Theme.of(context).textTheme.headlineSmall,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Name  ${widget.productIndex}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(
                    height: mediaQueryheight * .02,
                  ),
                  Row(
                    children: [
                      Text(
                        'Category:',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        'Fooods',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                width: mediaQueryWidth * .08,
                                height: mediaQueryWidth * .08,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
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
                                alignment: Alignment.center,
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (itemCount > 1) {
                                          itemCount--;
                                        }
                                      });
                                    },
                                    child: const Text(
                                      '-',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ))),
                            SizedBox(
                              width: mediaQueryWidth * .02,
                            ),
                            Container(
                                width: mediaQueryWidth * .08,
                                height: mediaQueryWidth * .08,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
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
                                alignment: Alignment.center,
                                child: InkWell(
                                    onTap: () {},
                                    child: Text(
                                      itemCount.toString(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ))),
                            SizedBox(
                              width: mediaQueryWidth * .02,
                            ),
                            Container(
                                width: mediaQueryWidth * .08,
                                height: mediaQueryWidth * .08,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
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
                                alignment: Alignment.topCenter,
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        itemCount++;
                                      });
                                    },
                                    child: const Text(
                                      '+',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ))),
                          ],
                        ),
                        Text(
                          'Rs ${itemCount * 1200}',
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Description',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Colors.black54),
                      ),
                      const ProductDetailExpandedTextWidget(
                        text:
                            'ExpandedTextWidget(text: "By adding the alignment: Alignment.center property to the Container, you ensure that its child (IconButton) is centered both horizontally and vertically within the container.ExpandedTextWidget(text: "By adding the alignment: Alignment.center property to the Container, you ensure that its child (IconButton) is centered both horizontally and vertically within the container.',
                        textLength: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                child: const Text(
                                  'Buy Now',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
