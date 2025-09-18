import 'package:flutter/material.dart';
import 'package:porfolio/core/utils/responsive.dart';
import 'package:porfolio/presentation/animations/flutter_logo_animation.dart';
import 'package:porfolio/presentation/view_models/theme_provider.dart';
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

class PortfolioHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scrollViewModel = Provider.of<ScrollViewModel>(context);
    final portfolioViewModel = Provider.of<PortfolioViewModel>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: scrollViewModel.scrollController,
            slivers: [
              // Flutter Logo Animation Section
              SliverToBoxAdapter(
                child: FlutterLogoAnimation(),
              ),

              // Hero Section
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height * 0.8,
                elevation: 0,
                floating: false,
                pinned: true,
                actions: [
                  TextButton(onPressed: () => scrollViewModel.scrollToSection(0), child: Text("About")),
                  TextButton(onPressed: () => scrollViewModel.scrollToSection(2), child: Text("Projects")),
                  TextButton(onPressed: () => scrollViewModel.scrollToSection(4), child: Text("Contact")),
                  Consumer<ThemeProvider>(
                    builder: (context, themeProvider, child) {
                      return IconButton(
                        icon: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (Widget child, Animation<double> animation) {
                            return RotationTransition(turns: animation, child: child);
                          },
                          child: themeProvider.themeMode == ThemeMode.light
                              ? const Icon(Icons.dark_mode, key: ValueKey('dark'))
                              : const Icon(Icons.light_mode, key: ValueKey('light')),                            
                        ),
                        onPressed: () {
                          themeProvider.toggleTheme();
                        },
                      );
                    },
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: HeroSection(),
                  title: Text(
                    "Flutter Developer",
                    style: TextStyle(
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
                child: Icon(Icons.arrow_upward, color: Colors.white),
              ),
            ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Responsive.isMobile(context)
          ? Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10.0)],
              ),
              child: BottomNavigationBar(
                currentIndex: scrollViewModel.currentIndex,
                onTap: (index) => scrollViewModel.scrollToSection(index),
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Theme.of(context).primaryColor,
                unselectedItemColor: Theme.of(context).textTheme.bodyLarge?.color,
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
