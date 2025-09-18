import 'package:flutter/material.dart';
import 'package:porfolio/core/utils/responsive.dart';
import 'package:porfolio/presentation/animations/flutter_logo_animation.dart';
import 'package:provider/provider.dart';
import '../view_models/scroll_view_model.dart';

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scrollViewModel = Provider.of<ScrollViewModel>(context, listen: false);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // The new Flutter Logo Animation
          FlutterLogoAnimation(),
          const SizedBox(height: 40),

          // Title
          Text(
            "Hi, I'm Alex Johnson",
            style: Responsive.isMobile(context)
                ? Theme.of(context).textTheme.displayMedium
                : Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // Subtitle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "I build beautiful and high-performance apps with Flutter.",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),

          // Call to Action Button
          ElevatedButton(
            onPressed: () => scrollViewModel.scrollToSection(1), // Scroll to Projects
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            child: const Text("View My Work"),
          ),
        ],
      ),
    );
  }
}
