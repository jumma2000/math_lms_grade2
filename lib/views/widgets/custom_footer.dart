import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_colors.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  // دالة لفتح الواتساب
  Future<void> _launchWhatsApp() async {
    final Uri url = Uri.parse('https://wa.me/218911313949'); // رابط الواتساب الخاص بك
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.textDark, // لون داكن للفوتر
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'إعداد: جمعة ضو',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'العنوان: طريق المشتل قرب مصنع النجمة',
            style: TextStyle(color: Colors.white70, fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          // زر الواتساب
          TextButton.icon(
            onPressed: _launchWhatsApp,
            icon: const Icon(Icons.phone, color: Colors.greenAccent),
            label: const Text(
              'واتساب: 00218911313949',
              style: TextStyle(color: Colors.greenAccent, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
