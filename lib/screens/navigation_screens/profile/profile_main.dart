import 'package:astro_talk/bloc/home/home_event.dart';
import 'package:astro_talk/bloc/profile/profile_event.dart';
import 'package:astro_talk/utils/constants/app_assets.dart';
import 'package:astro_talk/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/profile/profile_bloc.dart';
import '../../../bloc/profile/profile_state.dart';
import '../../../bloc/routes/app_pages.dart';
import '../../../utils/common_widgets/card_horizontal_list.dart';
import '../../../utils/common_widgets/custom_list_profile.dart';
import '../../../utils/common_widgets/inner_shadow.dart';
import '../../../utils/common_widgets/profile_goal_card.dart';
import '../../../utils/constants/app_gradient.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/get_storage.dart';
import '../../../utils/utils.dart';

class ProfileMain extends StatelessWidget {
  ProfileMain({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPreferenceHelper sPrefs = SharedPreferenceHelper();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileBloc>().add(GetProfile(context: context));
    });

    var token = sPrefs.getUserToken();
    if (token!.isEmpty) {
      return Center(
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
                color: Colors.white,
              ),
            ),
          ),
        ),

      );
    } else {
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
              title: Padding(
                padding: const EdgeInsets.only(left: 17, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 2),
                    const Text(
                      AppString.profile,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Utils.showError(context, 'Coming soon');
                      },
                      child: Image.asset(
                        AppAssets.settingLogo,
                        width: 27,
                        height: 27,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: SafeArea(
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, profileState) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Utils.showImageSourceDialog(context);
                                    },

                                    child: Container(
                                      width: 150,
                                      height: 150,
                                      padding: const EdgeInsets.all(3),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: InnerShadowCircle(
                                        size: 94,
                                        child: ClipOval(
                                          child:
                                              profileState.selectedImage != null
                                              ? Opacity(
                                                  opacity: 0.26,
                                                  child: Image.file(
                                                    profileState.selectedImage!,
                                                    width: 150,
                                                    height: 150,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              : Opacity(
                                                  opacity: 0.26,
                                                  child: Image.network(
                                                    'https://images.unsplash.com/photo-1575936123452-b67c3203c357?fm=jpg&q=60&w=3000',
                                                    width: 150,
                                                    height: 150,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 25,
                                    right: 25,
                                    child: GestureDetector(
                                      onTap: () {
                                        Utils.showImageSourceDialog(context);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          AppAssets.cameraLogo,
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              '${profileState.userModel?.firstName} ${profileState.userModel?.lastName}',
                              // Replace with actual model field
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              AppString.profileHint,
                              style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              AppString.profileTalent,
                              style: const TextStyle(
                                fontSize: 10,
                                fontFamily: 'Poppins',
                                color: profileTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context.pushNamed(Routes.editProfile);
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
                                  AppString.editProfile,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                AppString.yourAchievement,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 110,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: horizontalCardItems.length,
                                  itemBuilder: (context, index) {
                                    final item = horizontalCardItems[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                      ),
                                      child: CardHorizontalList(
                                        day: item['day'],
                                        iconPath: item['iconPath'],
                                        isLocked: item['isLocked'],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: SizedBox(
                                  height: 150,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 30,
                                        left: 12,
                                        right: 12,
                                        child: ProfileGoalCard(
                                          gradientColors: const [
                                            Color(0xFF7DE5CC),
                                            Color(0xFF8CA2D4),
                                            Color(0xFFA23DE2),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        top: 15,
                                        left: 0,
                                        right: 0,
                                        child: ProfileGoalCard(
                                          gradientColors: const [
                                            Color(0xFF7DE5CC),
                                            Color(0xFF8CA2D4),
                                            Color(0xFFA23DE2),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const CustomListProfile(title: 'My Friends'),
                              const SizedBox(height: 10),
                              const CustomListProfile(
                                title: 'Purchase History',
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
    }
  }

  final List<Map<String, dynamic>> horizontalCardItems = [
    {"day": "Day 1", "iconPath": "assets/icons/earth_3d.png", "isLocked": true},
    {
      "day": "Day 2",
      "iconPath": "assets/icons/jupiter_3d.png",
      "isLocked": true,
    },
    {
      "day": "Day 3",
      "iconPath": "assets/icons/jupiter_3d.png",
      "isLocked": false,
    },
    {
      "day": "Day 4",
      "iconPath": "assets/icons/jupiter_3d.png",
      "isLocked": true,
    },
    {
      "day": "Day 5",
      "iconPath": "assets/icons/jupiter_3d.png",
      "isLocked": false,
    },
    {
      "day": "Day 6",
      "iconPath": "assets/icons/jupiter_3d.png",
      "isLocked": true,
    },
    {
      "day": "Day 7",
      "iconPath": "assets/icons/jupiter_3d.png",
      "isLocked": false,
    },
  ];
}
