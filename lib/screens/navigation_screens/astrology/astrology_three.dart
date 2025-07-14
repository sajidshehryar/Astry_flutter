import 'package:astro_talk/bloc/astrology_bloc/astrology_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/astrology_bloc/astrology_bloc.dart';
import '../../../bloc/astrology_bloc/astrology_state.dart';
import '../../../bloc/routes/app_pages.dart';
import '../../../utils/common_widgets/card_grid_destiny_number.dart';
import '../../../utils/common_widgets/card_grid_favourite_day.dart';
import '../../../utils/common_widgets/card_grid_name_number.dart';
import '../../../utils/common_widgets/card_grid_numerology.dart';
import '../../../utils/common_widgets/radical_grid_card.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_gradient.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/get_storage.dart';

class AstrologyThree extends StatelessWidget {
  const AstrologyThree({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPreferenceHelper sPrefs = SharedPreferenceHelper();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<AstrologyBloc>().add(GetNumerologyData(context: context));
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
                padding: const EdgeInsets.only(left: 10, top: 10,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap:(){
                          context.pop();
                        },
                        child: Image.asset(AppAssets.circularPurpleBack,width: 40,height: 40,)),
                    const Text(
                      AppString.numerology,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width:20 ,)
                  ],
                ),
              ),
            ),
            body: BlocBuilder<AstrologyBloc, AstrologyState>(
                builder: (context, state) {
                  return  Padding(
                      padding: EdgeInsets.symmetric(vertical:10,horizontal: 30),
                      child: GridView.custom(
                        gridDelegate: SliverWovenGridDelegate.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 1,
                          crossAxisSpacing: 2,
                          pattern: [
                            WovenGridTile(1),
                            WovenGridTile(
                              4.5/ 7,
                              crossAxisRatio: 0.95,
                              alignment: AlignmentDirectional.centerEnd,
                            ),
                          ],
                        ),
                        childrenDelegate: SliverChildBuilderDelegate(
                              (context, index) {
                            final numerology = state.numerologyDetail;

                            if (index == 0) {
                              return GestureDetector(
                                onTap: () {
                                  context.pushNamed(Routes.astrologyFour);
                                },
                                child: CardGridNumerology(
                                  title: 'Radial\nNumber',
                                  subTitle: numerology?.radicalNum?.toString() ?? '7',
                                  gradientColors: [cardGradientOne, cardGradientTwo],
                                ),
                              );
                            } else if (index == 1) {
                              return GradientCard(
                                title: 'Name\nNumber',
                                subTitle: numerology?.nameNumber?.toString() ?? '8',
                                iconPath: 'assets/icons/salary_man_icon.png',
                              );
                            } else if (index == 2) {
                              return CardGridFavouriteDay(
                                title: 'Favourite day',
                                subTitle: numerology?.favDay ?? 'Monday',
                                iconPath: 'assets/icons/favourite_day_icon.png',
                              );
                            } else if (index == 3) {
                              return CardGridDestinyNumber(
                                title: 'Destiny\nNumber',
                                subTitle: numerology?.destinyNumber?.toString() ?? '2',
                                gradientColors: [cardsDestinyOne, cardsDestinyTwo],
                              );
                            } else if (index == 4) {
                              return CardGridDestinyNumber(
                                title: 'Evil\nNumber',
                                subTitle: numerology?.evilNum ?? '7',
                                gradientColors: [evilNoOne, evilNoTwo],
                              );
                            } else if (index == 5) {
                              return RadicalGridCard(
                                title: 'Radical rular',
                                subTitle: numerology?.radicalRuler ?? 'Moon',
                                gradientColors: [radicalOne, radicalTwo],
                                iconPath: 'assets/icons/radical_logo.png',
                              );
                            } else {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.lightGreen,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              );
                            }
                          },
                          childCount: 6,
                        ),
                      )

                  );
                }
            ),
          ),
        ),
      );
    }
  }

}
