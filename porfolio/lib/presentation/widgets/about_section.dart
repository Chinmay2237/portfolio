import 'package:flutter/material.dart';
import 'package:porfolio/core/utils/responsive_utils.dart';

import 'fade_in_widget.dart';
import 'skill_card.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: isMobile ? 20 : 40,
      ),
      color: Colors.white,
      child: Column(
        children: [
          FadeInWidget(
            child: Text(
              "About Me",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 80,
            height: 4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF007AFF), Color(0xFF5856D6)],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(height: 40),
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAboutText(context),
                    SizedBox(height: 30),
                    _buildProfileImage(context),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildAboutText(context)),
                    SizedBox(width: 50),
                    Expanded(child: _buildProfileImage(context)),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildAboutText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello! I'm a passionate Flutter developer with 5+ years of expertise in building cross-platform applications. I love creating intuitive and beautiful user interfaces with smooth animations.",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 20),
        Text(
          "With a strong foundation in Dart programming and experience with various state management solutions, I develop robust and scalable applications that work seamlessly on both iOS and Android, as well as web and desktop platforms.",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 30),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: [
            SkillCard(
              icon: Icons.phone_iphone,
              text: "Flutter",
              description: '',
            ),
            SkillCard(icon: Icons.code, text: "Dart", description: ''),
            SkillCard(
              icon: Icons.web,
              text: "Responsive Design",
              description: '',
            ),
            SkillCard(icon: Icons.cloud, text: "Firebase", description: ''),
            SkillCard(
              icon: Icons.api,
              text: "API Integration",
              description: '',
            ),
            SkillCard(icon: Icons.storage, text: "Git", description: ''),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1471&q=80',
              ),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
        ),
        Positioned(
          top: 15,
          left: 15,
          right: -15,
          bottom: -15,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF007AFF), width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
