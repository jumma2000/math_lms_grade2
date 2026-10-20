import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      
      // إعداد الخط العربي (Cairo)
      fontFamily: 'Cairo',
      
      // ألوان النصوص وتكبير الخط وتسمينه
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: AppColors.textDark, 
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: AppColors.textDark, 
          fontSize: 18, // كبرنا الخط من 16 إلى 18
          fontWeight: FontWeight.w600, // جعلناه سميكاً (SemiBold)
          height: 1.8, // مسافة مريحة بين السطور
        ),
        bodyMedium: TextStyle(
          color: AppColors.textDark, // غيرنا اللون للداكن ليكون أوضح
          fontSize: 16, 
          fontWeight: FontWeight.w600,
          height: 1.6,
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),

      // إعدادات شريط التطبيق العلوي (AppBar)
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 2,
        titleTextStyle: TextStyle(
          fontFamily: 'Cairo',
          fontSize: 22, // تكبير خط العنوان قليلاً
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),

      // إعدادات الأزرار
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 18, // تكبير خط الزر
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
      ),
    );
  }
}
