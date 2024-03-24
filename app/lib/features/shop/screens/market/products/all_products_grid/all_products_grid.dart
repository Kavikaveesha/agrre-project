import 'package:app/features/shop/screens/market/products/all_products_grid/product_card.dart';
import 'package:app/utils/constants/mediaQuery.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../product_detail_page/product_detail_page.dart';

// class AllProductsGrid extends StatelessWidget {
//   const AllProductsGrid({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Text('All Products'),
//                   Text('(130)'),
//                 ],
//               ),
//               Text('Filter Products'),
//               SizedBox(
//                 width: 10,
//               ),
//               Container(
//                 height: 40,
//                 width: 40,
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 child: IconButton(
//                   onPressed: () {},
//                   icon: const Icon(Icons.filter_list),
//                   color: Colors.white,
//                 ),
//               )
//             ],
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Expanded(
//             child: FutureBuilder<QuerySnapshot>(
//               future:
//                   FirebaseFirestore.instance.collection('OnlineStores').get(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(
//                     child: Text('Error fetching data: ${snapshot.error}'),
//                   );
//                 } else {
//                   final onlineStores = snapshot.data!.docs;
//                   print(
//                       'Number of online stores: ${onlineStores.length}'); // Print the number of online stores
//                   return GridView.builder(
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 8.0,
//                       mainAxisSpacing: 8.0,
//                     ),
//                     itemCount: onlineStores.length,
//                     itemBuilder: (context, index) {
//                       final store = onlineStores[index];
//                       return FutureBuilder<QuerySnapshot>(
//                         future: FirebaseFirestore.instance
//                             .collection('OnlineStores')
//                             .doc(store.id)
//                             .collection('Items')
//                             .get(),
//                         builder: (context, itemSnapshot) {
//                           if (itemSnapshot.connectionState ==
//                               ConnectionState.waiting) {
//                             return const Center(
//                               child: CircularProgressIndicator(),
//                             );
//                           } else if (itemSnapshot.hasError) {
//                             return Center(
//                               child: Text(
//                                 'Error fetching items: ${itemSnapshot.error}',
//                               ),
//                             );
//                           } else {
//                             final items = itemSnapshot.data!.docs;
//                             print(
//                                 'Number of items for store ${store.id}: ${items.length}'); // Print the number of items for each store
//                             return ListView.builder(
//                               itemCount: items.length,
//                               itemBuilder: (context, index) {
//                                 final item = items[index];
//                                 print(
//                                     'Item name: ${item['Name']}, Price: ${item['Price']}, Image: ${item['ImageLink']}'); // Print details of each item
//                                 return ProductCard(
//                                   productName: item['Name'],
//                                   price: item['Price'],
//                                   imageUrl: item['ImageLink'],
//                                   index: item.id,
//                                 );
//                               },
//                             );
//                           }
//                         },
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class AllProductsGrid extends StatelessWidget {
  const AllProductsGrid({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('All Products'),
                Row(
                  children: [
                    Text('Filter Products'),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.filter_list),
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance.collection('OnlineStores').get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final onlineStores = snapshot.data!.docs;
                List<Widget> productList = [];
                onlineStores.forEach((store) {
                  productList.add(
                    FutureBuilder<QuerySnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('OnlineStores')
                          .doc(store.id)
                          .collection('Items')
                          .get(),
                      builder: (context, itemSnapshot) {
                        if (itemSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (itemSnapshot.hasError) {
                          return Center(
                              child: Text('Error: ${itemSnapshot.error}'));
                        } else {
                          final items = itemSnapshot.data!.docs;
                          List<Widget> products = [];
                          if (items.isEmpty) {
                            return const SizedBox(); // Return an empty SizedBox
                          }
                          items.forEach((item) {
                            products.add(
                              ProductCard(
                                productName: item['Name'],
                                price: double.parse(item['Price']),
                                imageUrl: item['ImageLink'],
                                index: item.id,
                                productDec: item['ItemsAbout'],
                                onTap: () {
                                  Get.to(() => ProductDetailPage(
                                        productIndex: item.id,
                                        imageUrl: item['ImageLink'],
                                        price: double.parse(item['Price']),
                                        productdec: item['ItemsAbout'],
                                        prductName: item['Name'],
                                      ));
                                },
                              ),
                            );
                          });
                          return Column(children: products);
                        }
                      },
                    ),
                  );
                });
                // Remove null or empty widgets
                productList.removeWhere((widget) => widget is SizedBox);
                return SizedBox(
                  width: MediaQueryUtils.getWidth(context),
                  height: MediaQueryUtils.getHeight(context),
                  child: ListView(
                    children: productList,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
