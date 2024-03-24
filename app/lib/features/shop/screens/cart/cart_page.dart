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
                // Listen to changes in the cart document corresponding to the current user's email
                stream: FirebaseFirestore.instance
                    .collection('carts')
                    .doc(currentUser.email)
                    .snapshots(),
                builder: (context, snapshot) {
                  // Check the current connection state
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // If connection state is waiting, show a loading indicator
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  // Check if any error occurred
                  if (snapshot.hasError) {
                    // If error occurred, display the error message
                    return Text('Error: ${snapshot.error}');
                  }
                  // Check if data is available and not null
                  if (!snapshot.hasData || snapshot.data == null) {
                    // If no data or data is null, show a message indicating no items in the cart
                    return const Text('No items in the cart');
                  }

                  // Extract cart data from the snapshot
                  final cartData = snapshot.data!;
                  // Check if the cart document exists
                  if (!cartData.exists) {
                    // If cart document doesn't exist, show a message indicating no items in the cart
                    return const Text('No items in the cart');
                  }

                  // Extract cart items from the cart data
                  final cartItems = (cartData['cartItems'] as List<dynamic>)
                      .cast<Map<String, dynamic>>();

                  // Check if cart items list is empty
                  if (cartItems.isEmpty) {
                    // If cart items list is empty, show a message indicating no items in the cart
                    return const Center(
                      child: Text('No items in the cart'),
                    );
                  }

                  // Build a column to display each cart item
                  return Column(
                    children: cartItems.map<Widget>((item) {
                      // Fetch the product details from the "OnlineStores" collection based on the product ID
                      return FutureBuilder<DocumentSnapshot>(
                        future: FirebaseFirestore.instance
                            .collection('Items')
                            .doc(item['productId'])
                            .get(),
                        builder: (context, productSnapshot) {
                          // Check the connection state of the future
                          if (productSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            // If connection state is waiting, show a loading indicator
                            return CircularProgressIndicator();
                          }
                          // Check if any error occurred while fetching product details
                          if (productSnapshot.hasError) {
                            // If error occurred, display the error message
                            return Text('Error: ${productSnapshot.error}');
                          }
                          // Check if product data is available and not null
                          if (!productSnapshot.hasData ||
                              productSnapshot.data == null) {
                            // If no product data or data is null, return an empty SizedBox
                            return SizedBox();
                          }

                          // Extract product data from the snapshot
                          final productData = productSnapshot.data!;
                          // Extract product details
                          final productName = productData['Name'];
                          final productImage = productData['ImageLink'];
                          final productPrice =
                              double.parse(productData['Price']);

                          // Build and return a CartItemWidget with the product details
                          return CartItemWidget(
                            productName: productName,
                            image: productImage,
                            price: productPrice,
                            quantity: item[
                                'quantity'], // Adjust according to your data structure
                            productId: item['productId'],
                            email: currentUser.email!,
                          );
                        },
                      );
                    }).toList(), // Convert the list of widgets to a list
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
