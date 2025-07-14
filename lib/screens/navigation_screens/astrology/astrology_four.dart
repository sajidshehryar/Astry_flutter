import 'package:astro_talk/bloc/astrology_bloc/astrology_event.dart';
import 'package:astro_talk/utils/constants/app_colors.dart';
import 'package:astro_talk/utils/constants/app_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/astrology_bloc/astrology_bloc.dart';
import '../../../bloc/astrology_bloc/astrology_state.dart';
import '../../../bloc/routes/app_pages.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/get_storage.dart';

class AstrologyFour extends StatelessWidget {
  const AstrologyFour({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPreferenceHelper sPrefs = SharedPreferenceHelper();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<AstrologyBloc>().add(GetNumerologyReport(context: context));
    // });
    var token = sPrefs.getUserToken();
    if (token!.isEmpty) {
      return
        Container(
          color: searchColor,
          child: Container(
            decoration: const BoxDecoration(
              gradient: AppGradients.backgroundGradient,
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  context.goNamed(Routes.signIn);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: buttonBorder,
                      width: 2,
                    ),
                  ),
                  child: const Text(
                    AppString.pleaseLoginFirst,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      decoration: TextDecoration.none,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            ),
          ),);
    }
    else{
      return Scaffold(
        backgroundColor: searchColor,
        body: BlocBuilder<AstrologyBloc, AstrologyState>(
            builder: (context, state) {
              return  Container(
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
                                  AppString.radicalNumber,
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
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20,),
                                    Stack(
                                      children: [
                                        Container(
                                          height: 250,
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [reportOne,reportTwo],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 2,
                                          left: 0,
                                          right: 0,
                                          child: Image.asset('assets/icons/flower.png',
                                          width:360,height:280,),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 20,),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal:5),
                                          child: Text(state.numerologyReportModel?.title?? AppString.whatSay,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal:5),
                                          child: Text(state.numerologyReportModel?.description??AppString.description,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 13,
                                              height: 1.5,
                                              wordSpacing: 6.0,
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),


                                      ],
                                    )


                                  ],
                                ),
                              )
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              );
            }
        ),
      );

    }
  }
}
