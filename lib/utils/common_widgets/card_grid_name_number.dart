import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class GradientCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String iconPath;

  const GradientCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: profileNameContainer,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colorBorderTwo,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Text(
                subTitle,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
              ),
            ],
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: 100, // prevent overflow
              child: Image.asset(
                iconPath,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
