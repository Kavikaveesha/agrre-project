import 'package:app/features/shop/screens/coomunity/Quections_flow/quection_flow.dart';
import 'package:app/features/shop/screens/coomunity/education/education_flow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/colors.dart';
import 'package:app/features/shop/screens/test.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen height
    final mediaQuery = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2, // Number of tabs (Common and Education)
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 240, 240),
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: TColors.appPrimaryColor,
          title: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome text
                Text(
                  'Welcome to ECO Net Community',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: const Color.fromARGB(255, 248, 239, 239)),
                ),
                // Welcome text subtitle
                Text(
                  'Ask Questions and find solutions\nRead articals and get more knowlage',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .apply(color: const Color.fromARGB(255, 218, 214, 214)),
                ),
              ],
            ),
          ),
          actions: [
            // Profile icon to navigate to the profile page
            InkWell(
              onTap: () {
                // Navigate to the profile page when the profile button is clicked
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Get.to(() => const Test());
                  },
                  child: const CircleAvatar(
                    radius: 16,
                    backgroundImage:
                        AssetImage(""), // Replace with your image asset
                  ),
                ),
              ),
            ),
          ],
          bottom: const TabBar(
            labelColor: Colors.white,
            tabs: [
              Tab(text: 'Quections'),
              Tab(text: 'Education'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [QuectionFlow(), EducationFlow()],
        ),
      ),
    );
  }
}
