import 'dart:io';

import 'package:astro_talk/animations/staggered_list_animation.dart';
import 'package:astro_talk/utils/common_widgets/gradient_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../bloc/signUp/signup_bloc.dart';
import '../../bloc/signUp/signup_event.dart';
import '../../bloc/signUp/signup_state.dart';
import '../../utils/utils.dart';
import '../../utils/common_widgets/gradient_rounded_button.dart';
import '../../utils/common_widgets/square_rounded_container.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_assets.dart';
import '../../utils/constants/app_strings.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key,});
  final TextEditingController mobileController = TextEditingController();
  String selectedCountryCode = "+91";

  void _submit(BuildContext context) {
    var data={
      'phone':mobileController.text.trim(),
      'countryCode':selectedCountryCode
    };
    context.read<SignupBloc>().add(
      CheckNumber(
          context: context,
          data: data
      ),
    );
  }

  bool validateUserDetails(BuildContext context) {
    final mobile = mobileController.text.trim();
    if (mobile.length < 10 || !RegExp(r'^\d{10,12}$').hasMatch(mobile)) {
      Utils.showError(context, AppString.pleaseEnterValidMobile);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: searchColor,
        body: SafeArea(
          child: BlocBuilder<SignupBloc, SignupState>(
              builder: (context, state) {
                var bloc = context.read<SignupBloc>();
                return SingleChildScrollView(
                  physics:  ClampingScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Stack(
                    children: [
                      Image.asset(AppAssets.loginTwo,
                          width: double.infinity, fit: BoxFit.fill).animate().fadeIn(
                          delay: 0.5.seconds,
                          duration: 500.ms,
                          curve: Curves.easeIn),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: Platform.isIOS ? 200 : 160),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
                            child: Column(
                              children: [
                                StaggeredListAnimation(
                                  initialDelay: 50,
                                  interval: 50,
                                  children: [
                                    wrapChildren( children:[
                                      Center(
                                        child: Text(AppString.login,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            )),
                                      ),
                                      const SizedBox(height: 20),
                                      // First Name and Last Name
                                    ]),

                                    const SizedBox(height: 10),
                                    wrapChildren( children:[
                                      FormField<String>(
                                        validator: (_) {
                                          final mobile = mobileController.text.trim();
                                          if (mobile.isEmpty) {
                                            return AppString.pleaseEnterMobileNo;
                                          } else if (!RegExp(r'^\d{10,12}$').hasMatch(mobile)) {
                                            return AppString.pleaseEnterValidMobile;
                                          }
                                          return null;
                                        },
                                        builder: (field) {
                                          return Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                text: const TextSpan(
                                                  text: AppString.mobileNo,
                                                  style: TextStyle(color: greyText, fontFamily: 'Poppins'),
                                                  children: [
                                                    TextSpan(
                                                      text: ' *',
                                                      style: TextStyle(color: Colors.red),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10,),
                                              IntlPhoneField(
                                                controller: mobileController,
                                                flagsButtonPadding: const EdgeInsets.symmetric(vertical: 0,horizontal:8),
                                                dropdownIconPosition: IconPosition.trailing,
                                                dropdownTextStyle: const TextStyle(color: Colors.white),
                                                style: const TextStyle(color: Colors.white),
                                                decoration: InputDecoration(
                                                  labelText: AppString.mobileNoHint,
                                                  labelStyle: const TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 10,
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.transparent,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                    borderSide: BorderSide(
                                                      color: field.hasError ? Colors.red : const Color(0xFF756DBB),
                                                    ),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                    borderSide: BorderSide(
                                                      color: field.hasError ? Colors.red : const Color(0xFF756DBB),
                                                      width: 1,
                                                    ),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                    borderSide: BorderSide(
                                                      color: field.hasError ? Colors.red : const Color(0xFF756DBB),
                                                    ),
                                                  ),
                                                ),
                                                initialCountryCode: 'IN',
                                                showCursor: true,
                                                showDropdownIcon: true,
                                                onChanged: (phone) {
                                                  selectedCountryCode = phone.countryCode;
                                                  field.didChange(phone.number); // Notify form of changes
                                                },
                                              ),
                                              if (field.hasError)
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8, top: 4),
                                                  child: Text(
                                                    field.errorText!,
                                                    style: const TextStyle(color: Colors.red, fontSize: 12),
                                                  ),
                                                ),
                                            ],
                                          );
                                        },
                                      ),
                                      const SizedBox(height: 16),
                                    ]),
                                    bloc.state.isLoading? GradientLoadingButton():GradientRoundedButton(
                                      text: AppString.getOtp,
                                      onTap: () => {
                                        _submit(context)
                                      },
                                      textStyle: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Poppins',
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
                );
              }
          ),
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