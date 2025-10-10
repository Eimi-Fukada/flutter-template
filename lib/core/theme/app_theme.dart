import 'package:flutter/material.dart';

/// 全局主题配置类
class AppTheme {
  // 私有构造函数，防止实例化
  AppTheme._();

  // 主要颜色定义
  static const Color primaryColor = Color(0xFFE53935); // 网易云红
  static const Color secondaryColor = Color(0xFF1DB954); // Spotify绿
  static const Color backgroundColor = Color(0xFFFFFFFF); // 白色背景
  static const Color surfaceColor = Color(0xFFF5F5F5); // 表面颜色
  static const Color textColorPrimary = Color(0xFF333333); // 主要文字颜色
  static const Color textColorSecondary = Color(0xFF666666); // 次要文字颜色
  static const Color dividerColor = Color(0xFFEEEEEE); // 分割线颜色

  // 深色主题颜色定义
  static const Color darkBackgroundColor = Color(0xFF121212); // 深色背景
  static const Color darkSurfaceColor = Color(0xFF1E1E1E); // 深色表面
  static const Color darkTextColorPrimary = Color(0xFFFFFFFF); // 深色主题主要文字
  static const Color darkTextColorSecondary = Color(0xFFB3B3B3); // 深色主题次要文字
  static const Color darkDividerColor = Color(0xFF333333); // 深色分割线

  // 字体大小定义
  static const double fontSizeSmall = 12.0;
  static const double fontSizeMedium = 14.0;
  static const double fontSizeLarge = 16.0;
  static const double fontSizeXLarge = 18.0;
  static const double fontSizeXXLarge = 20.0;
  static const double fontSizeXXXLarge = 24.0;

  // 字体权重定义
  static const FontWeight fontWeightRegular = FontWeight.normal;
  static const FontWeight fontWeightMedium = FontWeight.w500;
  static const FontWeight fontWeightBold = FontWeight.bold;

  // 圆角定义
  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 8.0;
  static const double borderRadiusLarge = 16.0;

  // 阴影定义
  static const BoxShadow cardShadow = BoxShadow(
    color: Colors.black12,
    blurRadius: 4.0,
    offset: Offset(0, 2),
  );

  /// 创建浅色主题
  static ThemeData lightTheme() {
    return ThemeData(
      // 基础配置
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,

      // 应用栏主题
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundColor,
        foregroundColor: textColorPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: textColorPrimary,
          fontSize: fontSizeXXLarge,
          fontWeight: fontWeightBold,
        ),
      ),

      // 颜色配置
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        surfaceBright: backgroundColor,
        surface: surfaceColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurfaceVariant: textColorPrimary,
        onSurface: textColorPrimary,
      ),

      // 文本主题
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: fontSizeXXXLarge,
          fontWeight: fontWeightBold,
          color: textColorPrimary,
        ),
        headlineMedium: TextStyle(
          fontSize: fontSizeXXLarge,
          fontWeight: fontWeightBold,
          color: textColorPrimary,
        ),
        headlineSmall: TextStyle(
          fontSize: fontSizeXLarge,
          fontWeight: fontWeightBold,
          color: textColorPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: fontSizeLarge,
          color: textColorPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: fontSizeMedium,
          color: textColorSecondary,
        ),
        bodySmall: TextStyle(
          fontSize: fontSizeSmall,
          color: textColorSecondary,
        ),
      ),

      // 按钮主题
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: fontSizeLarge,
            fontWeight: fontWeightBold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusMedium),
          ),
        ),
      ),

      // 输入框主题
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusMedium),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusMedium),
          borderSide: const BorderSide(
            color: primaryColor,
            width: 2.0,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
      ),
    );
  }

  /// 创建深色主题
  static ThemeData darkTheme() {
    return ThemeData(
      // 基础配置
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: darkBackgroundColor,

      // 应用栏主题
      appBarTheme: const AppBarTheme(
        backgroundColor: darkBackgroundColor,
        foregroundColor: darkTextColorPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: darkTextColorPrimary,
          fontSize: fontSizeXXLarge,
          fontWeight: fontWeightBold,
        ),
      ),

      // 颜色配置
      colorScheme: ColorScheme.dark(
        primary: primaryColor,
        secondary: secondaryColor,
        surfaceBright: darkBackgroundColor,
        surface: darkSurfaceColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurfaceVariant: darkTextColorPrimary,
        onSurface: darkTextColorPrimary,
      ),

      // 文本主题
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: fontSizeXXXLarge,
          fontWeight: fontWeightBold,
          color: darkTextColorPrimary,
        ),
        headlineMedium: TextStyle(
          fontSize: fontSizeXXLarge,
          fontWeight: fontWeightBold,
          color: darkTextColorPrimary,
        ),
        headlineSmall: TextStyle(
          fontSize: fontSizeXLarge,
          fontWeight: fontWeightBold,
          color: darkTextColorPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: fontSizeLarge,
          color: darkTextColorPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: fontSizeMedium,
          color: darkTextColorSecondary,
        ),
        bodySmall: TextStyle(
          fontSize: fontSizeSmall,
          color: darkTextColorSecondary,
        ),
      ),

      // 按钮主题
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: fontSizeLarge,
            fontWeight: fontWeightBold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusMedium),
          ),
        ),
      ),

      // 输入框主题
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkSurfaceColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusMedium),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusMedium),
          borderSide: const BorderSide(
            color: primaryColor,
            width: 2.0,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
      ),
    );
  }
}
