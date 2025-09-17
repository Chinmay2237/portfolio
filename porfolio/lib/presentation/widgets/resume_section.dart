import 'package:flutter/material.dart';
import 'package:porfolio/core/utils/responsive_utils.dart';
import 'package:porfolio/presentation/view_models/portfolio_view_model.dart';
import 'package:provider/provider.dart';

import 'fade_in_widget.dart';
import 'time_line_widget.dart';

class ResumeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final portfolioViewModel = Provider.of<PortfolioViewModel>(context);

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
              "My Resume",
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
          Container(
            width: double.infinity,
            constraints: BoxConstraints(maxWidth: 800),
            padding: EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: portfolioViewModel.isLoading
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Education & Experience",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1D1D1F),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Download resume functionality
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xFF007AFF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 15,
                              ),
                            ),
                            child: Text(
                              "Download CV",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      isMobile
                          ? Column(
                              children: [
                                _buildEducationTimeline(portfolioViewModel),
                                SizedBox(height: 40),
                                _buildExperienceTimeline(portfolioViewModel),
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: _buildEducationTimeline(portfolioViewModel)),
                                SizedBox(width: 40),
                                Expanded(
                                    child: _buildExperienceTimeline(portfolioViewModel)),
                              ],
                            ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationTimeline(PortfolioViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Education",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1D1D1F),
          ),
        ),
        SizedBox(height: 20),
        ...viewModel.education
            .map(
              (education) => TimelineItem(
                title: education.title,
                subtitle: education.company,
                period: education.period,
                description: education.description,
              ),
            )
            .toList(),
      ],
    );
  }

  Widget _buildExperienceTimeline(PortfolioViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Experience",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1D1D1F),
          ),
        ),
        SizedBox(height: 20),
        ...viewModel.experiences
            .map(
              (experience) => TimelineItem(
                title: experience.title,
                subtitle: experience.company,
                period: experience.period,
                description: experience.description,
              ),
            )
            .toList(),
      ],
    );
  }
}