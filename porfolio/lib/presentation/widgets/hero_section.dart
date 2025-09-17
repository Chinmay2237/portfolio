import 'package:flutter/material.dart';
import 'package:porfolio/core/utils/responsive.dart';
import 'package:provider/provider.dart';
import '../view_models/scroll_view_model.dart';
import 'code_animation.dart';

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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF5F5F7), Colors.white],
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(child: CodeAnimatedBackground()),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xFF007AFF), width: 2.0),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
                      ),
                      fit: BoxFit.cover,
                    ),
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
                    "Senior Flutter Developer & Cross-Platform Expert",
                    style: TextStyle(
                      color: Color(0xFF86868B),
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 15,
                  runSpacing: 15,
                  children: [
                    ElevatedButton(
                      onPressed: () => scrollViewModel.scrollToSection(2),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFF007AFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 30,
                        ),
                      ),
                      child: Text(
                        "View My Work",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () => scrollViewModel.scrollToSection(5),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Color(0xFF007AFF),
                        side: BorderSide(color: Color(0xFF007AFF)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 30,
                        ),
                      ),
                      child: Text(
                        "Contact Me",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
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

class HeroSectionTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scrollViewModel = Provider.of<ScrollViewModel>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF5F5F7), Colors.white],
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(child: CodeAnimatedBackground()),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xFF007AFF), width: 2.0),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
                      ),
                      fit: BoxFit.cover,
                    ),
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
                    "Senior Flutter Developer & Cross-Platform Expert",
                    style: TextStyle(
                      color: Color(0xFF86868B),
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 15,
                  runSpacing: 15,
                  children: [
                    ElevatedButton(
                      onPressed: () => scrollViewModel.scrollToSection(2),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFF007AFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 30,
                        ),
                      ),
                      child: Text(
                        "View My Work",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () => scrollViewModel.scrollToSection(5),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Color(0xFF007AFF),
                        side: BorderSide(color: Color(0xFF007AFF)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 30,
                        ),
                      ),
                      child: Text(
                        "Contact Me",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
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

class HeroSectionDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scrollViewModel = Provider.of<ScrollViewModel>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF5F5F7), Colors.white],
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(child: CodeAnimatedBackground()),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xFF007AFF), width: 2.0),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
                      ),
                      fit: BoxFit.cover,
                    ),
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
                      "Senior Flutter Developer & Cross-Platform Expert",
                      style: TextStyle(
                        color: Color(0xFF86868B),
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 30),
                    Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      children: [
                        ElevatedButton(
                          onPressed: () => scrollViewModel.scrollToSection(2),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Color(0xFF007AFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 30,
                            ),
                          ),
                          child: Text(
                            "View My Work",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () => scrollViewModel.scrollToSection(5),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Color(0xFF007AFF),
                            side: BorderSide(color: Color(0xFF007AFF)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 30,
                            ),
                          ),
                          child: Text(
                            "Contact Me",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
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
