import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:math' as math;

class FlutterLogoAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: PlayAnimationBuilder(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(seconds: 2),
        builder: (context, value, child) {
          return Transform.rotate(
            angle: value * 2 * math.pi,
            child: CustomPaint(
              painter: FlutterLogoPainter(value),
            ),
          );
        },
      ),
    );
  }
}

class FlutterLogoPainter extends CustomPainter {
  final double animationValue;

  FlutterLogoPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paint1 = Paint()
      ..color = Colors.blue.withOpacity(0.8)
      ..style = PaintingStyle.fill;

    final paint2 = Paint()
      ..color = Colors.lightBlueAccent.withOpacity(0.8)
      ..style = PaintingStyle.fill;

    // Draw the upper wing
    canvas.drawPath(
      Path()
        ..moveTo(center.dx - radius * 0.5, center.dy - radius * 0.8)
        ..lineTo(center.dx + radius * 0.5, center.dy - radius * 0.3)
        ..lineTo(center.dx + radius * 0.2, center.dy + radius * 0.2)
        ..close(),
      paint1,
    );

    // Draw the lower wing
    canvas.drawPath(
      Path()
        ..moveTo(center.dx - radius * 0.8, center.dy + radius * 0.2)
        ..lineTo(center.dx + radius * 0.2, center.dy + radius * 0.2)
        ..lineTo(center.dx - radius * 0.3, center.dy + radius * 0.7)
        ..close(),
      paint2,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
