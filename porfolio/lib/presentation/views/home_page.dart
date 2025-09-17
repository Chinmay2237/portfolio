import 'package:flutter/material.dart';
import 'package:porfolio/presentation/widgets/about_section.dart';
import 'package:porfolio/presentation/widgets/contact_section.dart';
import 'package:porfolio/presentation/widgets/footer_section.dart';
import 'package:porfolio/presentation/widgets/project_section.dart';
import 'package:porfolio/presentation/widgets/resume_section.dart';
import 'package:porfolio/presentation/widgets/skill_section.dart';
import 'package:provider/provider.dart';
import '../view_models/scroll_view_model.dart';
import '../view_models/portfolio_view_model.dart';
import '../widgets/hero_section.dart';
import '../animations/laptop_animation.dart';

class PortfolioHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scrollViewModel = Provider.of<ScrollViewModel>(context);
    final portfolioViewModel = Provider.of<PortfolioViewModel>(context);
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),
      body: Stack(
        children: [
          CustomScrollView(
            controller: scrollViewModel.scrollController,
            slivers: [
              // Laptop Animation Section
              SliverToBoxAdapter(
                child: LaptopAnimationSection(),
              ),

              // Hero Section
              SliverAppBar(
                expandedHeight: isMobile
                    ? MediaQuery.of(context).size.height * 0.7
                    : MediaQuery.of(context).size.height * 0.8,
                backgroundColor: Color(0xFFF5F5F7),
                elevation: 0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: HeroSection(),
                  title: Text(
                    "Flutter Developer",
                    style: TextStyle(
                      color: Color(0xFF1D1D1F),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  centerTitle: true,
                ),
              ),

              // About Section
              SliverToBoxAdapter(child: AboutSection()),

              // Skills Section
              SliverToBoxAdapter(child: SkillsSection()),

              // Projects Section
              SliverToBoxAdapter(child: ProjectsSection()),

              // Resume Section
              SliverToBoxAdapter(child: ResumeSection()),

              // Contact Section
              SliverToBoxAdapter(child: ContactSection()),

              // Footer
              SliverToBoxAdapter(child: FooterSection()),
            ],
          ),

          // Back to Top Button
          if (scrollViewModel.showBackToTop)
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton(
                onPressed: () => scrollViewModel.scrollToTop(),
                backgroundColor: Color(0xFF007AFF),
                child: Icon(Icons.arrow_upward, color: Colors.white),
              ),
            ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: isMobile
          ? Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10.0)],
              ),
              child: BottomNavigationBar(
                currentIndex: scrollViewModel.currentIndex,
                onTap: (index) => scrollViewModel.scrollToSection(index),
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Color(0xFF007AFF),
                unselectedItemColor: Color(0xFF86868B),
                elevation: 0,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'About',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.code),
                    label: 'Skills',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.work),
                    label: 'Projects',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.description),
                    label: 'Resume',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.email),
                    label: 'Contact',
                  ),
                ],
              ),
            )
          : null,
    );
  }
}