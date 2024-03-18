import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/constants/colors.dart';

class AddComment extends StatelessWidget {
  const AddComment({super.key, required this.commentController, required this.onTapSaveComment});
  final TextEditingController commentController;
  final VoidCallback onTapSaveComment;

  @override
  Widget build(BuildContext context) {
    
    return // Buttons Section
        Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text('Add Comment',
                style: Theme.of(context).textTheme.bodyLarge),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: commentController,
                  decoration: const InputDecoration(
                    hintText: 'Add a comment...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
               InkWell(
                onTap: onTapSaveComment,
                child: const Icon(
                  Iconsax.arrow_right,
                  size: 70,
                  color: TColors.appPrimaryColor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
