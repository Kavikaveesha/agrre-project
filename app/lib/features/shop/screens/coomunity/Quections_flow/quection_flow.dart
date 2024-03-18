import 'package:app/features/shop/screens/coomunity/Quections_flow/quection_post/quection_list.dart';
import 'package:app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../common/custom_shape/containers/search_container.dart';
import '../../test.dart';
import 'quection_post/add_quection.dart';

class QuectionFlow extends StatelessWidget {
  const QuectionFlow({Key? key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryheight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Green color container
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.15,
              color: TColors.appPrimaryColor, // Replace with your color
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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'My Questions',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Filter Questions',
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
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.filter_list),
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const AddQuestion(),
                  // Quection List With comments
                  const QuectionList()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
