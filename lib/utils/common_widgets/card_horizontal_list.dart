import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CardHorizontalList extends StatelessWidget {
  final String day;
  final String iconPath;
  final bool isLocked;

  const CardHorizontalList({
    super.key,
    required this.day,
    required this.iconPath,
    required this.isLocked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 82,
      height: 110,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isLocked ? Colors.transparent : Colors.black,
        border: Border.all(
          color: isLocked ? Color(0xFF9A82E2) : Colors.white24, // purple border when locked
          width: 2.5,
        ),
        borderRadius: BorderRadius.circular(22), // more rounded corners like your image
      ),
      child: Stack(
        alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Image.asset(
            iconPath,
            width: 46,
            height: 46,
          ),
          Text(
            day,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          )
        ],
        ),
        isLocked?SizedBox(height: 5,):Align(
          alignment: Alignment.topRight,
          child: Image.asset(
            'assets/icons/quickservice_moon.png',
            width: 12,
            height: 12,
          ),
        ),
      ],),
    );
  }
}
