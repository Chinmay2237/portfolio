import 'package:flutter/material.dart';
import 'package:porfolio/presentation/animations/fade_in_animation.dart';

class SkillsSection extends StatelessWidget {
  final List<Map<String, dynamic>> skills = [
    {'title': 'Flutter', 'level': 0.9},
    {'title': 'Dart', 'level': 0.85},
    {'title': 'Firebase', 'level': 0.75},
    {'title': 'UI/UX Design', 'level': 0.8},
    {'title': 'Provider', 'level': 0.88},
    {'title': 'Git', 'level': 0.82},
  ];

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
        child: Column(
          children: [
            Text(
              "Skills",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 50),
            Wrap(
              spacing: 40,
              runSpacing: 40,
              alignment: WrapAlignment.center,
              children: skills.map((skill) => _buildSkillCard(context, skill)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillCard(BuildContext context, Map<String, dynamic> skill) {
    return Container(
      width: 200,
      child: Column(
        children: [
          Text(
            skill['title'],
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: skill['level'],
            backgroundColor: Colors.grey[300],
            color: Theme.of(context).colorScheme.primary,
            minHeight: 8,
          ),
        ],
      ),
    );
  }
}
