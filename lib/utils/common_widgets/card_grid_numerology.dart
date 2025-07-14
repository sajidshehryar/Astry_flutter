import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CardGridNumerology extends StatelessWidget {
  final String title;
  final String subTitle;
  final List<Color> gradientColors;

  const CardGridNumerology({
    super.key,
    required this.title,
    required this.subTitle,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: SweepGradient(
          center: Alignment(-0.1, -0.1),
          startAngle: 0.6,
          endAngle: 3.14 * 2.5,
          colors: [cardGradientOne, cardGradientTwo],
          stops: [0.0, 0.9],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:  TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Text(subTitle,  style:  TextStyle(
                   fontSize: 30,
                   fontWeight: FontWeight.w700,
                   fontFamily: 'Poppins',
                   color: Colors.white,
                 ),)
               ],
              ),
              // Container(
              //   width: 40,
              //   height: 40,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     color: Colors.black26,
              //   ),
              //   child: Image.asset('assets/icons/circular_purple_next_btn.png',
              //     width: 45,
              //     height: 45,
              //   ),
              // ),
            ]
        ),
      ),
    );
  }
}
