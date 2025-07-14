import 'package:flutter/material.dart';

class OverlappingAvatars extends StatelessWidget {
  const OverlappingAvatars({super.key});

  @override
  Widget build(BuildContext context) {
    const double avatarRadius = 30;
    const double overlapOffset = 20;

    return SizedBox(
      height: avatarRadius * 2,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: CircleAvatar(
              radius: avatarRadius,
              backgroundColor: Colors.purple.shade300,
              child: const Text(
                '+20K',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            left: overlapOffset,
            child: CircleAvatar(
              radius: avatarRadius,
              backgroundImage: AssetImage('assets/images/avatar1.jpg'),
            ),
          ),
          Positioned(
            left: overlapOffset * 2,
            child: CircleAvatar(
              radius: avatarRadius,
              backgroundImage: AssetImage('assets/images/avatar2.jpg'),
            ),
          ),
          Positioned(
            left: overlapOffset * 3,
            child: CircleAvatar(
              radius: avatarRadius,
              backgroundImage: AssetImage('assets/images/avatar3.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
