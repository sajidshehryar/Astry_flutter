import 'package:astro_talk/screens/navigation_screens/compatibility/compatibility_main.dart';
import 'package:astro_talk/screens/navigation_screens/knowledge/knowledge_main.dart';
import 'package:astro_talk/screens/navigation_screens/profile/profile_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import '../../bloc/bottom_navigation/navigation_cubit.dart';
import '../../utils/constants/app_colors.dart';
import '../home_screen.dart';
import 'astrology/astrology_main.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit(),
      child: const _NavigationScaffold(),
    );
  }
}

class _NavigationScaffold extends StatelessWidget {
  const _NavigationScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final getStorage = GetStorage();
    final isProfileComplete = getStorage.read('isProfile');

    final pages = [
      AstrologyMain(),
      CompatibilityMain(),
      HomeScreen(),
      KnowledgeMain(),
      ProfileMain(),
    ];

    return BlocBuilder<NavigationCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: searchColor,
          appBar: AppBar(
            toolbarHeight: 0,
            backgroundColor: searchColor,
          ),
          body: IndexedStack(
            index: currentIndex,
            children: pages,
          ),
          bottomNavigationBar: _BottomNavigation(currentIndex: currentIndex),
        );
      },
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  final int currentIndex;

  const _BottomNavigation({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: Container(
        height: 80,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF2B1555),
              Color(0xFF3F1864),
              Color(0xFF5F1C79),
            ],
            stops: [0, 0.04, 0.93],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          padding: const EdgeInsets.only(
              bottom: 20, top: 15, left: 15, right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF2B1555),
                Color(0xFF3F1864),
                Color(0xFF5F1C79),
              ],
              stops: [0, 0.44, 0.96],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _navItem(context, "assets/svg/moon_icon.svg", 0),
              _navItem(context, "assets/svg/love_icon.svg", 1),
              _centerNavItem(context, "assets/svg/fill_moon.svg", 2),
              _navItem(context, "assets/svg/book_icon.svg", 3),
              _navItem(context, "assets/svg/user_icon.svg", 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(BuildContext context, String asset, int index) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => context.read<NavigationCubit>().selectTab(index),
        child: Center(
          child: SvgPicture.asset(
            asset,
            width: 20,
            height: 20,
            color: currentIndex == index ? Colors.white : radiantRight,
          ),
        ),
      ),
    );
  }

  Widget _centerNavItem(BuildContext context, String asset, int index) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () => context.read<NavigationCubit>().selectTab(index),
        child: Center(
          child: Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF756DBB), width: 3),
              gradient: const LinearGradient(
                colors: [Color(0xFF6C1ADE), Color(0xFFCB0F90)],
              ),
            ),
            child: SvgPicture.asset(asset,color:Colors.white,width: 20,height: 20,),
          ),
        ),
      ),
    );
  }

}
