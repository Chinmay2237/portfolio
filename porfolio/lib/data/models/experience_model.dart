class Experience {
  final String id;
  final String title;
  final String company;
  final String period;
  final String description;
  final bool isEducation;

  Experience({
    required this.id,
    required this.title,
    required this.company,
    required this.period,
    required this.description,
    this.isEducation = false,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      id: json['id'],
      title: json['title'],
      company: json['company'],
      period: json['period'],
      description: json['description'],
      isEducation: json['isEducation'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'company': company,
      'period': period,
      'description': description,
      'isEducation': isEducation,
    };
  }
}