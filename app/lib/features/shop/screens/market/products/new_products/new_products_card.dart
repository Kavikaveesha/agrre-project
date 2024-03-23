import 'package:app/features/shop/screens/market/products/product_detail_page/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewProductCard extends StatelessWidget {
  const NewProductCard(
      {super.key,
      required this.productName,
      required this.category,
      required this.price,
      required this.index,
      required this.imageUrl});
  final String productName;
  final String category;
  final double price;
  final String index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: mediaqueryHeight * 0.01),
          Text(
            productName,
            style: Theme.of(context).textTheme.headlineSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    imageUrl,
                    width: mediaqueryWidth * 0.3,
                    height: mediaqueryHeight * 0.2,
                    fit: BoxFit.contain,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Category:',
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          category,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: mediaqueryHeight * 0.01),
                    Row(
                      children: [
                        Text(
                          'Price:',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          'Rs$price',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    SizedBox(height: mediaqueryHeight * 0.01),
                    SizedBox(
                      width: mediaqueryWidth * 0.4,
                      height: mediaqueryHeight * 0.07,
                      child: OutlinedButton(
                        onPressed: () {
                          Get.to(
                              () => ProductDetailPage(productIndex: '$index'));
                        },
                        child: Text(
                          'Buy Now',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
