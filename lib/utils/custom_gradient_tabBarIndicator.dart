import 'dart:ui';

import 'package:flutter/material.dart';

class CustomGradientTabIndicator extends Decoration {
  final Gradient gradient;
  final double strokeWidth;
  final double indicatorWidth; 
  final double bottomPadding;

  CustomGradientTabIndicator({
    required this.gradient,
    this.strokeWidth = 2,
    this.indicatorWidth = 0.6,
    this.bottomPadding = 8,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _GradientPainter(this, onChanged);
  }
}

class _GradientPainter extends BoxPainter {
  final CustomGradientTabIndicator decoration;

  _GradientPainter(this.decoration, VoidCallback? onChanged) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()
      ..shader = decoration.gradient.createShader(Rect.fromLTWH(
        offset.dx,
        offset.dy,
        configuration.size!.width,
        configuration.size!.height,
      ))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = decoration.strokeWidth;

    final double indicatorLength = configuration.size!.width * decoration.indicatorWidth;
    final double startX = offset.dx + (configuration.size!.width - indicatorLength) / 2;
    final double endX = startX + indicatorLength;
    final double y = offset.dy + configuration.size!.height - decoration.bottomPadding;

    canvas.drawLine(Offset(startX, y), Offset(endX, y), paint);
  }
}
