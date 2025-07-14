import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/astrology_bloc/astrology_bloc.dart';
import '../../../bloc/astrology_bloc/astrology_event.dart';
import '../../../bloc/astrology_bloc/astrology_state.dart';
import '../../../bloc/routes/app_pages.dart';
import '../../../data/models/astrology_horoscope_model.dart';
import '../../../utils/common_widgets/gradient_rounded_button.dart';
import '../../../utils/common_widgets/unicorn_outlined_button.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_gradient.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/get_storage.dart';

class AstrologyOne extends StatelessWidget {
  const AstrologyOne({super.key});

  final List<String> tabs = const ['Today', 'Tomorrow', 'Month'];
  final List<String> tabsValue = const ['dailyPrediction', 'tomorrowPrediction', 'monthlyPrediction'];

  @override
  Widget build(BuildContext context) {
    SharedPreferenceHelper sPrefs = SharedPreferenceHelper();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<AstrologyBloc>().add(GetHoroscopeDetails(context: context));
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
      return Container(
        color: searchColor,
        child: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.backgroundGradient,
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Image.asset(AppAssets.circularPurpleBack,
                          width: 40, height: 40),
                    ),
                    const Text(
                      AppString.horoscope,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 30),
                  ],
                ),
              ),
            ),
            body: BlocBuilder<AstrologyBloc, AstrologyState>(
                builder: (context, state) {
                  return  SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildAstrologyHeader(state.selectedTabIndex==0 ? state.dailyPrediction?.sunSign?? 'Pisces' :  state.selectedTabIndex ==1 ? state.tomorrowPrediction?.sunSign?? 'Libra': '${state.monthlyPrediction?.sunSign?? 'Sapt Rshi'}',
                            state.selectedTabIndex==0 ? state.dailyPrediction?.predictionDate?? '8 july 2025 ' :  state.selectedTabIndex ==1 ? state.tomorrowPrediction?.predictionDate ?? '9 July 2025': '${state.monthlyPrediction?.predictionMonth??'October'}'
                        ),

                        const SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(tabs.length, (index) {
                              return Expanded(
                                child: _tabButton(
                                  context,
                                  tabs[index],
                                  index,
                                  state.selectedTabIndex == index,
                                ),
                              );
                            }),
                          ),
                        ),

                        const SizedBox(height: 20),
                        _tabContent(
                          index: state.selectedTabIndex,
                          tomorrowPrediction: state.tomorrowPrediction,
                          dailyPrediction: state.dailyPrediction,
                          monthlyPrediction: state.monthlyPrediction,
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

  Widget _tabButton(
      BuildContext context,
      String title,
      int index,
      bool isActive,
      ) {
    return GradientRoundedButton(
      text: title,
      onTap: () {
        context.read<AstrologyBloc>().add(ChangeAstrologyTab(index));
      },
      height: 46,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      gradientColors: isActive
          ? [radiantLeft, radiantRight]
          : [profileNameContainer, profileNameContainer],
      textStyle: TextStyle(
        color: isActive ? Colors.white : Colors.white70,
        fontSize: 10,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
      ),
    );
  }

  Widget _tabContent({
    required int index,
    required DailyPrediction? tomorrowPrediction,
    required DailyPrediction? dailyPrediction,
    required MonthlyPrediction? monthlyPrediction,
  }) {
    final List<Widget> contentList = [];
    if (index == 0 ) {
      final predictions = dailyPrediction?.prediction.toList() ?? [];
      contentList.addAll(predictions.map((item) {
        final title = item['title']?.replaceAll('_', ' ').toUpperCase() ?? '';
        final description = item['description'] ?? '';
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  height: 1.5,
                  wordSpacing: 6.0,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      }));
    }
    else if (index == 1) {
      final predictions = tomorrowPrediction?.prediction.toList() ?? [];
      contentList.addAll(predictions.map((item) {
        final title = item['title']?.replaceAll('_', ' ').toUpperCase() ?? '';
        final description = item['description'] ?? '';
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  height: 1.5,
                  wordSpacing: 6.0,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      }));
    }
    else if (index == 2) {
      final monthPredictions = monthlyPrediction?.prediction ?? [];
      contentList.addAll(monthPredictions.map((desc) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            desc,
            style: const TextStyle(
              fontSize: 12,
              height: 1.5,
              wordSpacing: 6.0,
              fontFamily: 'Poppins',
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        );
      }));
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: UnicornOutlineContainer(
        strokeWidth: 1,
        radius: 10,
        gradient: const LinearGradient(
          colors: [colorBorderTwo, colorBorderTwo, colorBorderTwo],
          begin: Alignment.topCenter,
          end: Alignment.topRight,
        ),
        backgroundColor: profileNameContainer,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: contentList,
          ),
        ),
      ),
    );
  }

  Widget _buildAstrologyHeader(String rashi,String date) {
    return Column(
      children: [
        Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/icons/circular_border_horoscope.png',
                    width: 300, height: 300, fit: BoxFit.fill),
                Image.asset('assets/icons/circular_shadow.png',
                    width: 200, height: 200, fit: BoxFit.cover),
                Image.asset('assets/icons/cicular_horo_logo.png',
                    width: 197, height: 197, fit: BoxFit.contain),
                Image.asset('assets/icons/horoscope_icon.gif',
                    width: 200, height: 200, fit: BoxFit.contain),
              ],
            ),
          ),
        ),
         Text(
          rashi,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 5),
         Text(
          date,
          style: TextStyle(
            fontSize: 10,
            fontFamily: 'Poppins',
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
