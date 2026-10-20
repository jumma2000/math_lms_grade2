class PreparationModel {
  final String cognitiveObjectives; // الأهداف المعرفية
  final String skillObjectives;     // الأهداف المهارية
  final String emotionalObjectives; // الأهداف الوجدانية
  final List<String> teachingAids;  // الوسائل التعليمية
  final String warmUp;              // التمهيد
  final String presentation;        // خطوات العرض
  final String evaluation;          // التقويم
  final String homework;            // الواجب المنزلي
  final String notes;               // ملاحظات

  PreparationModel({
    required this.cognitiveObjectives,
    required this.skillObjectives,
    required this.emotionalObjectives,
    required this.teachingAids,
    required this.warmUp,
    required this.presentation,
    required this.evaluation,
    required this.homework,
    required this.notes,
  });

  factory PreparationModel.fromJson(Map<String, dynamic> json) {
    return PreparationModel(
      cognitiveObjectives: json['cognitiveObjectives'] ?? '',
      skillObjectives: json['skillObjectives'] ?? '',
      emotionalObjectives: json['emotionalObjectives'] ?? '',
      teachingAids: List<String>.from(json['teachingAids'] ?? []),
      warmUp: json['warmUp'] ?? '',
      presentation: json['presentation'] ?? '',
      evaluation: json['evaluation'] ?? '',
      homework: json['homework'] ?? '',
      notes: json['notes'] ?? '',
    );
  }
}
