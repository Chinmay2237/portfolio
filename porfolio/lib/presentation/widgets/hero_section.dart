import 'package:flutter/material.dart';
import 'package:porfolio/core/utils/responsive.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';
import '../view_models/scroll_view_model.dart';

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: HeroSectionMobile(),
      tablet: HeroSectionTablet(),
      desktop: HeroSectionDesktop(),
    );
  }
}

class HeroSectionMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scrollViewModel = Provider.of<ScrollViewModel>(context, listen: false);
    return Container(
      child: Stack(
        children: [
          Positioned.fill(child: ParticleBackground()),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Hi, I'm Alex Johnson",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 32,
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    "I build beautiful and high-performance apps with Flutter.",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => scrollViewModel.scrollToSection(2),
                  child: Text("View My Work"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HeroSectionTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scrollViewModel = Provider.of<ScrollViewModel>(context, listen: false);
    return Container(
      child: Stack(
        children: [
          Positioned.fill(child: ParticleBackground()),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 75,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Hi, I'm Alex Johnson",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 40,
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: Text(
                    "I build beautiful and high-performance apps with Flutter.",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => scrollViewModel.scrollToSection(2),
                  child: Text("View My Work"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HeroSectionDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scrollViewModel = Provider.of<ScrollViewModel>(context, listen: false);
    return Container(
      child: Stack(
        children: [
          Positioned.fill(child: ParticleBackground()),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 75,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
                  ),
                ),
                SizedBox(width: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, I'm Alex Johnson",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: 48,
                          ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "I build beautiful and high-performance apps with Flutter.",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () => scrollViewModel.scrollToSection(2),
                      child: Text("View My Work"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ParticleBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoopAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(seconds: 10),
      builder: (context, value, child) {
        return CustomPaint(
          painter: ParticlePainter(value),
        );
      },
    );
  }
}

class ParticlePainter extends CustomPainter {
  final double animationValue;

  ParticlePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.1);

    final particleCount = 100;

    for (int i = 0; i < particleCount; i++) {
      final x = (size.width * (i / particleCount) + animationValue * size.width) % size.width;
      final y = (size.height * (i / particleCount) + animationValue * size.height) % size.height;

      canvas.drawCircle(Offset(x, y), 1.0, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
