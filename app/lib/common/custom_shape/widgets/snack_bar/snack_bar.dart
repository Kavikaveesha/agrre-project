import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/utils/constants/colors.dart';

class SnackbarHelper {
  static void showSnackbar({
    required String title,
    required String message,
    Color? backgroundColor,
    Color? textColor=Colors.white,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor ?? TColors.appPrimaryColor,
      colorText: textColor ?? Colors.white,
    );
  }
}
