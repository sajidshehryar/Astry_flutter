import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_assets.dart';

class CustomListProfile extends StatelessWidget {
  final String title;

  const CustomListProfile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      height:71,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color:  Color(0xFF2C0C5D),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
                fontSize: 14,
              ),
            ),
          ),
          Image.asset(AppAssets.circularPurpleButton,width: 40,height: 40,)
        ],
      ),
    );
  }
}
