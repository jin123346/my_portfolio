// lib/screens/skills_screen.dart
import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/skill_category.dart';

import '../models/skill.dart';
import '../widgets/custom_app_bar.dart';

// 기술 스택을 보여주는 화면
class SkillsScreen extends StatefulWidget {
  @override
  _SkillsScreenState createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  // 기술 카테고리 목록
  final List<Map<String, dynamic>> skillCategories = [
    {
      'title': '프론트엔드',
      'skills': [
        Skill(
            name: 'Flutter', level: 0.85, iconPath: 'assets/icons/flutter.png'),
        Skill(name: 'Dart', level: 0.80, iconPath: 'assets/icons/dart.png'),
        Skill(name: 'React', level: 0.70, iconPath: 'assets/icons/react.png'),
        Skill(
            name: 'HTML/CSS',
            level: 0.90,
            iconPath: 'assets/icons/html_css.png'),
        Skill(
            name: 'JavaScript',
            level: 0.75,
            iconPath: 'assets/icons/javascript.png'),
      ],
    },
    {
      'title': '백엔드',
      'skills': [
        Skill(
            name: 'Spring Boot',
            level: 0.75,
            iconPath: 'assets/icons/spring.png'),
        Skill(name: 'Java', level: 0.80, iconPath: 'assets/icons/java.png'),
        Skill(
            name: 'Node.js', level: 0.65, iconPath: 'assets/icons/nodejs.png'),
        Skill(
            name: 'Express', level: 0.60, iconPath: 'assets/icons/express.png'),
      ],
    },
    {
      'title': '데이터베이스',
      'skills': [
        Skill(name: 'MySQL', level: 0.80, iconPath: 'assets/icons/mysql.png'),
        Skill(
            name: 'MongoDB', level: 0.70, iconPath: 'assets/icons/mongodb.png'),
        Skill(
            name: 'Firebase',
            level: 0.65,
            iconPath: 'assets/icons/firebase.png'),
      ],
    },
    {
      'title': '개발 도구',
      'skills': [
        Skill(name: 'Git', level: 0.85, iconPath: 'assets/icons/git.png'),
        Skill(name: 'Docker', level: 0.60, iconPath: 'assets/icons/docker.png'),
        Skill(
            name: 'Android Studio',
            level: 0.75,
            iconPath: 'assets/icons/android_studio.png'),
        Skill(
            name: 'VS Code', level: 0.90, iconPath: 'assets/icons/vscode.png'),
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '기술 스택'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '나의 기술 스택',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 8),
            Text(
              '현재 능숙하게 다룰 수 있는 기술들과 앞으로 발전시켜 나갈 기술들입니다.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 24),
            // 기술 카테고리 목록 표시
            ...skillCategories.map((category) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: SkillCategory(
                  title: category['title'],
                  skills: category['skills'],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
