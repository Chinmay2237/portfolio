import 'package:flutter/material.dart';
import 'package:porfolio/core/utils/responsive.dart';
import 'package:porfolio/presentation/view_models/portfolio_view_model.dart';
import 'package:provider/provider.dart';

class ResumeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final portfolioViewModel = Provider.of<PortfolioViewModel>(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          // Section Title
          Text(
            "My Resume",
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
          const SizedBox(height: 60),

          // Main Content
          Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 1000),
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: portfolioViewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      // Header with Download Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Education & Experience",
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.download_rounded),
                            label: const Text("Download CV"),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Theme.of(context).colorScheme.onPrimary,
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),

                      // Timeline for Education and Experience
                      Responsive.isDesktop(context)
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: _buildTimeline(context, "Education", portfolioViewModel.education)),
                                const SizedBox(width: 50),
                                Expanded(child: _buildTimeline(context, "Experience", portfolioViewModel.experiences)),
                              ],
                            )
                          : Column(
                              children: [
                                _buildTimeline(context, "Education", portfolioViewModel.education),
                                const SizedBox(height: 40),
                                _buildTimeline(context, "Experience", portfolioViewModel.experiences),
                              ],
                            ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  // Builds a timeline for a given title and list of items
  Widget _buildTimeline(BuildContext context, String title, List<dynamic> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 30),
        ...items.map((item) => TimelineItem(item: item)).toList(),
      ],
    );
  }
}

// A single item in the timeline
class TimelineItem extends StatelessWidget {
  final dynamic item;

  const TimelineItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline Dot
          Container(
            margin: const EdgeInsets.only(top: 5),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary,
              border: Border.all(
                color: Theme.of(context).scaffoldBackgroundColor,
                width: 3,
              ),
            ),
          ),
          const SizedBox(width: 20),

          // Timeline Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  item.company,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  item.period,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  item.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
