import 'package:flutter/material.dart';

class ProductsRow extends StatelessWidget {
  const ProductsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (_, index) {
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image in the card
                  Container(
                    width: double.infinity, // Takes full width of the card
                    height: 150.0, // Adjust the height as needed
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(''), // Replace with your image asset
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Text in the card
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Card $index',
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
