import 'preparation_model.dart';
import 'quiz_model.dart';

class LessonModel {
  final int id;
  final String title; // عنوان الدرس
  final String explanation; // الشرح والأمثلة
  final PreparationModel preparation; // التحضير
  final List<QuizModel> quizzes; // قائمة الأسئلة

  LessonModel({
    required this.id,
    required this.title,
    required this.explanation,
    required this.preparation,
    required this.quizzes,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      explanation: json['explanation'] ?? '',
      // تحويل التحضير من JSON إلى كائن
      preparation: PreparationModel.fromJson(json['preparation'] ?? {}),
      // تحويل قائمة الأسئلة
      quizzes: (json['quizzes'] as List<dynamic>? ?? [])
          .map((quizJson) => QuizModel.fromJson(quizJson))
          .toList(),
    );
  }
}
