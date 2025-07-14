import 'dart:ui';

import 'package:astro_talk/screens/auth/login_screen.dart';
import 'package:astro_talk/screens/auth/user_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/routes/app_pages.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/get_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () async {
      if (mounted) {


        return Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(role: '',),
            transitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return HolePageTransitionsBuilder().buildTransitions(
                MaterialPageRoute(
                  builder: (context) =>LoginScreen(role: '',),
                ),
                context,
                animation,
                secondaryAnimation,
                child,
              );
            },
          ),
        );


        context.go("/${Routes.selectUser}");
        // if (SharedPreferenceHelper().getIsLoggedIn()) {
        //   context.go("/${Routes.selectUser}");
        // } else {
        //   context.go("/${Routes.selectUser}");
        // }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: searchColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 10),
          child: Image.asset(
            'assets/icons/splash_top.png',
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
class HolePageTransitionsBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return ClipPath(
      clipper: _HoleClipper(animation),
      child: child,
    );
  }
}

class _HoleClipper extends CustomClipper<Path> {
  _HoleClipper(this.animation);

  final Animation<double> animation;
  late final curve = CurvedAnimation(
    parent: animation,
    curve: Curves.easeOut,
    reverseCurve: Curves.easeIn,
  );

  @override
  Path getClip(Size size) {
    final rightBottom = size.bottomRight(Offset.zero);
    final radius = lerpDouble(0, rightBottom.distance, curve.value)!;
    final oval = Rect.fromCircle(center: rightBottom, radius: radius);
    return Path()..addOval(oval);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

