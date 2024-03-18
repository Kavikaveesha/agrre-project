import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        
        elevation: 2,
        shape: const RoundedRectangleBorder(),
        foregroundColor: TColors.appSecondaryColor,
        side: const BorderSide(color: TColors.appSecondaryColor),
        padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight)),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        elevation: 2,
        shape: const RoundedRectangleBorder(),
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white),
        padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight)),
  );
}
