import 'package:astro_talk/utils/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnicornOutlineContainer extends StatelessWidget {
  final _GradientPainter _painter;
  final Widget _child;
  final double _radius;
  final Color backgroundColor;

  UnicornOutlineContainer({
    required double strokeWidth,
    required double radius,
    required Gradient gradient,
    required Widget child,
    this.backgroundColor = Colors.transparent,
  })  : _painter = _GradientPainter(strokeWidth: strokeWidth, radius: radius, gradient: gradient),
        _child = child,
        _radius = radius;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: InkWell(
        borderRadius: BorderRadius.circular(_radius),
        child: Padding(
          padding: EdgeInsets.all(_painter.strokeWidth),
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(_radius - _painter.strokeWidth),
            ),
            constraints: BoxConstraints(minWidth: 88, minHeight: 48),
            child: Center(child: _child),
          ),
        ),
      ),
    );
  }
}
class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;
  _GradientPainter({required double strokeWidth, required double radius, required Gradient gradient})
      : this.strokeWidth = strokeWidth,
        this.radius = radius,
        this.gradient = gradient;
  @override
  void paint(Canvas canvas, Size size) {
    Rect outerRect = Offset.zero & size;
    var outerRRect = RRect.fromRectAndRadius(outerRect, Radius.circular(radius));
    Rect innerRect = Rect.fromLTWH(strokeWidth, strokeWidth, size.width - strokeWidth * 3, size.height - strokeWidth * 2);
    var innerRRect = RRect.fromRectAndRadius(innerRect, Radius.circular(radius - strokeWidth));
    _paint.shader = gradient.createShader(outerRect);
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}