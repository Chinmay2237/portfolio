import 'package:flutter/material.dart';
import 'dart:math';

class CodeAnimatedBackground extends StatefulWidget {
  @override
  _CodeAnimatedBackgroundState createState() => _CodeAnimatedBackgroundState();
}

class _CodeAnimatedBackgroundState extends State<CodeAnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<CodeSnippet> codeSnippets = [];
  List<FloatingIcon> floatingIcons = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 20),
      vsync: this,
    )..repeat();

    // Generate code snippets
    for (int i = 0; i < 8; i++) {
      codeSnippets.add(
        CodeSnippet(
          left: Random().nextDouble() * 100,
          top: Random().nextDouble() * 100,
          delay: Random().nextDouble() * 20,
          duration: 20 + Random().nextDouble() * 10,
        ),
      );
    }

    // Generate floating icons
    for (int i = 0; i < 12; i++) {
      floatingIcons.add(
        FloatingIcon(
          icon: [
            Icons.code,
            Icons.phone_iphone,
            Icons.laptop_mac,
            Icons.android,
            Icons.desktop_windows,
            Icons.developer_board,
          ][Random().nextInt(6)],
          size: Random().nextDouble() * 30 + 20,
          left: Random().nextDouble() * 100,
          top: Random().nextDouble() * 100,
          delay: Random().nextDouble() * 15,
          duration: 15 + Random().nextDouble() * 10,
        ),
      );
    }
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
        return Stack(
          children: [
            // Code snippets in background
            ...codeSnippets.map((snippet) {
              final double animationValue =
                  (_controller.value * snippet.duration + snippet.delay) %
                      snippet.duration /
                      snippet.duration;

              return Positioned(
                left: snippet.left * MediaQuery.of(context).size.width / 100,
                top: snippet.top * MediaQuery.of(context).size.height / 100,
                child: Opacity(
                  opacity:
                      (sin(animationValue * 2 * pi) + 1) / 4, // Pulsing effect
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      "Widget build(BuildContext context) {\n  return Container();\n}",
                      style: TextStyle(
                        fontFamily: 'Monospace',
                        fontSize: 10,
                        color: Color(0xFF007AFF).withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),

            // Floating icons
            ...floatingIcons.map((icon) {
              final double animationValue =
                  (_controller.value * icon.duration + icon.delay) %
                      icon.duration /
                      icon.duration;

              double offsetX = 0;
              double offsetY = 0;
              double scale = 1;
              double opacity = 0.1;

              if (animationValue < 0.25) {
                final t = animationValue / 0.25;
                offsetX = 20 * t;
                offsetY = -30 * t;
                scale = 0.8 + 0.2 * t;
                opacity = 0.1 + 0.15 * t;
              } else if (animationValue < 0.5) {
                final t = (animationValue - 0.25) / 0.25;
                offsetX = 20 - 40 * t;
                offsetY = -30 + 10 * t;
                scale = 1.0 - 0.1 * t;
                opacity = 0.25 - 0.15 * t;
              } else if (animationValue < 0.75) {
                final t = (animationValue - 0.5) / 0.25;
                offsetX = -20 + 10 * t;
                offsetY = -20 - 20 * t;
                scale = 0.9 + 0.1 * t;
                opacity = 0.1 + 0.15 * t;
              } else {
                final t = (animationValue - 0.75) / 0.25;
                offsetX = -10 + 30 * t;
                offsetY = -40 + 70 * t;
                scale = 1.0 - 0.2 * t;
                opacity = 0.25 - 0.15 * t;
              }

              return Positioned(
                left:
                    icon.left * MediaQuery.of(context).size.width / 100 +
                    offsetX,
                top:
                    icon.top * MediaQuery.of(context).size.height / 100 +
                    offsetY,
                child: Transform.scale(
                  scale: scale,
                  child: Opacity(
                    opacity: opacity,
                    child: Icon(
                      icon.icon,
                      size: icon.size,
                      color: Color(0xFF007AFF),
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }
}

class CodeSnippet {
  final double left;
  final double top;
  final double delay;
  final double duration;

  CodeSnippet({
    required this.left,
    required this.top,
    required this.delay,
    required this.duration,
  });
}

class FloatingIcon {
  final IconData icon;
  final double size;
  final double left;
  final double top;
  final double delay;
  final double duration;

  FloatingIcon({
    required this.icon,
    required this.size,
    required this.left,
    required this.top,
    required this.delay,
    required this.duration,
  });
}