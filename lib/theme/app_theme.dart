// lib/theme/app_theme.dart
import 'package:flutter/material.dart';

// 앱의 테마 설정을 관리하는 클래스
class AppTheme {
  // 프라이빗 생성자로 인스턴스화 방지
  AppTheme._();

  // 앱의 주요 색상
  static const Color primaryColor = Color(0xFF5E35B1); // 보라색 계열
  static const Color accentColor = Color(0xFFFF9800); // 주황색 계열
  static const Color backgroundColor = Color(0xFFF5F5F5); // 밝은 회색
  static const Color errorColor = Color(0xFFD32F2F); // 빨간색

  // 텍스트 색상
  static const Color textPrimaryColor = Color(0xFF212121); // 거의 검정색
  static const Color textSecondaryColor = Color(0xFF757575); // 중간 회색

  // 라이트 테마 설정
  static final ThemeData lightTheme = ThemeData(
    // 기본 앱 색상
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: accentColor,
      error: errorColor,
      background: backgroundColor,
    ),

    // 스캐폴드 배경색 (화면 기본 배경)
    scaffoldBackgroundColor: backgroundColor,

    // 앱바 테마
    appBarTheme: AppBarTheme(
      color: primaryColor,
      elevation: 2.0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),

    // 카드 테마
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),

    // 텍스트 테마
    textTheme: TextTheme(
      // 제목 스타일
      headlineLarge: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: textPrimaryColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: textPrimaryColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: textPrimaryColor,
      ),
      titleLarge: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: textPrimaryColor,
      ),
      titleMedium: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      ),
      titleSmall: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      ),

      // 본문 스타일
      bodyLarge: TextStyle(
        fontSize: 16.0,
        color: textPrimaryColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        color: textSecondaryColor,
      ),

      // 캡션 스타일
      bodySmall: TextStyle(
        fontSize: 12.0,
        color: textSecondaryColor,
      ),
    ),

    // 버튼 테마
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),

    // ElevatedButton 테마
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),

    // TextButton 테마
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),

    // OutlinedButton 테마
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,
        side: BorderSide(color: primaryColor),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),

    // 입력 필드 테마
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: primaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: errorColor),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),

    // 체크박스, 라디오 버튼 등 토글 버튼의 테마
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.selected)) {
          return primaryColor;
        }
        return Colors.transparent;
      }),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    ),

    // 스위치 테마
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.selected)) {
          return primaryColor;
        }
        return Colors.grey.shade400;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.selected)) {
          return primaryColor.withOpacity(0.5);
        }
        return Colors.grey.shade300;
      }),
    ),
  );

  // 다크 테마 설정
  static final ThemeData darkTheme = ThemeData(
      // 기본 앱 색상
      primaryColor: primaryColor,
      colorScheme: ColorScheme.dark(
        primary: primaryColor,
        secondary: accentColor,
        error: errorColor,
        background: Color(0xFF121212), // 어두운 배경색
      ),

      // 스캐폴드 배경색 (화면 기본 배경)
      scaffoldBackgroundColor: Color(0xFF121212),

      // 앱바 테마
      appBarTheme: AppBarTheme(
        color: Color(0xFF1E1E1E),
        elevation: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),

      // 카드 테마
      cardTheme: CardTheme(
        color: Color(0xFF1E1E1E),
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),

      // 텍스트 테마
      textTheme: TextTheme(
        // 제목 스타일
        headlineLarge: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        headlineMedium: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        headlineSmall: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        titleLarge: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        titleMedium: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        titleSmall: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),

        // 본문 스타일
        bodyLarge: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.0,
          color: Colors.white,
        ),

        // 캡션 스타일
        bodySmall: TextStyle(
          fontSize: 12.0,
          color: Colors.white,
        ),
        // 캡션 스타일
        labelMedium: TextStyle(
          fontSize: 12.0,
          color: Colors.grey.shade400,
        ),
      )

      // 기타 다크 테마에 필요한 설정들...
      // (라이트 테마와 유사한 방식으로 설정하되 색상을 다크 모드에 맞게 조정)
      );
}
