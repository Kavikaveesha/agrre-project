import 'package:app/common/custom_shape/widgets/profileDetailField/profile_detail_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '/common/custom_shape/containers/circular_design_container.dart';
import '/utils/constants/mediaQuery.dart';

class UpdateProfileDetails extends StatefulWidget {
  const UpdateProfileDetails({Key? key});

  @override
  State<UpdateProfileDetails> createState() => _UpdateProfileDetailsState();
}

class _UpdateProfileDetailsState extends State<UpdateProfileDetails> {
  // current user
  final currentUser = FirebaseAuth.instance.currentUser!;

  //  All Users
  final userCollection = FirebaseFirestore.instance.collection("users");

  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: Border.all(style: BorderStyle.none),
              backgroundColor: Colors.grey[900],
              title: Text(
                'Edit $field',
                style: const TextStyle(color: Colors.white),
              ),
              content: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter  new $field",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: InputBorder.none, // Remove the border
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                onChanged: (value) {
                  newValue = value;
                },
              ),
              actions: [
                // cancel button
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    )),

                // save button
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ));

    // update firestore dtabase
    if (newValue.trim().isNotEmpty) {
      await userCollection.doc(currentUser.email).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaqueryHeight = MediaQueryUtils.getHeight(context);

    return Scaffold(
        body: StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection("users")
          .doc(currentUser.email)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        if (!snapshot.hasData ||
            snapshot.data == null ||
            snapshot.data!.data() == null) {
          return const Center(
            child: Text('User data not found'),
          );
        }

        final userData = snapshot.data!.data() as Map<String, dynamic>;
        return SingleChildScrollView(
          child: CircularDesignContainer(
            backText: 'Back',
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(height: mediaqueryHeight * 0.2),
                    Text(
                      "Your Details",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(height: mediaqueryHeight * 0.05),
                    // First name
                    ProfileDetailField(
                      labelIcon: Icons.man,
                      labelText: 'First Name',
                      detailtext: userData['first_name'] ?? '',
                      onTapEdit: () => editField('first_name'),
                    ),
                    // Last name
                    ProfileDetailField(
                        labelIcon: Icons.man,
                        labelText: 'Last Name',
                        detailtext: userData['last_name'] ?? '',
                        onTapEdit: () => editField('last_name')),
                    ProfileDetailField(
                      labelIcon: Icons.mail,
                      labelText: 'E Mail',
                      detailtext: userData['email'] ?? '',
                      onTapEdit: () => editField('email'),
                    ),

                    ProfileDetailField(
                      labelIcon: Icons.mobile_friendly,
                      labelText: 'Mobile Number',
                      detailtext: userData['mobile'].toString(),
                      onTapEdit: () => editField('mobile'),
                    ),

                    ProfileDetailField(
                      labelIcon: Icons.location_on,
                      labelText: 'Address',
                      detailtext: userData['address'] ?? '',
                      onTapEdit: () => editField('address'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}
