import 'package:flutter/cupertino.dart';

import 'app_colors.dart' as AppColors;

class AppGradients {
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [
      AppColors.semiTransparentPurple,
      AppColors.semiTransparentBlue,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient CompatibilityBtnPurple = LinearGradient(
    colors: [
      AppColors.btnPurpleDark,
      AppColors.btnPurpleLight,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient CompatibilityBtnBlack = LinearGradient(
    colors: [
      AppColors.btnBlacKWhite,
      AppColors.btnBlacKDark,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}