import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 2,
        shape: const RoundedRectangleBorder(),
        foregroundColor: Colors.white,
        backgroundColor: TColors.appPrimaryColor,
        padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight)),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 2,
        shape: const RoundedRectangleBorder(),
        foregroundColor: Colors.white,
        backgroundColor: TColors.appPrimaryColor,
        side: const BorderSide(color: TColors.appSecondaryColor),
        padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight)),
  );
}
