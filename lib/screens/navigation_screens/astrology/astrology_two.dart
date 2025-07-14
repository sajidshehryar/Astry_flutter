import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/astrology_bloc/astrology_bloc.dart';
import '../../../bloc/astrology_bloc/astrology_event.dart';
import '../../../bloc/astrology_bloc/astrology_state.dart';
import '../../../bloc/routes/app_pages.dart';
import '../../../data/models/natal_model.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_gradient.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/get_storage.dart';

class AstrologyTwo extends StatelessWidget {
  const AstrologyTwo({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPreferenceHelper sPrefs = SharedPreferenceHelper();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<AstrologyBloc>().add(GetNatalData(context: context));
    //   context.read<AstrologyBloc>().add(GetNatalWheel(context: context));
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
                      child: Image.asset(AppAssets.circularPurpleBack, width: 40, height: 40),
                    ),
                    const Text(
                      AppString.notalChart,
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
                  final List<Planet> planetsToUse = state.astrologyChartData?.planets ?? planets;
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: 225,
                              height: 225,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child:
                              SvgPicture.network(
                                state.natalWheelData?.chartUrl ?? 'https://s3.ap-south-1.amazonaws.com/western-chart/219f91e0-5cbf-11f0-ae6d-916eef4a75ad.svg',
                                placeholderBuilder: (context) => const CircularProgressIndicator(),
                                height: 300,
                                width: 300,
                              )

                          ),
                        ),
                        const SizedBox(height: 30),


                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildColumn(
                                title: AppString.planet,
                                children: planetsToUse.map((item) => buildCellRow(item.name)).toList(),                            ),

                              buildColumn(
                                title: AppString.sign,
                                children: planetsToUse.map((item) => buildCellRowTwo(item.sign )).toList(),
                              ),

                              buildColumn(
                                title: AppString.degree,
                                children: planetsToUse.map((item) => buildCellText(item.fullDegree.toStringAsFixed(2),50)).toList(),
                              ),

                              buildColumn(
                                title: AppString.house,
                                children: planetsToUse.map((item) => buildCellText(item.house.toString(),45)).toList(),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),
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

  Widget buildColumn({required String title, required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: Colors.white)),
          const SizedBox(height: 20),
          ...children,
        ],
      ),
    );
  }

  Widget buildCellRow(String planetName) {
    final planetIcon = planetMap[planetName];

    return Container(
      width: 90,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: textBottom, width: 1.5)),
      ),
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          planetIcon != null
              ? Image.asset(
            planetIcon,
            width: 18,
            height: 18,
            color: Colors.white,
          )
              : Image.asset(
             AppAssets.saturn,
            width: 18,
            height: 18,
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              planetName,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCellRowTwo(String planetName) {
    final planetIcon = signInMap[planetName];

    return Container(
      width: 90,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: textBottom, width: 1.5)),
      ),
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          planetIcon != null
              ? Image.asset(
            planetIcon,
            width: 18,
            height: 18,
            color: Colors.white,
          )
              : Image.asset(
            AppAssets.neptune,
            width: 18,
            height: 18,
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              planetName,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget buildCellText(String value,double bottomLength) {
    return Container(
      width:bottomLength,

      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: textBottom, width: 1.5)),
      ),
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.only(bottom: 17.2),
      child: Text(value,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: Colors.white)),
    );
  }
}




final List<Planet> planets = [
  Planet(name: 'Sun', fullDegree: 266.0303, normDegree: 26.0303, speed: 1.0182, isRetro: false, signId: 9, sign: 'Sagittarius', house: 7),
  Planet(name: 'Moon', fullDegree: 215.6064, normDegree: 5.6064, speed: 14.065, isRetro: false, signId: 8, sign: 'Scorpio', house: 6),
  Planet(name: 'Mars', fullDegree: 283.6565, normDegree: 13.6565, speed: 0.7714, isRetro: false, signId: 10, sign:   'Capricorn', house: 8),
  Planet(name: 'Mercury', fullDegree: 279.8215, normDegree: 9.8215, speed: 1.5428, isRetro: false, signId: 10, sign: 'Capricorn', house: 8),
  Planet(name: 'Jupiter', fullDegree: 266.3915, normDegree: 26.3915, speed: 0.2283, isRetro: false, signId: 9, sign: 'Sagittarius', house: 7),
  Planet(name: 'Venus', fullDegree: 295.8978, normDegree: 25.8978, speed: 1.2369, isRetro: false, signId: 10, sign: 'Capricorn', house: 8),
  Planet(name: 'Saturn', fullDegree: 348.6213, normDegree: 18.6213, speed: 0.0463, isRetro: false, signId: 12, sign: 'Pisces', house: 10),
  Planet(name: 'Uranus', fullDegree: 298.6148, normDegree: 28.6148, speed: 0.0518, isRetro: false, signId: 10, sign: 'Capricorn', house: 9),
  Planet(name: 'Neptune', fullDegree: 294.1937, normDegree: 24.1937, speed: 0.0343, isRetro: false, signId: 10, sign: 'Capricorn', house: 8),
  Planet(name: 'Pluto', fullDegree: 241.4723, normDegree: 1.4723, speed: 0.037, isRetro: false, signId: 9, sign: 'Sagittarius', house: 6),
  Planet(name: 'Node', fullDegree: 204.5884, normDegree: 24.5884, speed: -0.0233, isRetro: true, signId: 7, sign: 'Libra', house: 5),
  Planet(name: 'Chiron', fullDegree: 192.6902, normDegree: 12.6902, speed: 0.0781, isRetro: false, signId: 7, sign: 'Libra', house: 5),
  Planet(name: 'Part of Fortune', fullDegree: 18.9335, normDegree: 18.9335, speed: 0.0, isRetro: false, signId: 1, sign: 'Aries', house: 11),
];

Map<String, String> planetMap = {
  'Chiron': AppAssets.chiron,
  'Moon': AppAssets.crescent,
  'Part of Fortune': AppAssets.fortune,
  'Jupiter': AppAssets.jupiter,
  'Mars': AppAssets.mars,
  'Mercury': AppAssets.mercury,
  'Neptune': AppAssets.neptune,
  'Node': AppAssets.node,
  'Pluto': AppAssets.pluto,
  'Saturn': AppAssets.saturn,
  'Sun': AppAssets.sunList,
  'Uranus': AppAssets.uranus,
  'Venus': AppAssets.venus,
};

Map<String, dynamic> signInMap = {
  'Pisces': AppAssets.pisces,
  'Libra': AppAssets.libra,
  'Aries': AppAssets.aries,
  'Virgo': AppAssets.virgo,
  'Gemini': AppAssets.gemini,
  'Scorpio': AppAssets.scorpio,
  'Taurus': AppAssets.taurus,
  'Capricorn': AppAssets.capricorn,
  'Leo': AppAssets.leo,
  'Cancer': AppAssets.cancer,
  'Aquarius': AppAssets.aquarius,
  'Sagittarius': AppAssets.Sagittarius,
};



