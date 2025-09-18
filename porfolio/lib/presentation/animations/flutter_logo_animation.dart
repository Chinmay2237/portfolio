import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:math' as math;

class FlutterLogoAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlayAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(seconds: 3),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value, // The whole logo scales up
          child: Opacity(
            opacity: value, // The whole logo fades in
            child: Transform.rotate(
              angle: (1 - value) * -math.pi / 2, // Rotates in from the side
              child: CustomPaint(
                size: const Size(200, 200),
                painter: FlutterLogoPainter(),
              ),
            ),
          ),
        );
      },
    );
  }
}

class FlutterLogoPainter extends CustomPainter {
  // The painter is now static, the animation is handled by the widget tree.
  // This is a cleaner approach.
  FlutterLogoPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paint1 = Paint()
      ..color = const Color(0xFF0D47A1) // Dark blue
      ..style = PaintingStyle.fill;

    final paint2 = Paint()
      ..color = const Color(0xFF42A5F5) // Light blue
      ..style = PaintingStyle.fill;

    // Upper wing of the Flutter logo
    final path1 = Path()
      ..moveTo(center.dx - radius * 0.5, center.dy - radius * 0.8)
      ..lineTo(center.dx + radius * 0.5, center.dy - radius * 0.3)
      ..lineTo(center.dx + radius * 0.2, center.dy + radius * 0.2)
      ..lineTo(center.dx - radius * 0.5, center.dy - radius * 0.2)
      ..close();

    // Lower wing of the Flutter logo
    final path2 = Path()
      ..moveTo(center.dx - radius * 0.8, center.dy + radius * 0.2)
      ..lineTo(center.dx + radius * 0.2, center.dy + radius * 0.2)
      ..lineTo(center.dx - radius * 0.3, center.dy + radius * 0.7)
      ..close();

    canvas.drawPath(path1, paint1);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false; // No need to repaint, it's static
}
