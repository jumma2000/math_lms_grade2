import 'package:flutter/material.dart';
import '../../models/lesson_model.dart';
import 'widgets/explanation_tab.dart';
import 'widgets/preparation_tab.dart';
import 'widgets/quiz_tab.dart';

class LessonScreen extends StatelessWidget {
  final LessonModel lesson;
  const LessonScreen({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(lesson.title),
          bottom: const TabBar(
            // --- التعديلات هنا ---
            labelColor: Colors.white, // لون التبويب المحدد (أبيض)
            unselectedLabelColor: Colors.white70, // لون التبويبات غير المحددة (أبيض شفاف قليلاً)
            indicatorColor: Colors.white, // لون الخط الذي أسفل التبويب
            // --------------------
            tabs: [
              Tab(text: 'الشرح', icon: Icon(Icons.menu_book)),
              Tab(text: 'التحضير', icon: Icon(Icons.assignment)),
              Tab(text: 'الاختبار', icon: Icon(Icons.quiz)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ExplanationTab(lesson: lesson),
            PreparationTab(lesson: lesson),
            QuizTab(lesson: lesson),
          ],
        ),
      ),
    );
  }
}
