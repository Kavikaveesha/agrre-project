import 'package:app/common/custom_shape/widgets/appbar/app_bar.dart';
import 'package:app/navigation_menu.dart';
import 'package:app/utils/constants/colors.dart';
import 'package:app/utils/constants/mediaQuery.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../common/custom_shape/widgets/snack_bar/snack_bar.dart';

class MyCart extends StatelessWidget {
  const MyCart({Key? key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      // Handle case when user is not logged in
      return Scaffold(
        body: Center(
          child: Text('User not logged in'),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              backarrow: IconButton(
                onPressed: () {
                  Get.to(() => const NavigationMenu());
                },
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.white,
              ),
              appbarTitle: 'My Cart',
              appbarSubtitle: 'Get your products',
            ),
            SizedBox(
              height: MediaQueryUtils.getHeight(context) * .02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('carts')
                    .doc(currentUser.email)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return Text('No items in the cart');
                  }

                  final cartData = snapshot.data!;
                  if (!cartData.exists) {
                    return Text('No items in the cart');
                  }

                  final cartItems = (cartData['cartItems'] as List<dynamic>)
                      .cast<Map<String, dynamic>>();

                  if (cartItems.isEmpty) {
                    return Text('No items in the cart');
                  }

                  return FutureBuilder<QuerySnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('OnlineStores')
                        .get(),
                    builder: (context, storeSnapshot) {
                      if (storeSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (storeSnapshot.hasError) {
                        return Text('Error: ${storeSnapshot.error}');
                      }

                      final stores = storeSnapshot.data!.docs;
                      List<Widget> productList = [];

                      cartItems.forEach((item) {
                        stores.forEach((store) {
                          var itemsCollection = FirebaseFirestore.instance
                              .collection('OnlineStores')
                              .doc(store.id)
                              .collection('items');
                          productList.add(
                            FutureBuilder<DocumentSnapshot>(
                              future:
                                  itemsCollection.doc(item['productId']).get(),
                              builder: (context, productSnapshot) {
                                if (productSnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (productSnapshot.hasError) {
                                  return Text(
                                      'Error: ${productSnapshot.error}');
                                }
                                final productData = productSnapshot.data!;
                                print(
                                    'Product data: $productData'); // Print product data
                                if (!productData.exists) {
                                  return SizedBox(
                                    child: Text('no datas'),
                                  ); // Return an empty SizedBox
                                }

                                final productName = productData['Name'];
                                final productImage = productData['ImageLink'];
                                final productPrice =
                                    double.parse(productData['Price']);

                                return CartItemWidget(
                                  productName: productName,
                                  image: productImage,
                                  price: productPrice,
                                  quantity: item['quantity'],
                                  productId: item['productId'],
                                  email: currentUser.email!,
                                );
                              },
                            ),
                          );
                        });
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
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final String productName;
  final String image;
  final double price;
  final int quantity;
  final String productId;
  final String email;

  const CartItemWidget({
    Key? key,
    required this.productName,
    required this.image,
    required this.price,
    required this.quantity,
    required this.productId,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10), // Adding padding
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), // Adding black border
        borderRadius: BorderRadius.circular(10),
        // Adding border radius
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 206, 206, 206)
                .withOpacity(0.5), // Adding simple box shadow
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          ListTile(
            leading: Image.network(image),
            title: Text(productName),
            subtitle: Text('Full Price: \$${price * quantity}'),
            trailing: Text('Quantity: ${quantity}'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  deleteCartItem(productId, email, quantity, context);
                },
                child: const Text(
                  'Remove Item',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Order now',
                  style: TextStyle(color: TColors.appPrimaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> deleteCartItem(String productId, String userEmail, int quantity,
      BuildContext context) async {
    try {
      final userCartRef =
          FirebaseFirestore.instance.collection('carts').doc(userEmail);
      await userCartRef.update({
        'cartItems': FieldValue.arrayRemove([
          {
            'productId': productId,
            'quantity': quantity,
          }
        ])
      });
      SnackbarHelper.showSnackbar(
        title: 'Success',
        message: 'Successfuly delete product from cart',
        backgroundColor: TColors.appPrimaryColor,
      );
      // Reload the cart screen
      Get.offAll(const MyCart());
    } catch (e) {
      SnackbarHelper.showSnackbar(
        title: 'Error',
        message: e.toString(),
        backgroundColor: Colors.red,
      );
    }
  }
}
