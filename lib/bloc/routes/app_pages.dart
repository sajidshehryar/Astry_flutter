import 'package:astro_talk/screens/auth/login_screen.dart';
import 'package:astro_talk/screens/auth/otp_verification_screen.dart';
import 'package:astro_talk/screens/auth/sign_in.dart';
import 'package:astro_talk/screens/auth/user_details_screen.dart';
import 'package:astro_talk/screens/auth/user_selection_screen.dart';
import 'package:astro_talk/screens/auth/user_tour_screen.dart';
import 'package:astro_talk/screens/home_screen.dart';
import 'package:astro_talk/screens/navigation_screens/astrology/astrology_four.dart';
import 'package:astro_talk/screens/navigation_screens/astrology/astrology_main.dart';
import 'package:astro_talk/screens/navigation_screens/astrology/astrology_one.dart';
import 'package:astro_talk/screens/navigation_screens/astrology/astrology_three.dart';
import 'package:astro_talk/screens/navigation_screens/astrology/astrology_two.dart';
import 'package:astro_talk/screens/navigation_screens/compatibility/compatibility_main.dart';
import 'package:astro_talk/screens/navigation_screens/knowledge/affirmation_screen.dart';
import 'package:astro_talk/screens/navigation_screens/knowledge/discussion_screen.dart';
import 'package:astro_talk/screens/navigation_screens/knowledge/knowledge_main.dart';
import 'package:astro_talk/screens/navigation_screens/profile/edit_profile.dart';
import 'package:astro_talk/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../screens/navigation_screens/custom_bottom_nav_bar.dart';

part 'app_routes.dart';

class AppPages {
  static List<GoRoute> routes = [
    GoRoute(
      name: Routes.splash,
      path: "/${Routes.splash}",
      builder: (context, state) => const SplashScreen(),
    ),

    GoRoute(
      name: Routes.selectUser,
      path: "/${Routes.selectUser}",
      builder: (context, state) {
        return UserSelectionScreen();
      },
    ),


    GoRoute(
      name: Routes.login,
      path: "/${Routes.login}",
      builder: (context, state) {
        String data = state.extra as String;
        return LoginScreen(role:data);
      },
      // builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: Routes.enterUserDetails,
      path: "/${Routes.enterUserDetails}",
      builder: (context, state) {
        String data = state.extra as String;
        return UserDetailsScreen(role:data);
      },

    ),
    GoRoute(
      name: Routes.verification,
      path: "/${Routes.verification}",
      builder: (context, state) {
        Map<String,dynamic> data = state.extra as Map<String,dynamic>;
        return OtpVerificationScreen(data:data);
      },
    ),
    GoRoute(
      name: Routes.signIn,
      path: "/${Routes.signIn}",
      builder: (context, state) {
        return SignIn();
      },
    ),
    GoRoute(
      name: Routes.astroPage,
      path: "/${Routes.astroPage}",
      builder: (context, state) {
        return AstrologyMain();
      },
    ),
    GoRoute(
      name: Routes.navigationPage,
      path: "/${Routes.navigationPage}",
      builder: (context, state) {
        return CustomBottomNavBar();
      },
    ),

    GoRoute(
      name: Routes.tourScreen,
      path: "/${Routes.tourScreen}",
      builder: (context, state) {
        return UserTourScreen();
      },
    ),
    GoRoute(
      name: Routes.guestHome,
      path: "/${Routes.guestHome}",
      builder: (context, state) {
        return HomeScreen();
      },
    ),
    GoRoute(
      name: Routes.compatibilityPage,
      path: "/${Routes.compatibilityPage}",
      builder: (context, state) {
        return CompatibilityMain();
      },
    ),
    GoRoute(
      name: Routes.knowledgeScreen,
      path: "/${Routes.knowledgeScreen}",
      builder: (context, state) {
        return KnowledgeMain();
      },
    ),
    GoRoute(
      name: Routes.astrologyOne,
      path: "/${Routes.astrologyOne}",
      builder: (context, state) {
        return AstrologyOne();
      },
    ),
    GoRoute(
      name: Routes.astrologyTwo,
      path: "/${Routes.astrologyTwo}",
      builder: (context, state) {
        return AstrologyTwo();
      },
    ),
    GoRoute(
      name: Routes.astrologyThree,
      path: "/${Routes.astrologyThree}",
      builder: (context, state) {
        return AstrologyThree();
      },
    ),
    GoRoute(
      name: Routes.editProfile,
      path: "/${Routes.editProfile}",
      builder: (context, state) {
        return EditProfile();
      },
    ),
    GoRoute(
      name: Routes.discussion,
      path: "/${Routes.discussion}",
      builder: (context, state) {
        return DiscussionScreen();
      },
    ),
    GoRoute(
      name: Routes.affirmation,
      path: "/${Routes.affirmation}",
      builder: (context, state) {
        return AffirmationScreen();
      },
    ),
    GoRoute(
      name: Routes.astrologyFour,
      path: "/${Routes.astrologyFour}",
      builder: (context, state) {
        return AstrologyFour();
      },
    ),


    // GoRoute(
    //   name: Routes.login,
    //   path: "/${Routes.login}",
    //   pageBuilder: (context, state) {
    //     return CustomTransitionPage(
    //       transitionDuration: const Duration(milliseconds: 650),
    //       child: LoginScreen(),
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //         return HolePageTransitionsBuilder().buildTransitions(
    //           MaterialPageRoute(
    //             builder: (context) =>
    //                 BlocProvider(
    //                   create: (_) => LoginBloc(),
    //                   child: Login(),
    //                 ),
    //           ),
    //           context,
    //           animation,
    //           secondaryAnimation,
    //           child,
    //         );
    //       },
    //     );
    //   },
    // ),


    // GoRoute(
    //     name: Routes.verification,
    //     path: "/${Routes.verification}",
    //     builder: (context, state) {
    //       return BlocProvider(
    //         create: (_) => VerificationBloc(),
    //         child: Verification(
    //           value: state.extra as Map<String, dynamic>,
    //         ),
    //       );
    //     }),

  ];


  static final GoRouter router = GoRouter(
    initialLocation: "/${Routes.splash}",
    routes: routes,
    errorBuilder: (context, state) => const ErrorScreen(),
  );

}
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Error Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go("/"),
          child: const Text("Go to home page"),
        ),
      ),
    );
  }
}



