class QuizModel {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  QuizModel({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });

  // دالة لتحويل البيانات من ملف JSON إلى كائن يفهمه التطبيق
  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      question: json['question'] ?? '',
      options: List<String>.from(json['options'] ?? []),
      correctAnswerIndex: json['correctAnswerIndex'] ?? 0,
    );
  }
}
