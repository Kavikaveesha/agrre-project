import 'package:app/features/shop/screens/cart/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.appbarTitle,
    required this.appbarSubtitle,
    this.bottonChild,
    this.onTapBack,
    this.backarrow,
    this.isShowcart,
  });
  final String appbarTitle;
  final String appbarSubtitle;
  final PreferredSizeWidget? bottonChild;
  final VoidCallback? onTapBack;
  final IconButton? backarrow;
  final bool? isShowcart;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: backarrow,
      automaticallyImplyLeading: false,
      toolbarHeight: 80,
      backgroundColor: TColors.appPrimaryColor,
      title: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome text
            Text(
              appbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: const Color.fromARGB(255, 248, 239, 239)),
            ),
            // Welcome text subtitle
            Text(
              appbarSubtitle,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: const Color.fromARGB(255, 218, 214, 214)),
            ),
          ],
        ),
      ),
      actions: [
        // visit to my cart
        if (isShowcart == true)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  // Navigate to the cart page when the profile button is clicked
                  Get.to(() => const MyCart());
                },
                // this is my cart  container with cart icon
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape
                          .circle, // Use BoxShape.rectangle for rounded rectangle
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0, // Adjust the border width as needed
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ]),
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                )),
          ),
      ],
      bottom: bottonChild,
    );
  }
}
