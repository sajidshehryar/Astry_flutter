import 'package:astro_talk/bloc/home/home_event.dart';
import 'package:astro_talk/network/api_constants.dart';
import 'package:astro_talk/utils/constants/app_assets.dart';
import 'package:astro_talk/utils/constants/app_strings.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/home/home_bloc.dart';
import '../../../bloc/home/home_state.dart';
import '../../../utils/common_widgets/gradient_button.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_gradient.dart';

class CompatibilityMain extends StatelessWidget {
  const CompatibilityMain({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(GetCompatibility(context: context));
    });

    final ValueNotifier<int> _maleCurrent = ValueNotifier<int>(0);
    final ValueNotifier<int> _femaleCurrent = ValueNotifier<int>(0);



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
              padding: const EdgeInsets.only(left:17, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width:2,),
                  const Text(
                    AppString.compatibility,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                  Image.asset(AppAssets.fileSave, width: 27, height: 27),
                ],
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return  Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20,),
                          ValueListenableBuilder<int>(
                            valueListenable: _maleCurrent,
                            builder: (context, currentIndex, _) {
                              return SizedBox(
                                height: 220,
                                child: CarouselSlider(
                                  items: List.generate(state.compatibilityListMale.length, (index) {
                                    final item = state.compatibilityListMale[index];
                                    var imageUrl = item.profilepicture!.startsWith('http')
                                        ? item.profilepicture
                                        : '${ApiConstants.baseUrl}${item.profilepicture}';

                                    return _carouselItem(imageUrl!,item.firstName!, item.dob!, item.phone.toString(), index == currentIndex);
                                  }),
                                  options: CarouselOptions(
                                    height: MediaQuery.of(context).size.height/2.3,
                                    enlargeCenterPage: true,
                                    aspectRatio: 1,
                                    onPageChanged: (index, reason) {
                                      _maleCurrent.value = index;
                                    },
                                    viewportFraction: 0.35,
                                  ),
                                ),
                              );
                            },
                          ),

                          ValueListenableBuilder<int>(
                            valueListenable: _femaleCurrent,
                            builder: (context, currentIndex, _) {
                              return SizedBox(
                                height: 200,
                                child: CarouselSlider(
                                  items: List.generate(state.compatibilityListFemale.length, (index) {
                                    final item = state.compatibilityListFemale[index];
                                    var imageUrl = item.profilepicture!.startsWith('http')
                                        ? item.profilepicture
                                        : '${ApiConstants.baseUrl}${item.profilepicture}';
                                    return _carouselItem(imageUrl!,item.firstName!, item.dob!, item.phone.toString(), index == currentIndex);
                                  }),
                                  options: CarouselOptions(
                                    height: MediaQuery.of(context).size.height/2.3,
                                    enlargeCenterPage: true,
                                    aspectRatio: 3,
                                    onPageChanged: (index, reason) {
                                      _femaleCurrent.value = index;
                                    },
                                    viewportFraction: 0.35,
                                  ),
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 15),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal:10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: GradientButton(
                                    text: AppString.matchWithKundli,
                                    onPressed: () {},
                                    gradient: AppGradients.CompatibilityBtnBlack.withOpacity(0.13),
                                    textPadding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: GradientButton(
                                    text: AppString.matchWithAi,
                                    onPressed: () {},
                                    gradient: AppGradients.CompatibilityBtnPurple,
                                    textPadding: const EdgeInsets.symmetric(horizontal: 34, vertical: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                )



              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _carouselItem(String imagePath, String name, String dob, String zodiac, bool isSelected) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(6.0),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : carouselContainerColor,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imagePath,
              height: 90,
              width: 90,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: isSelected?Colors.white:carouselGreyText),
          textAlign: TextAlign.center,
        ),
        Text(
          dob,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:  TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: isSelected?Colors.white:carouselGreyText),
          textAlign: TextAlign.center,
        ),
        Text(
          zodiac,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:  TextStyle(fontSize: 9, fontWeight: FontWeight.w500, color: isSelected?Colors.white:carouselGreyText),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

}
