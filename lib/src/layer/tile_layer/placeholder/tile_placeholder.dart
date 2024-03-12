import 'package:flutter/material.dart';

import 'tile_placeholder_painter.dart';

///A placeholder that draws a faint grid on the tiles that are loading tile images. 
///It helps with indication of the tile loading process.
class TilePlaceholder extends StatelessWidget {
  const TilePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const LimitedBox(
      maxWidth: 400,
      maxHeight: 400,
      child: CustomPaint(
        size: Size.infinite,
        painter: TilePlaceholderPainter(
          color: Colors.white,
          strokeWidth: 1,
        ),
      ),
    );
  }
}
