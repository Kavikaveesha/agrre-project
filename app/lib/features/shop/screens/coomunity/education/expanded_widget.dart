import 'package:app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExpandedTextWidget extends StatefulWidget {
  final int textLength;
  final String text;
  final String url;
  const ExpandedTextWidget(
      {super.key,
      required this.text,
      required this.textLength,
      required this.url});

  @override
  State<ExpandedTextWidget> createState() => _ExpandedWidgetState();
}

class _ExpandedWidgetState extends State<ExpandedTextWidget> {
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
                Text(flag ? '$firstHalf...' : widget.text),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InkWell(
                    onTap: () {
                      _launchUrl(widget.url);
                    },
                    child: Text('Rread Full Article',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: TColors.appPrimaryColor)),
                  ),
                ),
                const SizedBox(
                  height: 5,
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

  Future<void> _launchUrl(url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
