import 'dart:math';

import 'package:flutter/material.dart';
import 'package:friendly_faces/constants/constants.dart';
import 'package:get/get.dart';

class RotatingCircle extends StatefulWidget {
  const RotatingCircle({super.key});

  @override
  State<RotatingCircle> createState() => _RotatingCircleState();
}

class _RotatingCircleState extends State<RotatingCircle> {
  double _rotationAngle = 0.0;
  final constsnts = Get.put(Constants());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              _rotationAngle =
                  (_rotationAngle + details.delta.dx / 100) % (2 * pi);
              double degrees = _rotationAngle * 180 / pi;
              if (degrees > 335 || degrees < 15) {
                print("00000000000000000000000000 0");
              }

              if (degrees > 70 && degrees < 115) {
                print("00000000000000000000000000 1");
              }

              if (degrees > 160 && degrees < 200) {
                print("00000000000000000000000000 2");
              }
              if (degrees > 250 && degrees < 280) {
                print("00000000000000000000000000 3");
              }

              print("00000000000 Rotating $degrees");
            });
            // print("0000000000000000000010 $_rotationAngle");
          },
          child: Container(
            width: Get.width * 0.7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 0.8,
                colors: [
                  constsnts.centerLeftColor, // Darker color at center
                  constsnts
                      .centerRightColor, // Darker color atLighter color at edges
                ],
                stops: [0.2, 1.0],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(10),
            child: CustomPaint(
              painter: LinePainter(),
              child: Stack(
                children: [
                  Positioned(
                    top: Get.height / 2 - 20,
                    left: Get.width / 2 + 20,
                    right: 0,
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: Get.height / 2 - 20,
                    right: Get.width / 2 + 20,
                    left: 0,
                    child: const Icon(
                      Icons.star_border,
                      color: Colors.white,
                    ),
                  ),
                  const Positioned(
                    bottom: 270,
                    right: 0,
                    left: 0,
                    child:
                        Icon(Icons.thumb_up_alt_outlined, color: Colors.white),
                  ),
                  Positioned(
                    top: Get.height / 2 - 130,
                    right: 0,
                    left: 0,
                    child: const Icon(
                      Icons.thumb_down_alt_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Center(
                    child: Container(
                      width: Get.width * 0.40,
                      height: Get.width * 0.40,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.7),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: CustomPaint(
                        painter: MarkerPainter(_rotationAngle),
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Transform.rotate(
                            angle: _rotationAngle,
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MarkerPainter extends CustomPainter {
  final double angle;

  MarkerPainter(this.angle);

  @override
  void paint(Canvas canvas, Size size) {
    // double degrees = angle * 180 / pi;
    // print("0000000000000000000000 $degrees");
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0;

    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(angle);

    Path path = Path();
    path.moveTo(0, -size.width / 2 - 10);
    path.lineTo(-10, -size.width / 2 + 5);
    path.lineTo(10, -size.width / 2 + 5);
    path.close();

    canvas.drawPath(path, paint);

    final shader = const RadialGradient(
      colors: [
        Colors.white,
        // Colors.lightBlue.shade50,
        // Colors.lightBlue,
        Colors.black,
        Color.fromARGB(255, 4, 31, 72),
      ],
      stops: [0.0, 0.5, 1.0],
      center: Alignment.center,
      radius: 20,
    ).createShader(
        Rect.fromCircle(center: Offset.zero, radius: size.width / 2));
    Paint paint2 = Paint()..shader = shader;

    canvas.drawCircle(
      Offset(0, -size.width / 2 + 40),
      20,
      paint2,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    Paint linePaint = Paint()
      ..color = Colors.white.withOpacity(0.03)
      ..strokeWidth = 2.4;

    for (int i = 0; i < 48; i++) {
      double angle = pi / 24 * i;
      double startX = center.dx + radius * cos(angle);
      double startY = center.dy + radius * sin(angle);
      double endX = center.dx - radius * cos(angle);
      double endY = center.dy - radius * sin(angle);

      canvas.drawLine(
        Offset(startX, startY),
        Offset(endX, endY),
        linePaint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
