import 'package:app/features/shop/screens/market/products/all_products_grid/product_card.dart';
import 'package:flutter/material.dart';


class AllProductsGrid extends StatelessWidget {
  const AllProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Text('All Products'),
                  Text('(130)'),
                ],
              ),
              Row(
                children: [
                  const Text('Filter Products'),
                  SizedBox(
                    width: mediaQueryWidth * .01,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_list),
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: mediaQueryHeight * 0.02,
          ),
          SizedBox(
            width: mediaQueryWidth,
            height: mediaQueryHeight * 0.7, // Adjust the height
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 0,
                mainAxisExtent: 300,
              ),
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ProductCard(
                    productName: ' Product Name of $index',
                    category: 'category',
                    index: index);
              },
            ),
          )
        ],
      ),
    );
  }
}
