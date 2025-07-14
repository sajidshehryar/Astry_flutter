import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

Widget customTab({required IconData icon, required String label}) {
  return Container(
    width: 65, // optional: adjust or remove for vertical use
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: textBottom,
          width: 1.0,
        ),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 5),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}
