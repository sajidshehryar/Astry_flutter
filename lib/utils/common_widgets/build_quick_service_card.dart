import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildQuickServiceCard({
  required String backgroundImage,
  required String iconImage,
  required String title,
}) {
  return Column(
    children: [
      Stack(
        alignment: Alignment.center,
        children: [
          Container(
              height: 100,
              padding: EdgeInsets.only(top: 30),
              child: Image.asset(backgroundImage)
          ),
          Positioned(
              bottom: 10,
              width: 80,
              child: Image.asset(iconImage, width: 80, height: 100,))
        ],
      ),
      Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    ],
  );
}
