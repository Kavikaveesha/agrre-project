import 'package:app/features/shop/screens/market/products/new_products/new_products_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        final products = snapshot.data!.docs;

        if (products.isEmpty) {
          return Center(
            child: Text('No products available.'),
          );
        }

        return SizedBox(
          width: double.infinity,
          height: MediaQueryUtils.getHeight(context) * .31,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (_, index) {
              final product = products[index];
              return Container(
                width: mediaQueryWidth * 0.9,
                height: MediaQueryUtils.getHeight(context) * .31,
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
                  productName: product['name'],
                  category: product['category'],
                  price: product['price'],
                  imageUrl: product['image_url'],
                  index: product.id,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
