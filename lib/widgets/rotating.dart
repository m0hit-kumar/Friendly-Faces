import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleOutlineWidget extends StatelessWidget {
  const CircleOutlineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 2,
      height: Get.width / 2,
      child: CustomPaint(
        painter: _CircleOutlinePainter(),
      ),
    );
  }
}

class _CircleOutlinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = (size.width - 20) / 2;

    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      Offset(centerX, centerY),
      radius,
      paint,
    );
  }

  @override
  bool shouldRepaint(_CircleOutlinePainter oldDelegate) => false;
}
