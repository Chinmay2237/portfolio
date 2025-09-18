import 'package:flutter/material.dart';
import 'dart:math' as math;

class RealisticLaptopAnimation extends StatefulWidget {
  final ScrollController scrollController;
  const RealisticLaptopAnimation({Key? key, required this.scrollController})
      : super(key: key);

  @override
  _RealisticLaptopAnimationState createState() =>
      _RealisticLaptopAnimationState();
}

class _RealisticLaptopAnimationState extends State<RealisticLaptopAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    widget.scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    double scrollOffset = widget.scrollController.offset;
    double normalizedOffset = (scrollOffset / 300).clamp(0.0, 1.0);
    _controller.value = normalizedOffset;
  }

  @override
  void dispose() {
    _controller.dispose();
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final screenAngle = -math.pi / 2 * (1 - _animation.value);
        return Center(
          child: Container(
            width: 300,
            height: 200,
            child: Stack(
              children: [
                // Laptop Base
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 10,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Color(0xFFd3d3d3),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                // Keyboard
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 8,
                    width: 280,
                    decoration: BoxDecoration(
                      color: Color(0xFFa9a9a9),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                // Laptop Lid
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(screenAngle),
                    child: Container(
                      height: 180,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Color(0xFFc0c0c0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Container(
                          height: 160,
                          width: 280,
                          color: Colors.black,
                          child: Opacity(
                            opacity: _animation.value,
                            child: _buildScreenContent(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildScreenContent() {
    return Center(
      child: Text(
        'Hello, World!',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontFamily: 'Courier',
        ),
      ),
    );
  }
}
