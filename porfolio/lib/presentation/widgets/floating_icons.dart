import 'package:flutter/material.dart';
import 'dart:math';

class FloatingIcons extends StatefulWidget {
  @override
  _FloatingIconsState createState() => _FloatingIconsState();
}

class _FloatingIconsState extends State<FloatingIcons>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<IconData> _icons = [
    Icons.code,
    Icons.storage,
    Icons.developer_mode,
    Icons.data_object,
    Icons.cloud,
    Icons.terminal,
    Icons.bug_report,
  ];
  late List<_IconModel> _iconModels;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    _iconModels = List.generate(20, (index) {
      final random = Random();
      return _IconModel(
        icon: _icons[random.nextInt(_icons.length)],
        x: random.nextDouble(),
        y: random.nextDouble(),
        size: random.nextDouble() * 20 + 10,
        speed: random.nextDouble() * 0.2 + 0.1,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _FloatingIconsPainter(
            iconModels: _iconModels,
            animationValue: _controller.value,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          ),
          child: Container(),
        );
      },
    );
  }
}

class _FloatingIconsPainter extends CustomPainter {
  final List<_IconModel> iconModels;
  final double animationValue;
  final Color color;

  _FloatingIconsPainter({
    required this.iconModels,
    required this.animationValue,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (var model in iconModels) {
      final y = (model.y * size.height -
              animationValue * size.height * model.speed) %
          size.height;
      final x = model.x * size.width;

      final textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(
          text: String.fromCharCode(model.icon.codePoint),
          style: TextStyle(
            color: color,
            fontSize: model.size,
            fontFamily: model.icon.fontFamily,
          ),
        ),
      );

      textPainter.layout();
      textPainter.paint(canvas, Offset(x, y));
    }
  }

  @override
  bool shouldRepaint(covariant _FloatingIconsPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}

class _IconModel {
  IconData icon;
  double x;
  double y;
  double size;
  double speed;

  _IconModel({
    required this.icon,
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
  });
}
