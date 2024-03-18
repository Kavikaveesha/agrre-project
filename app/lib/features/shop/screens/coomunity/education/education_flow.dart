import 'package:app/utils/constants/mediaQuery.dart';
import 'package:flutter/material.dart';

import '../../../../../common/custom_shape/containers/search_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../test.dart';
import 'artical_card.dart';

class EducationFlow extends StatelessWidget {
  const EducationFlow({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryheight = MediaQueryUtils.getHeight(context);
    final mediaQueryWidth = MediaQueryUtils.getWidth(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Green color container
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.15,
              color: TColors.appPrimaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search bar container
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: SearchBarContainer(
                      resultPage: Test(),
                      text: 'Type Keyword...',
                    ),
                  ),
                  SizedBox(height: mediaQueryheight * 0.005),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Filter Articals',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            width: mediaQueryWidth * .01,
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5)),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.filter_list),
                              color: Colors.white,
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                      height:
                          mediaQueryheight * 1.5, // Set the height as needed
                      child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return const ArticalCard(
                              articleTitle: 'Healthy Growing Foods',
                              articleCategory: 'Foods',
                              articleImage: TImages.farmer1,
                              articleText:
                                  'Add any URL schemes passed to canLaunchUrl as <queries> entries in your AndroidManifest.xml, otherwise it will return false in most cases starting on Android 11 (API 30) or higher. Checking for supportsLaunchMode(LaunchMode.inAppBrowserView) also requires a <queries> entry to return anything but false. A <queries> element must be added to your manifest as a child of the root element',
                              url: 'https://flutter.dev',
                            );
                          }))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
