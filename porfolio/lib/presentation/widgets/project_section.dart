import 'package:flutter/material.dart';
import 'package:porfolio/core/utils/responsive.dart';
import 'package:provider/provider.dart';

import '../view_models/portfolio_view_model.dart';
import 'fade_in_widget.dart';
import 'project_card.dart';

class ProjectsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: ProjectsSectionMobile(),
      tablet: ProjectsSectionTablet(),
      desktop: ProjectsSectionDesktop(),
    );
  }
}

class ProjectsSectionMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final portfolioViewModel = Provider.of<PortfolioViewModel>(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF8F9FA), Color(0xFFE9ECEF)],
        ),
      ),
      child: Column(
        children: [
          FadeInWidget(
            child: Text(
              "Featured Projects",
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
          SizedBox(height: 60),
          portfolioViewModel.isLoading
              ? Center(child: CircularProgressIndicator())
              : Wrap(
                  spacing: 30,
                  runSpacing: 30,
                  children: portfolioViewModel.projects
                      .map(
                        (project) => ProjectCard(
                          title: project.title,
                          description: project.description,
                          imageUrl: project.imageUrl,
                          technologies: project.technologies,
                        ),
                      )
                      .toList(),
                ),
        ],
      ),
    );
  }
}

class ProjectsSectionTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final portfolioViewModel = Provider.of<PortfolioViewModel>(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: 40,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF8F9FA), Color(0xFFE9ECEF)],
        ),
      ),
      child: Column(
        children: [
          FadeInWidget(
            child: Text(
              "Featured Projects",
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
          SizedBox(height: 60),
          portfolioViewModel.isLoading
              ? Center(child: CircularProgressIndicator())
              : Wrap(
                  spacing: 30,
                  runSpacing: 30,
                  children: portfolioViewModel.projects
                      .map(
                        (project) => ProjectCard(
                          title: project.title,
                          description: project.description,
                          imageUrl: project.imageUrl,
                          technologies: project.technologies,
                        ),
                      )
                      .toList(),
                ),
        ],
      ),
    );
  }
}

class ProjectsSectionDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final portfolioViewModel = Provider.of<PortfolioViewModel>(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: 40,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF8F9FA), Color(0xFFE9ECEF)],
        ),
      ),
      child: Column(
        children: [
          FadeInWidget(
            child: Text(
              "Featured Projects",
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
          SizedBox(height: 60),
          portfolioViewModel.isLoading
              ? Center(child: CircularProgressIndicator())
              : ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 1200),
                  child: Wrap(
                    spacing: 40,
                    runSpacing: 40,
                    alignment: WrapAlignment.center,
                    children: portfolioViewModel.projects
                        .map(
                          (project) => ProjectCard(
                            title: project.title,
                            description: project.description,
                            imageUrl: project.imageUrl,
                            technologies: project.technologies,
                          ),
                        )
                        .toList(),
                  ),
                ),
        ],
      ),
    );
  }
}
