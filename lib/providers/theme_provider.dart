// lib/providers/theme_provider.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  // 테마 모드 (true: 다크 모드, false: 라이트 모드)
  bool _isDarkMode = false;

  // getter
  bool get isDarkMode => _isDarkMode;
  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  // 생성자에서 저장된 테마 정보 불러오기
  ThemeProvider() {
    _loadThemeFromPrefs();
  }

  // 테마 전환 함수
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _saveThemeToPrefs(); // 설정 저장
    notifyListeners(); // UI 업데이트를 위한 알림
  }

  // 저장된 테마 설정 불러오기
  Future<void> _loadThemeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  // 테마 설정 저장하기
  Future<void> _saveThemeToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _isDarkMode);
  }
}
