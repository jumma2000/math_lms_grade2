import 'package:flutter/material.dart';

class AppColors {
  // ألوان مستوحاة من كتاب الرياضيات (ألوان مبهجة للأطفال)
  static const Color primary = Color(0xFF2E7D32); // أخضر
  static const Color secondary = Color(0xFF1976D2); // أزرق
  static const Color accent = Color(0xFFF57C00); // برتقالي
  static const Color background = Color(0xFFFAFAFA); // أبيض مائل للرمادي الفاتح جداً
  static const Color textDark = Color(0xFF212121);
  static const Color textLight = Color(0xFF757575);
  static const Color error = Color(0xFFD32F2F); // أحمر
  
  // ألوان خاصة بالوحدات (لتمييز كل وحدة بلون)
  static const List<Color> unitsColors = [
    Color(0xFFE53935), // أحمر
    Color(0xFF8E24AA), // بنفسجي
    Color(0xFF3949AB), // أزرق داكن
    Color(0xFF00897B), // تركواز
    Color(0xFFFDD835), // أصفر
    Color(0xFFFB8C00), // برتقالي
  ];
}
