import 'package:flutter/material.dart';

class CustomGradientBtnImage extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final LinearGradient gradient;
  final EdgeInsetsGeometry textPadding;
  final String? imageAsset; // ⬅️ Optional image asset path
  final double imageSize;   // ⬅️ Control image size

  const CustomGradientBtnImage({
    super.key,
    required this.text,
    required this.onPressed,
    required this.gradient,
    this.textPadding = const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
    this.imageAsset,
    this.imageSize = 16,
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
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Padding(
          padding: textPadding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (imageAsset != null) ...[
                Image.asset(
                  imageAsset!,
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 6),
              ],
              Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
