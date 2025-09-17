import 'package:flutter/material.dart';

class ScrollViewModel with ChangeNotifier {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;
  bool _showBackToTop = false;

  ScrollController get scrollController => _scrollController;
  int get currentIndex => _currentIndex;
  bool get showBackToTop => _showBackToTop;

  ScrollViewModel() {
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    // Show/hide back to top button based on scroll position
    if (_scrollController.offset > 400 && !_showBackToTop) {
      _showBackToTop = true;
      notifyListeners();
    } else if (_scrollController.offset <= 400 && _showBackToTop) {
      _showBackToTop = false;
      notifyListeners();
    }
  }

  void scrollToSection(int index) {
    _currentIndex = index;
    notifyListeners();

    final sectionPositions = [
      0.0,
      800.0,
      1600.0,
      2400.0,
      3200.0,
      4000.0,
    ];
    
    if (index < sectionPositions.length) {
      _scrollController.animateTo(
        sectionPositions[index],
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  void scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}