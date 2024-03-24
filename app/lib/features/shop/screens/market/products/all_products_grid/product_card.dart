import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productName,
    required this.price,
    required this.imageUrl,
    required this.index,
    required this.onTap, required this.productDec,
  });
  final String productName;
  final String index;
  final double price;
  final String imageUrl;
  final VoidCallback onTap;
  final String productDec;

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
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    productName,
                    style: Theme.of(context).textTheme.headlineSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      imageUrl,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Category:',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              'category',
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Rs${price}',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 10),
                          child: SizedBox(
                            width: mediaQueryWidth * 0.4,
                            height: mediaQueryHeight * 0.07,
                            child: Container(
                              child: ElevatedButton(
                                onPressed: onTap,
                                child: const Text('Buy Now'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
