import 'package:flutter/material.dart';

import 'portfolio_repository.dart';
import '../models/project_model.dart';
import '../models/skill_model.dart';
import '../models/experience_model.dart';

class MockPortfolioRepository implements PortfolioRepository {
  @override
  Future<List<Project>> getProjects() async {
    await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay
    
    return [
      Project(
        id: '1',
        title: "E-Commerce App",
        description: "A complete shopping experience with product catalog, cart, payment integration, and order tracking.",
        imageUrl: "https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80",
        technologies: ["Flutter", "Firebase", "Stripe API"],
        projectUrl: "https://github.com/alexjohnson/ecommerce-app",
      ),
      Project(
        id: '2',
        title: "Fitness Tracker",
        description: "Track workouts, set goals, and monitor progress with detailed analytics and personalized recommendations.",
        imageUrl: "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80",
        technologies: ["Flutter", "Health APIs", "Charts"],
        projectUrl: "https://github.com/alexjohnson/fitness-tracker",
      ),
      Project(
        id: '3',
        title: "Weather App",
        description: "Beautiful weather application with location-based forecasts, interactive maps, and weather alerts.",
        imageUrl: "https://images.unsplash.com/photo-1504608524841-42fe6f032b5b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1465&q=80",
        technologies: ["Flutter", "OpenWeather API", "Animations"],
        projectUrl: "https://github.com/alexjohnson/weather-app",
      ),
    ];
  }

  @override
  Future<List<SkillCategory>> getSkills() async {
    await Future.delayed(Duration(milliseconds: 500));
    
    return [
      SkillCategory(
        id: '1',
        title: "Frontend Development",
        description: "Flutter, Dart, React, HTML5, CSS3, JavaScript, Responsive Design",
        icon: Icons.code,
        skills: [
          Skill(id: '1-1', title: "Flutter", description: "Cross-platform framework", icon: "flutter"),
          Skill(id: '1-2', title: "Dart", description: "Programming language", icon: "dart"),
        ],
      ),
      SkillCategory(
        id: '2',
        title: "Backend Development",
        description: "Node.js, Firebase, REST APIs, GraphQL, MongoDB, PostgreSQL",
        icon: Icons.storage,
        skills: [
          Skill(id: '2-1', title: "Firebase", description: "Backend as a service", icon: "firebase"),
          Skill(id: '2-2', title: "Node.js", description: "Runtime environment", icon: "nodejs"),
        ],
      ),
      SkillCategory(
        id: '3',
        title: "Mobile Development",
        description: "Flutter, Android, iOS, React Native, Kotlin, Swift",
        icon: Icons.phone_iphone,
        skills: [
          Skill(id: '3-1', title: "Android", description: "Mobile OS", icon: "android"),
          Skill(id: '3-2', title: "iOS", description: "Mobile OS", icon: "ios"),
        ],
      ),
      SkillCategory(
        id: '4',
        title: "UI/UX Design",
        description: "Figma, Adobe XD, Material Design, Prototyping, User Research",
        icon: Icons.design_services,
        skills: [
          Skill(id: '4-1', title: "Figma", description: "Design tool", icon: "figma"),
          Skill(id: '4-2', title: "Material Design", description: "Design system", icon: "material"),
        ],
      ),
    ];
  }

  @override
  Future<List<Experience>> getExperiences() async {
    await Future.delayed(Duration(milliseconds: 500));
    
    return [
      Experience(
        id: '1',
        title: "Senior Flutter Developer",
        company: "Google",
        period: "2020 - Present",
        description: "Working on Flutter framework and Dart language",
      ),
      Experience(
        id: '2',
        title: "Mobile App Developer",
        company: "Facebook",
        period: "2018 - 2020",
        description: "Developed cross-platform applications",
      ),
      Experience(
        id: '3',
        title: "Junior Developer",
        company: "Startup Inc.",
        period: "2016 - 2018",
        description: "Built mobile apps for various clients",
      ),
    ];
  }

  @override
  Future<List<Experience>> getEducation() async {
    await Future.delayed(Duration(milliseconds: 500));
    
    return [
      Experience(
        id: '1',
        title: "Master's in Computer Science",
        company: "Stanford University",
        period: "2016 - 2018",
        description: "Specialized in Mobile Application Development",
        isEducation: true,
      ),
      Experience(
        id: '2',
        title: "Bachelor's in Software Engineering",
        company: "MIT",
        period: "2012 - 2016",
        description: "Graduated with Honors",
        isEducation: true,
      ),
    ];
  }
}