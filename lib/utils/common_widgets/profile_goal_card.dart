import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../constants/app_colors.dart';

Widget ProfileGoalCard({required List<Color> gradientColors}) {
  return Container(
    padding: const EdgeInsets.only(left:15, right: 15, top: 5, bottom: 20),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: gradientColors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: profileButtonBorder,width: 1)
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircularPercentIndicator(
              radius: 30.0,
              lineWidth: 4,
              percent: 89 / 100,
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: Colors.transparent,
              linearGradient: const LinearGradient(
                colors: [Color(0xFF533EDA), Color(0xFF05DBFF)],
              ),
              center: Container(
                height: 52.97,
                width: 52.97,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0x3048848C),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "89%",
                      style:TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Current Goal",
                      style: TextStyle(
                        fontSize: 3,
                        color: Colors.white70,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Text(
              "Complete the daily goal to\nunlock the planet",
              style: TextStyle(
                fontSize: 10,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal:20,vertical: 4),
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(20),
                color: Colors.white
              ),
              child: Text('GO',style: TextStyle(
                fontWeight: FontWeight.w700,fontSize: 14,color: Color(0xFF020002),fontFamily: 'Poppins',
              ),),
            )
          ],
        ),

      ],
    ),
  );
}