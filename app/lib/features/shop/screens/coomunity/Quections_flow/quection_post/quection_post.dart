import 'package:flutter/material.dart';

import 'add_comment.dart';

class CommonPost extends StatefulWidget {
  const CommonPost(
      {Key? key,
      required this.qAskerNAme,
      required this.qAskerImage,
      required this.onTap,
      required this.postedTime,
      required this.qCategory,
      required this.quection,
      required this.comments,
      required this.commentController,
      required this.onTapSaveComment})
      : super(key: key);
  final String qAskerNAme;
  final String qAskerImage;
  final VoidCallback onTap;
  final String postedTime;
  final String qCategory;
  final String quection;
  final Widget comments;
  final TextEditingController commentController;
  final VoidCallback onTapSaveComment;

  @override
  _CommonPostState createState() => _CommonPostState();
}

class _CommonPostState extends State<CommonPost> {
  bool showComments = false;

  @override
  Widget build(BuildContext context) {
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    final Brightness brightness = Theme.of(context).brightness;

    Color backgroundColor;
    if (brightness == Brightness.light) {
      backgroundColor = Colors.white; // Light mode background color
    } else {
      backgroundColor = Colors.black54; // Dark mode background color
    }

    return InkWell(
      onTap: () {
        setState(() {
          showComments = !showComments;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Post Section
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                widget.onTap;
                              },
                              child: CircleAvatar(
                                radius: 24,
                                backgroundImage: AssetImage(widget.qAskerImage),
                              ),
                            ),
                            const SizedBox(width: 8),
                            InkWell(
                              onTap: () {
                                widget.onTap;
                              },
                              child: Text(
                                widget.qAskerNAme,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: mediaqueryHeight * .01,
                    ),
                    Text(widget.postedTime,
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text('Category:',
                            style: Theme.of(context).textTheme.bodySmall),
                        const SizedBox(width: 4),
                        Text(widget.qCategory,
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      // "Your long paragraph goes here. Add as much content as needed. Your long paragraph goes here. Add as much content as needed. Your long paragraph goes here. Add as much content as needed. Your long paragraph goes here. Add as much content as needed. Your long paragraph goes here. Add as much content as needed. Your long paragraph goes here. Add as much content as needed.",
                      widget.quection,
                      style: Theme.of(context).textTheme.bodyText2,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: mediaqueryHeight * .01,
                    ),
                  ],
                ),
              ),

              // Comments Section
              if (showComments)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Comments',
                              style: Theme.of(context).textTheme.headlineSmall),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                SizedBox(
                                  height: mediaqueryHeight * .01,
                                ),
                                Container(
                                  child: widget.comments,
                                )
                              ],
                            ),
                          ),
                          AddComment(
                            commentController: widget.commentController,
                            onTapSaveComment: widget.onTapSaveComment,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
