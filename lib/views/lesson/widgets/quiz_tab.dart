import 'package:flutter/material.dart';
import '../../../models/lesson_model.dart';
import '../../../core/constants/app_colors.dart';

class QuizTab extends StatefulWidget {
  final LessonModel lesson;
  const QuizTab({super.key, required this.lesson});

  @override
  State<QuizTab> createState() => _QuizTabState();
}

class _QuizTabState extends State<QuizTab> {
  int _currentQuestionIndex = 0;
  int? _selectedOptionIndex;
  bool _isAnswered = false;
  int _score = 0;

  void _checkAnswer(int index) {
    if (_isAnswered) return;
    setState(() {
      _selectedOptionIndex = index;
      _isAnswered = true;
      if (index == widget.lesson.quizzes[_currentQuestionIndex].correctAnswerIndex) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < widget.lesson.quizzes.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedOptionIndex = null;
        _isAnswered = false;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('انتهى الاختبار!', style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text('لقد أجبت بشكل صحيح على $_score من ${widget.lesson.quizzes.length} أسئلة.', style: const TextStyle(fontSize: 18)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  _currentQuestionIndex = 0;
                  _selectedOptionIndex = null;
                  _isAnswered = false;
                  _score = 0;
                });
              },
              child: const Text('إعادة المحاولة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.lesson.quizzes.isEmpty) {
      return const Center(child: Text('لا توجد أسئلة لهذا الدرس.', style: TextStyle(fontSize: 18)));
    }

    final quiz = widget.lesson.quizzes[_currentQuestionIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'السؤال ${_currentQuestionIndex + 1} من ${widget.lesson.quizzes.length}',
            style: const TextStyle(fontSize: 16, color: AppColors.textLight, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 4,
            color: Colors.blue.shade50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Colors.blue.shade200, width: 1.5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                quiz.question,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, height: 1.5, color: AppColors.textDark),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ...List.generate(quiz.options.length, (index) {
            bool isCorrect = index == quiz.correctAnswerIndex;
            bool isSelected = index == _selectedOptionIndex;
            
            Color cardColor = Colors.white;
            if (_isAnswered) {
              if (isCorrect) cardColor = Colors.green.shade100;
              if (isSelected && !isCorrect) cardColor = Colors.red.shade100;
            }

            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  if (!_isAnswered)
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                title: Text(
                  quiz.options[index],
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                onTap: () => _checkAnswer(index),
                trailing: _isAnswered && isSelected
                    ? Icon(isCorrect ? Icons.check_circle : Icons.cancel, 
                           color: isCorrect ? Colors.green : Colors.red, size: 30)
                    : null,
              ),
            );
          }),
          const SizedBox(height: 20),
          
          // زر السؤال التالي
          if (_isAnswered)
            ElevatedButton.icon(
              onPressed: _nextQuestion,
              icon: const Icon(Icons.arrow_forward, color: Colors.white),
              label: Text(_currentQuestionIndex < widget.lesson.quizzes.length - 1 
                  ? 'السؤال التالي' 
                  : 'عرض النتيجة',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 5,
              ),
            ),
            
          // مسافة أمان في الأسفل لضمان عدم اختفاء الزر
          const SizedBox(height: 50), 
        ],
      ),
    );
  }
}
