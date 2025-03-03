// lib/models/skill.dart
// 기술 정보를 담는 모델 클래스
class Skill {
  final String name;
  final double level; // 0.0 ~ 1.0 범위의 숙련도
  final String? iconPath;

  Skill({
    required this.name,
    required this.level,
    this.iconPath,
  });
}
