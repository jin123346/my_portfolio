// lib/main.dart
import 'package:flutter/material.dart';
import 'package:my_portfolio/providers/theme_provider.dart';
import 'package:my_portfolio/screens/contact_screen.dart';
import 'package:my_portfolio/screens/home_screen.dart';
import 'package:my_portfolio/screens/project_detail_screen.dart';
import 'package:my_portfolio/screens/projects_screen.dart';
import 'package:my_portfolio/screens/skill_screen.dart';
import 'package:my_portfolio/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyPortfolioApp(),
    ),
  );
}

// 포트폴리오 앱의 메인 클래스입니다.
// 앱의 테마와 라우팅을 설정합니다.
class MyPortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp: Flutter에서 Material Design을 사용하는 앱을 만들 때 사용하는 위젯
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        title: '하진희 포트폴리오',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeProvider.themeMode,
        home: HomeScreen(),
        routes: {
          '/projects': (context) => ProjectsScreen(),
          '/skills': (context) => SkillsScreen(),
          '/contact': (context) => ContactScreen(),
        },
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
