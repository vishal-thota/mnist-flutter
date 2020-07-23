import 'package:flutter/material.dart';

const int kModelInputSize = 28;
const double kCanvasInnerOffset = 40.0;
const double kCanvasSize = 200.0;
const double kStrokeWidth = 12.0;
const Color kBlackBrushColor = Colors.black;
const bool kIsAntiAlias = true;
const Color kBrushBlack = Colors.black;
const Color kBrushWhite = Colors.white;

final boxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final Paint vcanpaint = Paint()
  ..strokeCap = StrokeCap.square
  ..isAntiAlias = kIsAntiAlias
  ..color = kBrushWhite
  ..strokeWidth = kStrokeWidth;
final Paint screenpaint = Paint()
  ..strokeCap = StrokeCap.square
  ..isAntiAlias = true
  ..color = Colors.black
  ..strokeWidth = 12.0;
  double canvassize = 200.0;

  
final blackback = Paint()..color = kBrushBlack;