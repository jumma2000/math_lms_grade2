import 'package:flutter/material.dart';
import '../../../models/lesson_model.dart';
import '../../../core/constants/app_colors.dart';

class ExplanationTab extends StatelessWidget {
  final LessonModel lesson;
  const ExplanationTab({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            lesson.explanation,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              height: 1.8, // مسافة مريحة بين السطور
              fontSize: 20, // تكبير الخط قليلاً
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
  }
}
