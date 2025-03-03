// lib/widgets/menu_button.dart
import 'package:flutter/material.dart';

// 포트폴리오 앱의 메뉴 버튼 위젯
class MenuButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? foregroundColor;

  // 생성자: 메뉴 버튼 설정
  const MenuButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 배경색 설정 (기본값: 테마의 primaryColor 투명도 적용)
    final bgColor =
        backgroundColor ?? Theme.of(context).primaryColor.withOpacity(0.1);
    // 전경색 설정 (기본값: 테마의 primaryColor)
    final fgColor = foregroundColor ?? Theme.of(context).primaryColor;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // 아이콘 컨테이너
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: bgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: fgColor,
                  size: 24,
                ),
              ),
              SizedBox(width: 16),

              // 텍스트 영역
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 메뉴 제목
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 4),
                    // 메뉴 설명
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),

              // 화살표 아이콘
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
