import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class RadicalGridCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String iconPath;
  final List<Color> gradientColors;


  const RadicalGridCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.gradientColors,
    required this.iconPath
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subTitle,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 40,
          right: -70,
          left: 0,
          child: Transform(
            transform: Matrix4.rotationZ(
             3.141/ 9,
         ),
            child: Image.asset(
              iconPath,
              width: 170,
              height: 140,
            ),
          ),
        ),
      ],
    );
  }
}
