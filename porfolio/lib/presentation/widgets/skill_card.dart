import 'package:flutter/material.dart';

class SkillCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final String description;

  const SkillCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.description
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Color(0xFF007AFF), size: 20),
              SizedBox(width: 8),
              Text(text, style: TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
          Text(description, style: TextStyle(fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}