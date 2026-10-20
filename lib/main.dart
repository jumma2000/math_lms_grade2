import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/theme/app_theme.dart';
import 'views/splash_screen.dart'; // <--- استيراد شاشة البداية

void main() {
  runApp(const MathGrade2App());
}

class MathGrade2App extends StatelessWidget {
  const MathGrade2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'رياضيات الصف الثاني',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'LY'),
        Locale('ar', 'AE'),
      ],
      locale: const Locale('ar', 'LY'),
      home: const SplashScreen(), // <--- تم التعديل لتفتح شاشة الغلاف أولاً
    );
  }
}
