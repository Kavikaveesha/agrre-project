import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../test.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget(
      {super.key,
      required this.commenterName,
      required this.comenterImage,
      required this.comment});
  final String commenterName;
  final String comenterImage;
  final String comment;

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;

    Color backgroundColor;
    if (brightness == Brightness.light) {
      backgroundColor = Colors.grey.shade200; // Light mode background color
    } else {
      backgroundColor = Colors.black54; // Dark mode background color
    }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, // Adjust the border color
          width: 1.0, // Adjust the border width
        ),
        borderRadius: BorderRadius.circular(8.0), // Adjust the border radius
        color: backgroundColor, // Adjust the background color
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => const Test());
                  },
                  child: CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(comenterImage),
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    Get.to(() => const Test());
                  },
                  child: Text(
                    commenterName,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              comment,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
