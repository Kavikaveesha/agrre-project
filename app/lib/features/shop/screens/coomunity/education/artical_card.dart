import 'package:app/features/shop/screens/coomunity/education/expanded_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../utils/constants/mediaQuery.dart';

// ArticalCard Widget
class ArticleCard extends StatelessWidget {
  const ArticleCard({
    Key? key,
    required this.articleTitle,
    required this.articleText,
    required this.tags,
    required this.date,
  }) : super(key: key);

  final String articleTitle;
  final String articleText;
  final String tags;
  final Timestamp date;

  @override
  Widget build(BuildContext context) {
    final mediaQueryheight = MediaQueryUtils.getHeight(context);
    final Brightness brightness = Theme.of(context).brightness;

    Color backgroundColor;
    if (brightness == Brightness.light) {
      backgroundColor = Colors.white; // Light mode background color
    } else {
      backgroundColor = Colors.black54; // Dark mode background color
    }
    DateTime dateTime = date.toDate();

    return Padding(
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    articleTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: mediaQueryheight * .005),
                  Text(
                    DateFormat.yMMMd()
                        .format(dateTime), // Use converted DateTime
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: mediaQueryheight * .005),
                  Text(tags,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.green[200])),
                  SizedBox(height: mediaQueryheight * 0.005),
                  ExpandedTextWidget(
                    text: articleText,
                    textLength: 100,
                  ),
                  SizedBox(height: mediaQueryheight * .01),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
