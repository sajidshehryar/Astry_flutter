import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final List<Color> gradientColors;

  const GradientCard({
    super.key,
    required this.title,
    required this.iconPath,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:  TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                iconPath,
                width: 70,
                height: 92,
                fit: BoxFit.fill,
              ),
              Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black26,
                ),
                child: Image.asset('assets/icons/circular_purple_next_btn.png',
                  width: 45,
                  height: 45,
                ),
              ),
            ],
          ),
        ]
      ),
    );
  }
}
