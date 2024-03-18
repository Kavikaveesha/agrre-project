import 'package:app/common/custom_shape/widgets/appbar/app_bar.dart';
import 'package:app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'notification_card.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
                appbarTitle: 'Alert With Your Notifications',
                appbarSubtitle: '',
                profileImage: TImages.farmer2,
                onTapProfile: () {}),
            SizedBox(
              width: mediaQueryWidth,
              height: mediaQueryHeight * .8,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: NotificationCard(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
