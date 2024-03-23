import 'package:app/admin/ad_artical.dart';
import 'package:app/admin/ad_products.dart';
import 'package:app/utils/constants/mediaQuery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
            ),
            SizedBox(
              width: MediaQueryUtils.getWidth(context) * .8,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => AddProductPage());
                  },
                  child: const Text('Add Product')),
            ),
            SizedBox(
              height: MediaQueryUtils.getHeight(context) * .1,
            ),
            SizedBox(
              width: MediaQueryUtils.getWidth(context) * .8,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => AdArticalePage());
                  },
                  child: const Text('Add Artical')),
            )
          ],
        ),
      ),
    );
  }
}
