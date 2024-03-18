import 'package:app/features/shop/screens/coomunity/education/expanded_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/mediaQuery.dart';

class ArticalCard extends StatefulWidget {
  const ArticalCard(
      {Key? key,
      required this.articleTitle,
      required this.articleCategory,
      required this.articleImage,
      required this.articleText,
      required this.url})
      : super(key: key);
  final String articleTitle;
  final String articleCategory;
  final String articleImage;
  final String articleText;
  final String url;

  @override
  _ArticalCardState createState() => _ArticalCardState();
}

class _ArticalCardState extends State<ArticalCard> {
  bool showComments = false;
  bool showFullDescription = false;

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
            // Post Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.articleTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(
                    height: mediaQueryheight * .005,
                  ),
                  Row(
                    children: [
                      Text('Category:',
                          style: Theme.of(context).textTheme.bodySmall),
                      const SizedBox(width: 4),
                      Text(widget.articleCategory,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  SizedBox(height: mediaQueryheight * 0.005),
                  Image(
                    image: AssetImage(widget.articleImage),
                    width: mediaQueryheight,
                    height: mediaQueryheight * .25,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 8),
                  ExpandedTextWidget(
                    text: widget.articleText,
                    textLength: 100,
                    url: widget.url,
                  ),
                  SizedBox(
                    height: mediaQueryheight * .01,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
