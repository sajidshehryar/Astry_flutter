import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class GradientLoadingButton extends StatelessWidget {
  final double height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final TextStyle? textStyle;
  final List<Color> gradientColors;

  const GradientLoadingButton({
    Key? key,
    this.height = 50,
    this.width,
    this.margin = const EdgeInsets.fromLTRB(5, 16, 5, 8),
    this.textStyle,
    this.gradientColors = const [radiantLeft, radiantRight], // Purple to Blue
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child:Container(
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
        child: SizedBox(
          height: 20,
            width: 20,
            child: CircularProgressIndicator(color: Colors.white,)),
      ),
    );
  }
}
