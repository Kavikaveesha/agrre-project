import 'dart:io';
import 'dart:typed_data';
import 'package:app/common/custom_shape/widgets/cards/profile_details_card/profile_details_card.dart';
import 'package:app/features/authentication/screens/logIn_screen/login_main.dart';
import 'package:app/features/user_profile/card_details/card_details.dart';
import 'package:app/utils/constants/colors.dart';
import 'package:app/utils/constants/mediaQuery.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/constants/text_strings.dart';
import '../about_us_screen/about_us_screen.dart';
import '../change_password_screen/change_password_screen.dart';
import '../update_profile_details_screen/update_profile_form.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List? _image;
  File? selectedImage;
  // current user
  final currentUser = FirebaseAuth.instance.currentUser!;

  //  All Users
  final userCollection = FirebaseFirestore.instance.collection("users");

  Future<void> uploadProfileImage(File imgFile) async {
    try {
      final Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_images/${DateTime.now().millisecondsSinceEpoch}');
      final uploadTask = storageRef.putFile(imgFile);
      final TaskSnapshot downloadUrl = await uploadTask;
      final String imageUrl = await downloadUrl.ref.getDownloadURL();

      // Get the current user
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw FirebaseAuthException(
          code: 'user-not-found',
          message: 'No user found.',
        );
      }

      // Update Firestore database
      final userCollection = FirebaseFirestore.instance.collection('users');
      final userDoc = await userCollection.doc(currentUser.email).get();
      if (!userDoc.exists) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User Not Found')),
        );
      }

      if (userDoc.data()!.containsKey('imgUrl')) {
        await userCollection
            .doc(currentUser.email)
            .update({'imgUrl': imageUrl});
      } else {
        await userCollection.doc(currentUser.email).set({
          'imageUrl': imageUrl,
        }, SetOptions(merge: true));
      }
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Exception: ${e.message}');
    } on FirebaseException catch (e) {
      print('Firebase Exception: ${e.message}');
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
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
            FirebaseAuth.instance.signOut();
          }

          final userData = snapshot.data!.data() as Map<String, dynamic>;
          String fist_name = userData['first_name'];
          String last_name = userData['last_name'];
          String full_name = fist_name + ' ' + last_name;

          String? imageUrl =
              userData.containsKey('imgUrl') ? userData['imgUrl'] : null;

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: TColors.appPrimaryColor,
              title: Text(
                '$full_name \'s profile',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: SizedBox(
                      width: MediaQueryUtils.getWidth(context),
                      height: MediaQueryUtils.getHeight(context) * .3,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          snapshot.hasData
                              ? CircleAvatar(
                                  radius: 80,
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(imageUrl!),
                                )
                              : const CircleAvatar(
                                  radius: 80,
                                  backgroundColor: Colors.white,
                                ),
                          Positioned(
                            bottom: 10,
                            left: 200,
                            child: IconButton(
                              onPressed: () {
                                showImagePickerOption(context);
                              },
                              icon: const Icon(
                                Icons.add_a_photo,
                                size: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // update profile details
                      ProfileDetailsCard(
                        text: EcoTexts.pfmBtn1,
                        onTap: () {
                          Get.to(() => const UpdateProfileDetails());
                        },
                        icon: Icons.verified_user,
                      ),
                      SizedBox(
                          height: MediaQueryUtils.getHeight(context) * .02),

                      // Change Password
                      ProfileDetailsCard(
                        text: EcoTexts.pfmBtn2,
                        onTap: () {
                          Get.to(() => const ChangePasswordMain());
                        },
                        icon: Icons.key,
                      ),
                      SizedBox(
                          height: MediaQueryUtils.getHeight(context) * .02),

                      // Card Details
                      ProfileDetailsCard(
                        text: EcoTexts.pfmBtn3,
                        onTap: () {
                          Get.to(() => const CardDetails());
                        },
                        icon: Icons.credit_card,
                      ),
                      SizedBox(
                          height: MediaQueryUtils.getHeight(context) * .02),

                      // About us
                      ProfileDetailsCard(
                        text: EcoTexts.pfmBtn4,
                        onTap: () {
                          Get.to(() => const AboutUsDetails());
                        },
                        icon: Icons.menu_book,
                      ),
                      SizedBox(
                          height: MediaQueryUtils.getHeight(context) * .02),
                      // About us
                      ProfileDetailsCard(
                        text: EcoTexts.pfmBtn5,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Confirmation'),
                                content: const Text("Do you want to Exit?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text('NO'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      FirebaseAuth.instance.signOut();
                                      Get.to(() => const LogIn());
                                    },
                                    child: const Text('Yes'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: Icons.logout,
                      ),
                      SizedBox(
                          height: MediaQueryUtils.getHeight(context) * .02),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.lightGreen,
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 70,
                          ),
                          Text("Gallery")
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromCamera();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 70,
                          ),
                          Text("Camera")
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Gallery
  Future<void> _pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    final File imageFile = File(pickedImage.path);
    final Uint8List bytes = await imageFile.readAsBytes();
    setState(() {
      selectedImage = imageFile;
      _image = bytes;
    });
    uploadProfileImage(selectedImage!);
    Navigator.of(context).pop();
  }

  // Camera
  Future<void> _pickImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage == null) return;
    final File imageFile = File(pickedImage.path);
    final Uint8List bytes = await imageFile.readAsBytes();
    setState(() {
      selectedImage = imageFile;
      _image = bytes;
    });
    Navigator.of(context).pop();
  }
}
