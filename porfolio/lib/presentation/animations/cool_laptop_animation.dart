
import 'package:flutter/material.dart';

class CoolLaptopAnimation extends StatefulWidget {
  final ScrollController scrollController;
  const CoolLaptopAnimation({Key? key, required this.scrollController}) : super(key: key);

  @override
  _CoolLaptopAnimationState createState() => _CoolLaptopAnimationState();
}

class _CoolLaptopAnimationState extends State<CoolLaptopAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
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
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(_animation.value * -0.5),
          alignment: FractionalOffset.center,
          child: Container(
            width: 400,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey[800]!, width: 2),
            ),
            child: Center(
              child: Container(
                width: 380,
                height: 230,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Opacity(
                  opacity: _animation.value,
                  child: const Center(
                    child: Text(
                      'WebApp loading...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
