import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/lesson_model.dart';
import '../lesson/lesson_screen.dart';
import '../contact/contact_screen.dart';

class CustomNavbar extends StatelessWidget implements PreferredSizeWidget {
  final List<LessonModel>? lessons;
  final String title;
  final bool showBackButton;

  const CustomNavbar({
    super.key,
    this.lessons,
    required this.title,
    this.showBackButton = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  // دالة لفتح الواتساب مباشرة
  Future<void> _launchWhatsApp(BuildContext context) async {
    final Uri url = Uri.parse('https://wa.me/218911313949');
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تعذر فتح الواتساب')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      actions: [
        // زر الواتساب مع الاسم
        InkWell(
          onTap: () => _launchWhatsApp(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: const Row(
              children: [
                Icon(Icons.phone, color: Colors.white, size: 20), // أيقونة الهاتف
                SizedBox(width: 5),
                Text(
                  'جمعة ضو', // اسمك هنا
                  style: TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        
        // قائمة الدروس المنسدلة
        if (lessons != null && lessons!.isNotEmpty)
          PopupMenuButton<LessonModel>(
            icon: const Icon(Icons.menu_book, color: Colors.white),
            tooltip: 'قائمة الدروس',
            onSelected: (LessonModel lesson) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LessonScreen(lesson: lesson),
                ),
              );
            },
            itemBuilder: (BuildContext context) {
              return lessons!.map((lesson) {
                return PopupMenuItem<LessonModel>(
                  value: lesson,
                  child: Text(
                    '${lesson.id}. ${lesson.title}',
                    style: const TextStyle(fontFamily: 'Cairo'),
                  ),
                );
              }).toList();
            },
          ),
          
        // زر الرئيسية
        IconButton(
          icon: const Icon(Icons.home, color: Colors.white),
          tooltip: 'الرئيسية',
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ],
    );
  }
}
