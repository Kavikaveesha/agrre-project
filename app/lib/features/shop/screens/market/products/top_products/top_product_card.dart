import 'package:flutter/material.dart';

class TopProductCard extends StatelessWidget {
  const TopProductCard(
      {super.key,
      required this.productName,
      required this.productImage,
      required this.onTap});
  final String productName;
  final String productImage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 90.0,
              height: 80.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: AssetImage(productImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: onTap,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text(
                    productName,
                    style: Theme.of(context).textTheme.bodyMedium!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
