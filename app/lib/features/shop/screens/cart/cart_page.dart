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
      return const Scaffold(
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
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  if (!snapshot.hasData || snapshot.data == null) {
                    return const Text('No items in the cart');
                  }

                  final cartData = snapshot.data!;
                  if (!cartData.exists) {
                    return const Text('No items in the cart');
                  }

                  final cartItems = (cartData['items'] as List<dynamic>)
                      .cast<Map<String, dynamic>>();

                  if (cartItems.isEmpty) {
                    return const Center(
                      child: Text('No items in the cart'),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItemData = cartItems[index];
                      // Fetch product details using product ID
                      final productId = cartItemData['productId'];
                      return FutureBuilder<DocumentSnapshot>(
                        future: FirebaseFirestore.instance
                            .collection('products')
                            .doc(productId)
                            .get(),
                        builder: (context, productSnapshot) {
                          if (productSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }
                          if (productSnapshot.hasError) {
                            return Text(
                                'Error: ${productSnapshot.error.toString()}');
                          }
                          if (!productSnapshot.hasData ||
                              productSnapshot.data == null) {
                            return const Text('Product not found');
                          }

                          final productData = productSnapshot.data!.data()
                              as Map<String, dynamic>;

                          final productName = productData['name'];
                          final productImageUrl = productData['image_url'];
                          final productPrice = productData['price'].toDouble();
                          final productQuantity = cartItemData['quantity'];

                          final cartItem = CartItem(
                            email: currentUser.email!,
                            productId: productId,
                            productName: productName,
                            image: productImageUrl,
                            price: productPrice,
                            quantity: productQuantity,
                          );

                          return CartItemWidget(cartItem: cartItem);
                        },
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

class CartItem {
  final String productName;
  final String image;
  final double price;
  final int quantity;
  final String productId;
  final String email;

  CartItem(
      {required this.productName,
      required this.image,
      required this.price,
      required this.quantity,
      required this.productId,
      required this.email});
}

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget({Key? key, required this.cartItem}) : super(key: key);

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
            leading: Image.network(cartItem.image),
            title: Text(cartItem.productName),
            subtitle:
                Text('Full Price: \$${cartItem.price * cartItem.quantity}'),
            trailing: Text('Quantity: ${cartItem.quantity}'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  deleteCartItem(cartItem.productId, cartItem.email,
                      cartItem.quantity, context);
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
        'items': FieldValue.arrayRemove([
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
