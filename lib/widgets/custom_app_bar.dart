// lib/widgets/custom_app_bar.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

// 포트폴리오 앱 전체에서 일관된 AppBar를 제공하는 위젯
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;

  // 생성자: AppBar의 제목, 액션 버튼, 뒤로가기 버튼 표시 여부를 설정할 수 있습니다.
  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.showBackButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      elevation: 0, // 그림자 없애기
      backgroundColor: Theme.of(context).primaryColor,
      // 뒤로가기 버튼 설정
      automaticallyImplyLeading: showBackButton,
      // 액션 버튼 설정
      actions: actions ??
          [
            // 테마 전환 버튼
            IconButton(
              icon: Icon(
                themeProvider.isDarkMode
                    ? Icons.light_mode // 다크 모드일 때 (밝은 테마로 전환 옵션)
                    : Icons.dark_mode, // 라이트 모드일 때 (어두운 테마로 전환 옵션)
              ),
              onPressed: () {
                // Provider를 통해 테마 전환 함수 호출
                themeProvider.toggleTheme();

                // 사용자에게 테마 변경 알림
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(themeProvider.isDarkMode
                        ? '다크 모드로 전환되었습니다'
                        : '라이트 모드로 전환되었습니다'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),
          ],
    );
  }

  // PreferredSizeWidget 인터페이스 구현: AppBar의 크기 설정
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
