import 'package:app/utils/constants/mediaQuery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../utils/constants/colors.dart';

class ProfileDetailField extends StatelessWidget {
  const ProfileDetailField({
    super.key,
    required this.labelIcon,
    required this.labelText,
    required this.detailtext,
    required this.onTapEdit,
    this.height,
  });
  final IconData labelIcon;
  final String labelText;
  final String detailtext;
  final VoidCallback onTapEdit;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Container(
        width: MediaQueryUtils.getWidth(context),
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14), // Fix border radius to 14
          border: Border.all(
            color: Colors.grey, // Set border color to grey
            style: BorderStyle.solid,
          ),
          color: Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          labelIcon,
                          color: Colors.grey,
                        ),
                        Text(
                          labelText,
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    GestureDetector(
                        onTap: onTapEdit,
                        child: const Text(
                          'Edit',
                          style: TextStyle(
                              fontSize: 15,
                              color: TColors.appPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    maxLines: 2,
                    detailtext,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: const Color.fromARGB(255, 54, 54, 54)),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
