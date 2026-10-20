import 'package:flutter/material.dart';
import '../../models/lesson_model.dart';
import '../../services/json_service.dart';
import '../lesson/lesson_screen.dart';
import '../../core/constants/app_colors.dart';
import '../widgets/custom_navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<LessonModel> _lessons = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final lessons = await JsonService.loadLessons();
    setState(() {
      _lessons = lessons;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // تم استخدام CustomNavbar هنا
      appBar: CustomNavbar(
        lessons: _lessons,
        title: 'منظومة إدارة كتاب الرياضيات',
      ),
      // تم إزالة الفوتر والـ Column ليأخذ المحتوى كامل الشاشة
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _lessons.isEmpty
              ? const Center(child: Text('لا توجد دروس متاحة حالياً.', style: TextStyle(fontSize: 18)))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _lessons.length,
                  itemBuilder: (context, index) {
                    final lesson = _lessons[index];
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        leading: CircleAvatar(
                          backgroundColor: AppColors.primary,
                          child: Text(
                            '${lesson.id}',
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(
                          lesson.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, color: AppColors.primary),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LessonScreen(lesson: lesson),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
    );
  }
}