import 'package:app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ProductDetailExpandedTextWidget extends StatefulWidget {
  final int textLength;
  final String text;
  const ProductDetailExpandedTextWidget(
      {super.key, required this.text, required this.textLength});

  @override
  State<ProductDetailExpandedTextWidget> createState() =>
      _ProductDetailExpandedTextWidgetState();
}

class _ProductDetailExpandedTextWidgetState
    extends State<ProductDetailExpandedTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool flag = true;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > widget.textLength) {
      firstHalf = widget.text.substring(0, widget.textLength);
      secondHalf =
          widget.text.substring(widget.textLength + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Text(widget.text)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  flag ? '$firstHalf...' : widget.text,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        flag ? 'Show More' : 'Show Less',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 108, 106, 106)),
                      ),
                      flag
                          ? const Icon(Icons.keyboard_arrow_down,
                              color: Color.fromARGB(255, 108, 106, 106))
                          : const Icon(Icons.keyboard_arrow_up,
                              color: Color.fromARGB(255, 108, 106, 106))
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
