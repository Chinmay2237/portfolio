import 'package:flutter/material.dart';
import 'package:porfolio/core/utils/responsive.dart';

import 'social_icon.dart';

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: FooterSectionMobile(),
      tablet: FooterSectionTablet(),
      desktop: FooterSectionDesktop(),
    );
  }
}

class FooterSectionMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1D1D1F),
      padding: EdgeInsets.symmetric(
        vertical: 70,
        horizontal: 20,
      ),
      child: Column(
        children: [
          Text(
            "FlutterDev",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Crafting beautiful cross-platform experiences with Flutter. Let's build something amazing together.",
            style: TextStyle(color: Color(0xFF86868B), height: 1.8),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialIcon(
                icon: Icons.email,
                url: "mailto:alex.johnson@example.com",
              ),
              SocialIcon(
                icon: Icons.code,
                url: "https://github.com/alexjohnson",
              ),
              SocialIcon(
                icon: Icons.work,
                url: "https://linkedin.com/in/alexjohnson",
              ),
              SocialIcon(
                icon: Icons.chat,
                url: "https://twitter.com/alexjohnson",
              ),
            ],
          ),
          SizedBox(height: 50),
          Text(
            "© ${DateTime.now().year} Alex Johnson. All rights reserved.",
            style: TextStyle(color: Color(0xFF86868B)),
          ),
        ],
      ),
    );
  }
}

class FooterSectionTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1D1D1F),
      padding: EdgeInsets.symmetric(
        vertical: 70,
        horizontal: 40,
      ),
      child: Column(
        children: [
          Text(
            "FlutterDev",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Crafting beautiful cross-platform experiences with Flutter. Let's build something amazing together.",
            style: TextStyle(color: Color(0xFF86868B), height: 1.8),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialIcon(
                icon: Icons.email,
                url: "mailto:alex.johnson@example.com",
              ),
              SocialIcon(
                icon: Icons.code,
                url: "https://github.com/alexjohnson",
              ),
              SocialIcon(
                icon: Icons.work,
                url: "https://linkedin.com/in/alexjohnson",
              ),
              SocialIcon(
                icon: Icons.chat,
                url: "https://twitter.com/alexjohnson",
              ),
            ],
          ),
          SizedBox(height: 50),
          Text(
            "© ${DateTime.now().year} Alex Johnson. All rights reserved.",
            style: TextStyle(color: Color(0xFF86868B)),
          ),
        ],
      ),
    );
  }
}

class FooterSectionDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1D1D1F),
      padding: EdgeInsets.symmetric(
        vertical: 70,
        horizontal: 40,
      ),
      child: Column(
        children: [
          Text(
            "FlutterDev",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Crafting beautiful cross-platform experiences with Flutter. Let's build something amazing together.",
            style: TextStyle(color: Color(0xFF86868B), height: 1.8),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialIcon(
                icon: Icons.email,
                url: "mailto:alex.johnson@example.com",
              ),
              SocialIcon(
                icon: Icons.code,
                url: "https://github.com/alexjohnson",
              ),
              SocialIcon(
                icon: Icons.work,
                url: "https://linkedin.com/in/alexjohnson",
              ),
              SocialIcon(
                icon: Icons.chat,
                url: "https://twitter.com/alexjohnson",
              ),
            ],
          ),
          SizedBox(height: 50),
          Text(
            "© ${DateTime.now().year} Alex Johnson. All rights reserved.",
            style: TextStyle(color: Color(0xFF86868B)),
          ),
        ],
      ),
    );
  }
}
