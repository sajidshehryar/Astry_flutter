import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final LinearGradient gradient;
  final EdgeInsetsGeometry textPadding; // ⬅️ Text-specific padding

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.gradient,
    this.textPadding = const EdgeInsets.symmetric(horizontal:10, vertical: 14),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 4,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.zero, // ⬅️ Remove default padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Padding(
          padding: textPadding,
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:  TextStyle(
              fontSize: 10,
              fontWeight:FontWeight.w700,
              color: Colors.white,
              fontFamily: 'Poppins'
            ),
          ),
        ),
      ),
    );
  }
}
