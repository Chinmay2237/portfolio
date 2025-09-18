import 'package:flutter/material.dart';
import 'package:porfolio/presentation/view_models/theme_provider.dart';
import 'package:porfolio/presentation/widgets/about_section.dart';
import 'package:porfolio/presentation/widgets/contact_section.dart';
import 'package:porfolio/presentation/widgets/footer_section.dart';
import 'package:porfolio/presentation/widgets/project_section.dart';
import 'package:porfolio/presentation/widgets/resume_section.dart';
import 'package:porfolio/presentation/widgets/skill_section.dart';
import 'package:provider/provider.dart';
import '../view_models/scroll_view_model.dart';
import '../widgets/hero_section.dart';

class PortfolioHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scrollViewModel = Provider.of<ScrollViewModel>(context);

    return Scaffold(
      body: CustomScrollView(
        controller: scrollViewModel.scrollController,
        slivers: [
          const Header(),
          SliverToBoxAdapter(child: HeroSection()),
          SliverToBoxAdapter(child: AboutSection()),
          SliverToBoxAdapter(child: SkillsSection()),
          SliverToBoxAdapter(child: ProjectsSection()),
          SliverToBoxAdapter(child: ResumeSection()),
          SliverToBoxAdapter(child: ContactSection()),
          SliverToBoxAdapter(child: FooterSection()),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollViewModel = Provider.of<ScrollViewModel>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor.withAlpha(200),
      pinned: true,
      floating: true,
      snap: true,
      elevation: 0,
      title: Text(
        "Alex Johnson",
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      centerTitle: false,
      actions: _buildHeaderActions(context, scrollViewModel, themeProvider),
    );
  }

  List<Widget> _buildHeaderActions(
    BuildContext context,
    ScrollViewModel scrollViewModel,
    ThemeProvider themeProvider,
  ) {
    final sectionNames = ["About", "Skills", "Projects", "Resume", "Contact"];

    return [
      // Navigation Buttons (for desktop)
      if (MediaQuery.of(context).size.width > 800)
        ...sectionNames.asMap().entries.map((entry) {
          final index = entry.key;
          final name = entry.value;
          return TextButton(
            onPressed: () => scrollViewModel.scrollToSection(index),
            child: Text(
              name,
              style: TextStyle(
                color: scrollViewModel.currentIndex == index
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
          );
        }),

      // Theme Toggle Button
      IconButton(
        onPressed: () => themeProvider.toggleTheme(),
        icon: Icon(
          themeProvider.themeMode == ThemeMode.dark
              ? Icons.light_mode_rounded
              : Icons.dark_mode_rounded,
        ),
      ),
      const SizedBox(width: 10),
    ];
  }
}
