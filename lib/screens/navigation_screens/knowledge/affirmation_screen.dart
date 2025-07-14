import 'package:astro_talk/utils/constants/app_assets.dart';
import 'package:astro_talk/utils/constants/app_colors.dart';
import 'package:astro_talk/utils/constants/app_gradient.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/common_widgets/custom_gradient_btn_image.dart';
import '../../../utils/common_widgets/gradient_button.dart';
import '../../../utils/constants/app_strings.dart';

class AffirmationScreen extends StatelessWidget {
  const AffirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: searchColor,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.backgroundGradient,
        ),
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => context.pop(),
                          child: Image.asset(AppAssets.circularPurpleBack, width: 40, height: 40),
                        ),
                        const Text(
                          AppString.affirmations,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 40),
                      ],
                    ),
                  ),

                  const Spacer(),
                ],
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height/1.2,
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF2B1555),
                        Color(0xFF3F1864),
                        Color(0xFF5F1C79),
                      ],
                      stops: [0, 0.04, 0.93],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF2B1555),
                          Color(0xFF2B1555),
                          Color(0xFF2B1555),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/icons/affirmation_boy.png',
                          height: 250,
                          fit: BoxFit.contain,
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                             AppString.affirmationsText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal:10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: CustomGradientBtnImage(
                                  text: AppString.save,
                                  imageAsset:AppAssets.chritmas,
                                  onPressed: () {},
                                  gradient: AppGradients.CompatibilityBtnBlack.withOpacity(0.13),
                                  textPadding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: CustomGradientBtnImage(
                                  text: AppString.stories,
                                  imageAsset:AppAssets.insta,
                                  onPressed: () {},
                                  gradient: AppGradients.CompatibilityBtnPurple,
                                  textPadding: const EdgeInsets.symmetric(horizontal: 34, vertical: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
