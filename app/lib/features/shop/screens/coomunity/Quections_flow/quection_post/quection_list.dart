import 'package:app/features/shop/screens/coomunity/Quections_flow/quection_post/add_comment.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/constants/image_strings.dart';
import 'comment_widget.dart';
import 'quection_post.dart';

class QuectionList extends StatelessWidget {
  const QuectionList({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryheight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    TextEditingController commentController = TextEditingController();

    return SizedBox(
      height: mediaQueryheight, // Set the height as needed
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Column(
            children: [
              CommonPost(
                qAskerNAme: 'Kavindu Gimahn',
                qAskerImage: TImages.farmer1,
                onTap: () {},
                postedTime: '03/04/2023',
                qCategory: 'Foods',
                quection:
                    'Your long paragraph goes here. Add as much content as needed. Your long paragraph goes here. Add as much content as needed. Your long paragraph goes here',
                comments: SizedBox(
                  height: 300, // Set the height as needed
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: CommentWidget(
                            commenterName: 'Kavindu Kaveesha',
                            comenterImage: TImages.p3,
                            comment:
                                'Your long paragraph goes here. Add as much content as needed. Your long paragraph goes here. Add as much content as needed. Your long paragraph goes here. Add as much content as needed. '),
                      );
                    },
                  ),
                ),
                commentController: commentController,
                onTapSaveComment: () {},
              ),
            ],
          );
        },
      ),
    );
  }
}
