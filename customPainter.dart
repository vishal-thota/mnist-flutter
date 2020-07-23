import 'package:digitpaint/constants.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
class DrawingPainter extends CustomPainter {
List<Offset> offpoints;
DrawingPainter({@required this.offpoints});
  // DrawingPainter({@required this.offsetPoints});
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < offpoints.length - 1; i++) {
      if (offpoints[i] != null && offpoints[i + 1] != null) {
        canvas.drawLine(offpoints[i], offpoints[i + 1], screenpaint, );
      
      }
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => true;
}
