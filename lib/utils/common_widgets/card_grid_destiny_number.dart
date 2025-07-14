import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CardGridDestinyNumber extends StatelessWidget {
  final String title;
  final String subTitle;
  final List<Color> gradientColors;


  const CardGridDestinyNumber({
    super.key,
    required this.title,
    required this.subTitle,
    required this.gradientColors
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
       gradient:  LinearGradient(
          colors: gradientColors,
         begin: Alignment.centerLeft,
         end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(title,  style:  TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(subTitle,  style:  TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),)
                ],
              ),
            ]
        ),
      ),
    );
  }
}
