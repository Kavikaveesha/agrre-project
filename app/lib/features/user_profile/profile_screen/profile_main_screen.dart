import 'dart:io';
import 'dart:typed_data';
import 'package:app/common/custom_shape/widgets/cards/profile_details_card/profile_details_card.dart';
import 'package:app/features/authentication/logIn_screen/login_main.dart';
import 'package:app/utils/constants/colors.dart';
import 'package:app/utils/constants/mediaQuery.dart';
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

  @override
  Widget build(BuildContext context) {
    String name = 'kavindu';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.appPrimaryColor,
        title: Text(
          '$name\'s Profile',
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
                    _image != null
                        ? CircleAvatar(
                            radius: 80,
                            backgroundImage:
                                _image != null ? MemoryImage(_image!) : null,
                          )
                        : const CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.lightGreenAccent,
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
                SizedBox(height: MediaQueryUtils.getHeight(context) * .02),

                // Change Password
                ProfileDetailsCard(
                  text: EcoTexts.pfmBtn2,
                  onTap: () {
                    Get.to(() => const ChangePasswordMain());
                  },
                  icon: Icons.key,
                ),
                SizedBox(height: MediaQueryUtils.getHeight(context) * .02),

                // Card Details
                ProfileDetailsCard(
                  text: EcoTexts.pfmBtn3,
                  onTap: () {
                    Get.to(() => const ChangePasswordMain());
                  },
                  icon: Icons.credit_card,
                ),
                SizedBox(height: MediaQueryUtils.getHeight(context) * .02),

                // About us
                ProfileDetailsCard(
                  text: EcoTexts.pfmBtn4,
                  onTap: () {
                    Get.to(() => const AboutUsDetails());
                  },
                  icon: Icons.menu_book,
                ),
                SizedBox(height: MediaQueryUtils.getHeight(context) * .02),
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
                SizedBox(height: MediaQueryUtils.getHeight(context) * .02),
              ],
            ),
          ],
        ),
      ),
    );
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
