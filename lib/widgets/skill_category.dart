// lib/widgets/skill_category.dart
import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/skill_bar.dart';

import '../models/skill.dart';

// 기술 카테고리를 표시하는 위젯
class SkillCategory extends StatelessWidget {
  final String title;
  final List<Skill> skills;

  const SkillCategory({
    Key? key,
    required this.title,
    required this.skills,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 카테고리 제목
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: 12),
        // 기술 목록
        ...skills.map((skill) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: SkillBar(skill: skill),
          );
        }).toList(),
      ],
    );
  }
}
