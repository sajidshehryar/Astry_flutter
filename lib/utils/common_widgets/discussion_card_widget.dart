import 'package:flutter/material.dart';

import '../constants/app_assets.dart';
import '../constants/app_colors.dart';

class DiscussionCardWidget extends StatelessWidget {
  final String title;
  final List<Color> gradientColors;

  const DiscussionCardWidget({
    super.key,
    required this.title,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
          stops: const [0.1, 0.6, 0.9],
        ),
      ),

      child: Stack(
        children: [
          // Title
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(right: 80),
              child: Text(
                title,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),

          // Heart Icon
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              'assets/icons/white_heart.png',
              width: 20,
              height: 20,
            ),
          ),

          // Arrow Button (Bottom Left)
          Align(
            alignment: Alignment.bottomLeft,
            child:    Padding(
              padding: EdgeInsets.only(bottom:5),
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black26,
                ),
                child: Image.asset(
                  AppAssets.circularPurpleButton,
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ),

          // Overlapping Avatars (Bottom Right)
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: 40,
              child: Stack(
                children: [

                  Positioned(
                    right: 0,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/icons/discussion_third_image.png'),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/icons/discussion_two_image.png'),
                    ),
                  ),

                  Positioned(
                    right: 40,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/icons/discussion_one_image.png'),
                    ),
                  ),
                  Positioned(
                    right: 60,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: likeCircle,
                      child: const Text(
                        '+20K',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
