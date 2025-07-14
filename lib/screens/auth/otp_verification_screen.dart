import 'dart:async';
import 'dart:io';
import 'package:astro_talk/animations/staggered_list_animation.dart';
import 'package:astro_talk/bloc/signUp/signup_bloc.dart';
import 'package:astro_talk/bloc/signUp/signup_event.dart';
import 'package:astro_talk/bloc/signUp/signup_state.dart';
import 'package:astro_talk/network/api_constants.dart';
import 'package:astro_talk/screens/auth/user_tour_screen.dart';
import 'package:astro_talk/utils/common_widgets/gradient_loading_button.dart';
import 'package:astro_talk/utils/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../services/navigation_services.dart';
import '../../utils/utils.dart';
import '../../utils/common_widgets/gradient_rounded_button.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_strings.dart';

class OtpVerificationScreen extends StatefulWidget {
   const OtpVerificationScreen({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  String? otpEntered;
  int _remainingTime = 30;
  Timer? _timer;
  late bool isLoading = false;
  late bool isLoadingResend = false;



  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _remainingTime = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController =
    TextEditingController(text: widget.data['countryCode'].toString()+widget.data['phone'].toString());
    final ValueNotifier<String> enteredOtp = ValueNotifier('');

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: searchColor,
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            SafeArea(
              child: BlocBuilder<SignupBloc, SignupState>(
                  builder: (context, state) {
                  var bloc = context.read<SignupBloc>();
                  return SingleChildScrollView(
                    physics:  ClampingScrollPhysics(),
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Stack(
                      children: [
                        Image.asset(
                          AppAssets.loginTwo,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ).animate().fadeIn(
                            delay: 0.5.seconds,
                            duration: 500.ms,
                            curve: Curves.easeIn),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                30, Platform.isIOS ? 340 : 310, 30, 0),
                            child: Column(
                              children: [
                                StaggeredListAnimation(
                                  initialDelay: 50,
                                  interval: 50,
                                  children: [
                                    const SizedBox(height: 40),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        AppString.enterYourCode,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Text(
                                        AppString.codeHasBeenSent,
                                        style: TextStyle(
                                          color: greyText,
                                          fontSize: 15,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    TextField(
                                      controller: phoneController,
                                      readOnly: true,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: greyText,
                                        fontSize: 15,
                                        fontFamily: 'Poppins',
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        isDense: true,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                    ),
                                    const SizedBox(height: 80),
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 40),
                                      child: ValueListenableBuilder<String>(
                                        valueListenable: enteredOtp,
                                        builder: (context, value, _) {
                                          return PinCodeTextField(
                                            appContext: context,
                                            length: 6,
                                            animationType: AnimationType.fade,
                                            keyboardType: TextInputType.number,
                                            cursorColor: Colors.grey,

                                            textStyle: const TextStyle(
                                              fontSize: 20,
                                              color: optTextColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Poppins',
                                            ),
                                            pinTheme: PinTheme(
                                              shape: PinCodeFieldShape.underline,
                                              fieldHeight: 50,
                                              fieldWidth: 32,
                                              activeColor: Colors.grey,
                                              selectedColor: otpUnderColor,
                                              inactiveColor: otpUnderColor,
                                              borderWidth: 2,
                                            ),
                                            animationDuration:
                                            const Duration(milliseconds: 300),
                                            enableActiveFill: false,
                                            onChanged: (value) {
                                              debugPrint(value);
                                              setState(() {
                                                otpEntered = value;
                                              });

                                            },
                                            onCompleted: (otp) {
                                              debugPrint(otp);
                                              setState(() {
                                                otpEntered = otp;
                                              });
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppString.didNotYouGetAny,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            children: [
                                              _remainingTime == 0
                                                  ? isLoadingResend
                                                  ? const SizedBox(
                                                height: 20,
                                                width: 20,
                                                child: CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                      Color.fromRGBO(201, 40, 40, 1)),
                                                ),
                                              )
                                                  : InkWell(
                                                onTap: () async {
                                                  if (_remainingTime == 0 && !isLoadingResend) {
                                                    setState(() {
                                                      isLoadingResend = true;
                                                    });

                                                    try {
                                                      final data = {
                                                        'phone': widget.data["phone"]
                                                      };

                                                      context.read<SignupBloc>().add(
                                                        ResendOtp(data: data, context: context),
                                                      );
                                                      await Future.delayed(const Duration(milliseconds: 500));
                                                      if (mounted) {
                                                        _startTimer(); // Restart the timer only after resend
                                                      }
                                                    } catch (e) {
                                                      if (mounted) {
                                                        Utils.showError(context, 'Something went wrong');
                                                      }
                                                    } finally {
                                                      if (mounted) {
                                                        setState(() {
                                                          isLoadingResend = false;
                                                        });
                                                      }
                                                    }
                                                  }
                                                },
                                                child: const Text(
                                                  AppString.resent,
                                                  style: TextStyle(
                                                    color: resentTextColor,
                                                    fontSize: 15,
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                              )
                                                  : Text(
                                                  '00:${_remainingTime.toString().padLeft(2, '0')} seconds',
                                                  style:  TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w700,
                                                    color:  Color.fromRGBO(
                                                        46, 114, 25, 1.0),
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 50),
                                    bloc.state.isLoading? GradientLoadingButton():GradientRoundedButton(
                                      text: AppString.submit,
                                      onTap: () {
                                        if(otpEntered!=null){
                                          if(Utils.validateOtp(context: context,otp: otpEntered!)){
                                            widget.data['otp'] = otpEntered;
                                            context.read<SignupBloc>().add(
                                              VerifyOtp(
                                                  context: context,
                                                  data: widget.data
                                              ),
                                            );
                                          }
                                        }else{
                                          Utils.showError(context, AppString.otpValidation);
                                        }

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
                      ],
                    ),
                  );
                }
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
