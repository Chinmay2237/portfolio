import 'package:flutter/material.dart';
import 'package:porfolio/core/utils/responsive_utils.dart';
import 'package:provider/provider.dart';

import '../view_models/portfolio_view_model.dart';
import 'fade_in_widget.dart';
import 'skill_card.dart';

class SkillsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final portfolioViewModel = Provider.of<PortfolioViewModel>(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: isMobile ? 20 : 40,
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
              "My Skills",
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
                  children: portfolioViewModel.skills
                      .map(
                        (skillCategory) => SkillCard(
                          icon: skillCategory.icon,
                          text: skillCategory.title,
                          description: skillCategory.description,
                        ),
                      )
                      .toList(),
                ),
        ],
      ),
    );
  }
}