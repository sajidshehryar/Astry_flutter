import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildGoalCard({required List<Color> gradientColors}) {
  double progress = 3 / 5;
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 25),
    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: gradientColors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(35),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                "Goal 1",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Color(0xFFF1616A),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '3/5',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Text(
          "Take a compatibility test with 5 people",
          style: TextStyle(
            fontSize: 10,
            color: Colors.white.withOpacity(0.9),
          ),
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFD14DC4)),
            minHeight: 6,
          ),
        ),
      ],
    ),
  );
}