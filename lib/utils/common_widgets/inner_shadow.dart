import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InnerShadowCircle extends StatelessWidget {
  final double size;
  final Widget child;

  const InnerShadowCircle({
    super.key,
    required this.size,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Image with circular clipping
          ClipOval(
            child: SizedBox(
              width: size,
              height: size,
              child: child,
            ),
          ),

          // Inner shadow simulated via radial gradient
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 0.9,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.4),
                ],
                stops: [0.6, 1.0],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
