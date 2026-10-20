import 'dart:async';
import 'package:flutter/material.dart';
import 'home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'assets/images/splash_cover.jpg',
            fit: BoxFit.contain, // نستخدم contain لكي تظهر الصورة كاملة دون قص
            // إذا أردت أن تملأ الشاشة تماماً وتقص الأطراف استخدم BoxFit.cover
          ),
        ),
      ),
    );
  }
}