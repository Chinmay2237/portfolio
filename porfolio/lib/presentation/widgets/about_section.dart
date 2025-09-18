import 'package:flutter/material.dart';
import 'package:porfolio/core/utils/responsive.dart';

class AboutSection extends StatelessWidget {
  // A simple data structure for skills
  final List<Map<String, dynamic>> skills = [
    {'icon': Icons.phone_iphone, 'text': 'Flutter'},
    {'icon': Icons.code, 'text': 'Dart'},
    {'icon': Icons.web, 'text': 'Responsive Design'},
    {'icon': Icons.cloud_queue, 'text': 'Firebase'},
    {'icon': Icons.api, 'text': 'API Integration'},
    {'icon': Icons.storage, 'text': 'Git'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          // Section Title
          Text(
            "About Me",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 20),
          Container(
            width: 80,
            height: 4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 50),

          // Main content with responsive layout
          Responsive.isDesktop(context)
              ? _buildDesktopLayout(context)
              : _buildMobileLayout(context),
        ],
      ),
    );
  }

  // Layout for desktop screens
  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildAboutText(context)),
        const SizedBox(width: 50),
        Expanded(child: _buildProfileImageWithSkills(context)),
      ],
    );
  }

  // Layout for mobile and tablet screens
  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildProfileImageWithSkills(context),
        const SizedBox(height: 40),
        _buildAboutText(context),
      ],
    );
  }

  // The main text content about me
  Widget _buildAboutText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello! I'm a passionate Flutter developer with 5+ years of expertise in building cross-platform applications. I love creating intuitive and beautiful user interfaces with smooth animations.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 20),
        Text(
          "With a strong foundation in Dart programming and experience with various state management solutions, I develop robust and scalable applications that work seamlessly on both iOS and Android, as well as web and desktop platforms.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),
        ),
      ],
    );
  }

  // The profile image and skill cards
  Widget _buildProfileImageWithSkills(BuildContext context) {
    return Column(
      children: [
        // Profile Image
        Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: const DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
              ),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                blurRadius: 15,
                offset: const Offset(0, 10),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),

        // Skill Cards
        Wrap(
          spacing: 15,
          runSpacing: 15,
          alignment: WrapAlignment.center,
          children: skills.map((skill) {
            return Card(
              elevation: 3,
              shadowColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Icon(skill['icon'], color: Theme.of(context).colorScheme.primary, size: 30),
                    const SizedBox(height: 8),
                    Text(skill['text'], style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
