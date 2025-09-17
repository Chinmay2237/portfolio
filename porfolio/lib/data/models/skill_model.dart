import 'package:flutter/material.dart';

class Skill {
  final String id;
  final String title;
  final String description;
  final String icon;

  Skill({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
  });

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'icon': icon,
    };
  }
}

class SkillCategory {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final List<Skill> skills;

  SkillCategory({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.skills,
  });

  factory SkillCategory.fromJson(Map<String, dynamic> json) {
    return SkillCategory(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      icon: _getIconData(json['icon']),
      skills: List<Skill>.from(json['skills'].map((x) => Skill.fromJson(x))),
    );
  }

  static IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'code':
        return Icons.code;
      case 'storage':
        return Icons.storage;
      case 'phone_iphone':
        return Icons.phone_iphone;
      case 'design_services':
        return Icons.design_services;
      default:
        return Icons.code;
    }
  }
}