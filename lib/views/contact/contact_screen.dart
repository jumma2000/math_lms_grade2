import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _messageController = TextEditingController();
  final _captchaController = TextEditingController();

  // إعدادات الكابتشا
  final int _num1 = 5;
  final int _num2 = 3;
  late int _correctAnswer;

  @override
  void initState() {
    super.initState();
    _correctAnswer = _num1 + _num2;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // التحقق من الكابتشا
      if (int.tryParse(_captchaController.text) != _correctAnswer) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('إجابة التحقق البشري غير صحيحة!'), backgroundColor: Colors.red),
        );
        return;
      }

      // هنا يتم إرسال البيانات (حالياً سنظهر رسالة نجاح فقط)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم إرسال رسالتك بنجاح. شكراً لك!'), backgroundColor: Colors.green),
      );
      
      // تفريغ الحقول
      _nameController.clear();
      _messageController.clear();
      _captchaController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اتصل بنا'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.contact_mail, size: 80, color: AppColors.primary),
              const SizedBox(height: 20),
              const Text(
                'يسعدنا تواصلك معنا. يرجى تعبئة النموذج أدناه:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              // حقل الاسم
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'الاسم الكامل',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) => value!.isEmpty ? 'يرجى إدخال الاسم' : null,
              ),
              const SizedBox(height: 20),

              // حقل الرسالة
              TextFormField(
                controller: _messageController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'رسالتك',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.message),
                ),
                validator: (value) => value!.isEmpty ? 'يرجى كتابة رسالتك' : null,
              ),
              const SizedBox(height: 20),

              // حقل الكابتشا (التحقق البشري)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('التحقق البشري (Captcha):', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'ما هو ناتج $_num1 + $_num2 ؟',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            controller: _captchaController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'الإجابة',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            ),
                            validator: (value) => value!.isEmpty ? 'مطلوب' : null,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // زر الإرسال
              ElevatedButton.icon(
                onPressed: _submitForm,
                icon: const Icon(Icons.send),
                label: const Text('إرسال الرسالة'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
