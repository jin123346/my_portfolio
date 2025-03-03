// lib/widgets/skill_bar.dart
import 'package:flutter/material.dart';

import '../models/skill.dart';

// 기술 수준을 막대 그래프로 표시하는 위젯
class SkillBar extends StatelessWidget {
  final Skill skill;

  const SkillBar({
    Key? key,
    required this.skill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 기술 이름 및 수준
        Row(
          children: [
            // 기술 아이콘 (있는 경우)
            if (skill.iconPath != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.asset(
                  skill.iconPath!,
                  width: 24,
                  height: 24,
                  errorBuilder: (context, error, stackTrace) =>
                      SizedBox(width: 24, height: 24),
                ),
              ),
            // 기술 이름
            Text(
              skill.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Spacer(),
            // 수준 퍼센트
            Text(
              '${(skill.level * 100).toInt()}%',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(height: 8),
        // 수준 진행 막대
        Stack(
          children: [
            // 배경 막대
            Container(
              height: 8,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            // 기술 수준 막대
            FractionallySizedBox(
              widthFactor: skill.level,
              child: Container(
                height: 8,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
