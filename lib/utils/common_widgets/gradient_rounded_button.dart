import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class GradientRoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final TextStyle? textStyle;
  final BoxDecoration? boxDecoration;
  final List<Color> gradientColors;
  final Widget? child;

  const GradientRoundedButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.height = 50,
    this.width,
    this.child,
    this.boxDecoration,
    this.margin = const EdgeInsets.fromLTRB(5, 16, 5, 8),
    this.textStyle,
    this.gradientColors = const [radiantLeft, radiantRight], // Purple to Blue
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:child?? Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: textStyle ??
              const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
        ),
      ),
    );
  }
}
