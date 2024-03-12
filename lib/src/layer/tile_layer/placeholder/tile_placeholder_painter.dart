import 'package:flutter/material.dart';

///Draws a Rectangular grid lines on the tile
class TilePlaceholderPainter extends CustomPainter {
  const TilePlaceholderPainter({
    required this.color,
    required this.strokeWidth,
  });

  final Color color;
  final double strokeWidth;

  ///Drawing horizontal and vertical lines to create a grid where first and last lines are drawn with a thicker stroke.
  void _drawGrid(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    for (double i = 0; i <= size.width; i += size.width / 9) {
      if (i == 0 || i >= size.width) {
        canvas.drawLine(Offset(i, 0), Offset(i, size.height),
            paint..strokeWidth = strokeWidth + 2);
      } else {
        canvas.drawLine(Offset(i, 0), Offset(i, size.height),
            paint..strokeWidth = strokeWidth);
      }
    }
    for (double i = 0; i <= size.height; i += size.height / 9) {
      if (i == 0 || i >= size.height) {
        canvas.drawLine(Offset(0, i), Offset(size.width, i),
            paint..strokeWidth = strokeWidth + 2);
      } else {
        canvas.drawLine(Offset(0, i), Offset(size.width, i),
            paint..strokeWidth = strokeWidth);
      }
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    _drawGrid(canvas, size);
  }

  @override
  bool shouldRepaint(TilePlaceholderPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.strokeWidth != strokeWidth;
  }

  @override
  bool hitTest(Offset position) => false;
}
