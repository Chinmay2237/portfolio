import 'package:flutter/material.dart';
import '../../data/repositories/portfolio_repository.dart';
import '../../data/models/project_model.dart';
import '../../data/models/skill_model.dart';
import '../../data/models/experience_model.dart';

class PortfolioViewModel with ChangeNotifier {
  final PortfolioRepository repository;

  PortfolioViewModel(this.repository) {
    loadData();
  }

  bool _isLoading = true;
  List<Project> _projects = [];
  List<SkillCategory> _skills = [];
  List<Experience> _experiences = [];
  List<Experience> _education = [];
  String _error = '';

  bool get isLoading => _isLoading;
  List<Project> get projects => _projects;
  List<SkillCategory> get skills => _skills;
  List<Experience> get experiences => _experiences;
  List<Experience> get education => _education;
  String get error => _error;

  Future<void> loadData() async {
    try {
      _isLoading = true;
      notifyListeners();

      final results = await Future.wait([
        repository.getProjects(),
        repository.getSkills(),
        repository.getExperiences(),
        repository.getEducation(),
      ]);

      _projects = results[0] as List<Project>;
      _skills = results[1] as List<SkillCategory>;
      _experiences = results[2] as List<Experience>;
      _education = results[3] as List<Experience>;
      _error = '';
    } catch (e) {
      _error = 'Failed to load data: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void refreshData() {
    loadData();
  }
}