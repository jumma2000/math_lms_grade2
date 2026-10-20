import 'package:flutter/material.dart';
import '../../../models/lesson_model.dart';
import '../../../core/constants/app_colors.dart';

class PreparationTab extends StatelessWidget {
  final LessonModel lesson;
  const PreparationTab({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    final prep = lesson.preparation;
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionCard(context, 'الأهداف المعرفية', prep.cognitiveObjectives),
          _buildSectionCard(context, 'الأهداف المهارية', prep.skillObjectives),
          _buildSectionCard(context, 'الأهداف الوجدانية', prep.emotionalObjectives),
          _buildSectionCard(context, 'الوسائل التعليمية', prep.teachingAids.join(' - ')),
          _buildSectionCard(context, 'التمهيد', prep.warmUp),
          _buildSectionCard(context, 'خطوات العرض', prep.presentation),
          _buildSectionCard(context, 'التقويم', prep.evaluation),
          _buildSectionCard(context, 'الواجب المنزلي', prep.homework),
          if (prep.notes.isNotEmpty) _buildSectionCard(context, 'ملاحظات', prep.notes),
        ],
      ),
    );
  }

  Widget _buildSectionCard(BuildContext context, String title, String content) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20), // مسافة بين البطاقات
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // شريط العنوان الملون
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: const BoxDecoration(
              color: AppColors.primary, // لون أخضر
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          // محتوى البطاقة
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: 1.6,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
