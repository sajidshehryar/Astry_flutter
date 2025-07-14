import 'package:astro_talk/bloc/home/home_event.dart';
import 'package:astro_talk/utils/constants/app_assets.dart';
import 'package:astro_talk/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/home/home_bloc.dart';
import '../../../bloc/home/home_state.dart';
import '../../../utils/common_widgets/gradient_rounded_button.dart';
import '../../../utils/common_widgets/inner_shadow.dart';
import '../../../utils/common_widgets/unicorn_outlined_button.dart';
import '../../../utils/constants/app_gradient.dart';
import '../../../utils/constants/app_colors.dart';

class UserProfile extends StatelessWidget {
   UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: searchColor, // solid background color
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
            title:  Padding(
              padding: EdgeInsets.only(left: 20,top: 20,bottom: 10),
              child: Image.asset(AppAssets.circularPurpleBack,width: 40,height: 40,)
            ),
          ),
          body: SafeArea(
              child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return  SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 150,
                                    height: 150,
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: InnerShadowCircle(
                                      size: 94,
                                      child: Opacity(
                                        opacity: 0.26,
                                        child: Image.network(
                                          width: 150,
                                          height: 150,
                                          'https://images.unsplash.com/photo-1575936123452-b67c3203c357?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Image.asset(
                                    AppAssets.cameraLogo,
                                    width: 30,
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Text(AppString.yourNameOrNick,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily:'Poppins',
                                    color: profileTextColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            UnicornOutlineContainer(
                              strokeWidth:1,
                              radius: 20,
                              gradient: LinearGradient(
                                colors: [borderColorOne, showColor, borderColorTwo],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              backgroundColor: profileNameContainer, // or AppColors.bgColor
                              child: Align(
                                alignment:Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text('Jessie', style: TextStyle(
                                      fontSize: 12,
                                      fontFamily:'Poppins',
                                      color: Colors.white
                                  ),),
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Text(AppString.chooseConversationAbout,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily:'Poppins',
                                    fontWeight: FontWeight.w500,
                                    color: profileTextColor
                                ),
                              ),
                            ),
                            BlocBuilder<HomeBloc, HomeState>(
                              builder: (context, state) {
                                return GridView.builder(
                                  itemCount: items.length,
                                  shrinkWrap: true,
                                  physics:  ClampingScrollPhysics(),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 30,
                                    mainAxisSpacing: 20,
                                    childAspectRatio: 1.8,
                                  ),
                                  itemBuilder: (context, index) {
                                    final item = items[index];
                                    final isChecked = state.selectedIndex == index;

                                    return GestureDetector(
                                      onTap: () {
                                        context.read<HomeBloc>().add(SelectSignupIndex(index, context));
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(horizontal: 25),
                                            decoration: BoxDecoration(
                                              gradient: RadialGradient(
                                                colors: item['gradient'],
                                                center: Alignment.bottomLeft,
                                                radius: 2.2,
                                                tileMode: TileMode.mirror,
                                              ),
                                              borderRadius: BorderRadius.circular(20),
                                              border: Border.all(width: 1, color: borderColorBox),
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Image.asset(item['icon'], width: 30, height: 30),
                                                SizedBox(height: 8),
                                                Text(
                                                  item['title'],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (isChecked)
                                            Positioned(
                                              top: 8,
                                              right: 12,
                                              child: Image.asset(AppAssets.tickBtn, width: 15, height: 15),
                                            ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 30),
                              child: GradientRoundedButton(
                                text: AppString.continues,
                                textStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Poppins',
                                ), onTap: () {  },
                              ),
                            ),
                          ],
                        ),
                      )
                    );
                  }
              )
          ),
        ),
      ),
    );
  }


  final  List<Map<String, dynamic>> items = [
    {
      'title': AppString.astrology,
      'icon': AppAssets.planetLogo,
      'gradient': [radiantThree,radiantOne,showColor],
    },
    {
      'title': AppString.numerology,
      'icon': AppAssets.numerologyLogo,
      'gradient': [radiantThree,radiantOne,showColor],
    },
    {
      'title': AppString.affirmation,
      'icon': AppAssets.affirmationLogo,
      'gradient': [radiantThree,radiantOne,showColor],
    },
    {
      'title': AppString.horoscope,
      'icon': AppAssets.horoscopeLogo,
      'gradient': [radiantThree,radiantOne,showColor],
    },
    {
      'title': AppString.love,
      'icon': AppAssets.loveLogo,
      'gradient': [radiantThree,radiantOne,showColor],
    },
    {
      'title': AppString.dream,
      'icon': AppAssets.dreamLogo,
      'gradient': [radiantThree,radiantOne,showColor],
    },
  ];

}
