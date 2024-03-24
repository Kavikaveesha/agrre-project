import 'package:app/features/shop/screens/cart/cart_page.dart';
import 'package:app/features/shop/screens/market/products/product_detail_page/product_deatail_expanded_text.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/custom_shape/widgets/snack_bar/snack_bar.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/mediaQuery.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({
    super.key,
    required this.productIndex,
    required this.prductName,
    required this.productdec,
    required this.price,
    required this.imageUrl,
  });
  final String productIndex;
  final String prductName;
  final String productdec;
  final double price;
  final String imageUrl;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int itemCount = 1;

  Future<void> addToCart() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        // User not signed in, handle accordingly
        return;
      }

      final cartRef =
          FirebaseFirestore.instance.collection('carts').doc(user.email);
      final cartData = await cartRef.get();
      if (cartData.exists) {
        await cartRef.update({
          'cartItems': FieldValue.arrayUnion([
            {
              'productId': widget.productIndex,
              'quantity': itemCount,
            }
          ])
        });
      } else {
        // If cart doesn't exist, create a new one with the item
        await cartRef.set({
          'cartItems': [
            {
              'productId': widget.productIndex,
              'quantity': itemCount,
            }
          ]
        });
      }
      SnackbarHelper.showSnackbar(
        title: 'Success',
        message: 'Successfuly addded product to cart',
        backgroundColor: TColors.appPrimaryColor,
      );
      Get.to(() => MyCart());
      // Show success message or navigate to cart page
    } catch (e) {
      SnackbarHelper.showSnackbar(
        title: 'Error',
        message: e.toString(),
        backgroundColor: Colors.red,
      );
      // Show error message
    }
  }

  Future<DocumentSnapshot> getProductData(String productIndex) async {
    return await FirebaseFirestore.instance
        .collection('OnlineStores')
        .doc(productIndex)
        .get();
  }

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
        // backgroundColor: Colors.white,
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
              Container(
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
                child: Image(
                  image: NetworkImage(widget.imageUrl),
                  width: mediaQueryWidth * .5,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: mediaQueryheight * .1,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.prductName,
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
                          'productCategory',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
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
                            'Rs ${itemCount * widget.price}',
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
                        ProductDetailExpandedTextWidget(
                          text: widget.productdec,
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
                                  onPressed: addToCart,
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
        ));
  }
}
