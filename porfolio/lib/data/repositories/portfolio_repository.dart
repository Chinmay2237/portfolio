import '../models/project_model.dart';
import '../models/skill_model.dart';
import '../models/experience_model.dart';

abstract class PortfolioRepository {
  Future<List<Project>> getProjects();
  Future<List<SkillCategory>> getSkills();
  Future<List<Experience>> getExperiences();
  Future<List<Experience>> getEducation();
}