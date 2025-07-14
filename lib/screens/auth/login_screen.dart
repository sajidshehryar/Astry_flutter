import 'dart:io';
import 'package:astro_talk/animations/staggered_list_animation.dart';
import 'package:astro_talk/utils/constants/app_assets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/routes/app_pages.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_strings.dart';
import '../../utils/get_storage.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.role});

  final String role;

  @override
  Widget build(BuildContext context) {

    GetStorage getStorage = GetStorage();
    SharedPreferenceHelper sPrefs = SharedPreferenceHelper();

    return Scaffold(
      backgroundColor: searchColor,
      appBar: AppBar(
        backgroundColor: searchColor,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        physics:  ClampingScrollPhysics(),
        child:  Stack(
          children: [
            Image.asset(
             AppAssets.loginTwo,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ).animate().fadeIn(
                delay: 0.5.seconds,
                duration: 500.ms,
                curve: Curves.easeIn),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsetsGeometry.fromLTRB(0, 0, 0, Platform.isIOS?100:90),
                  child: StaggeredListAnimation(
                    initialDelay: 50,
                    interval: 50,
                    children: [
                      Column(
                        children: [
                          Text(
                            AppString.signUp,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildAuthButton(
                            context,
                            icon: AppAssets.phoneLogoSvg,
                            text: AppString.userMobileNo,
                            onTap: () => context.pushNamed(Routes.enterUserDetails,extra: 'user')
                          ),
                          _buildAuthButton(
                            onTap:(){
                            },
                            context,
                            icon: AppAssets.googleLogoSvg,
                            text: AppString.continueWithGoogle,
                          ),
                          _buildAuthButton(
                            onTap: (){
                              getStorage.write('isProfile', false);
                              sPrefs.saveUserToken('');
                              context.goNamed(Routes.tourScreen);
                            },
                            context,
                            icon: AppAssets.guestLogoSvg,
                            text: AppString.proceedAsGuest,
                          ),

                          GestureDetector(
                              onTap: () => context.pushNamed(Routes.enterUserDetails,extra: 'guru'),

                            child: Padding(
                              padding: const EdgeInsets.only(left:40, right: 40, top:80),
                              child: Text(AppString.createAccountAsGuru,
                                style: TextStyle(
                                  color: purpleText,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:40, right: 40, top: 10),
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Poppins',
                                ),
                                children: [
                                  const TextSpan(text: AppString.bySigningIn),
                                  TextSpan(
                                    text: AppString.termsConditions,
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.white,
                                      decorationThickness: 1.5,
                                      fontWeight: FontWeight.w700,

                                      color: greyText,
                                    ),
                                  ),
                                  const TextSpan(text: AppString.seeHowWeUse),
                                  TextSpan(
                                    text: AppString.privacyPolicy,
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.white,
                                      decorationThickness: 1.5,
                                      fontWeight: FontWeight.w700,

                                      color: greyText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40.0),
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                ),
                                children: [
                                  const TextSpan(text:AppString.alreadyHaveAccount),
                                  TextSpan(
                                    text: AppString.signInText,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      decorationColor: Colors.white,
                                      decorationThickness: 1.5,
                                      color: purpleText,
                                    ),
                                    recognizer:TapGestureRecognizer()
                                      ..onTap = () {
                                        context.pushNamed(Routes.signIn);
                                      },
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAuthButton(BuildContext context,
      {required String icon, required String text, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(30, 8, 30, 8),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: fieldBorder, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 22,
              height: 22,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(icon.contains('phone') ? 1 : 0),
              ),
              child: Center(
                child:
                SvgPicture.asset(
                  icon,
                  width: 18,
                  height:18,
                  color: Colors.white,
                )


                // Image.asset(
                //   icon,
                //   width: icon.contains('phone') ? 16 : 22,
                //   height: icon.contains('phone') ? 16 : 22,
                //   color: icon.contains('phone') ? shadowColor : null,
                // ),
              ),
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
Widget wrapChildren({required List<Widget> children}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: children,
  );
}

