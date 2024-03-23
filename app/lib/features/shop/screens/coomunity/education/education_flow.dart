import 'package:app/utils/constants/mediaQuery.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../common/custom_shape/containers/search_container.dart';
import '../../../../../utils/constants/colors.dart';
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

                // Get all articales  from firebase('articals')
                  SizedBox(
                      width: mediaQueryWidth,
                      height: mediaQueryheight * .8, // Set the height as needed
                      child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('articals')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (snapshot.hasError) {
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            }
                            final articals = snapshot.data!.docs;

                            return Expanded(
                              child: ListView.builder(
                                  itemCount: articals.length,
                                  itemBuilder: (context, index) {
                                    final artical = articals[index];
                                    return ArticalCard(
                                        articleTitle: artical['title'],
                                        articleCategory: artical['category'],
                                        articleImage: artical['image_url'],
                                        articleText: artical['description'],
                                        url: artical['link']);
                                  }),
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
