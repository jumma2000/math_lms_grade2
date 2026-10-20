import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/lesson_model.dart';

class JsonService {
  // دالة لقراءة ملف الدروس
  static Future<List<LessonModel>> loadLessons() async {
    try {
      // قراءة النص من الملف الموجود في مجلد assets/data
      final String response = await rootBundle.loadString('assets/data/lessons.json');
      
      // تحويل النص إلى قائمة
      final List<dynamic> data = json.decode(response);
      
      // تحويل القائمة إلى كائنات LessonModel
      return data.map((json) => LessonModel.fromJson(json)).toList();
      
    } catch (e) {
      // في حال حدوث خطأ (مثلاً الملف غير موجود)
      print('خطأ في قراءة ملف البيانات: $e');
      return [];
    }
  }
}