import 'package:ai_saas/screens/auth/code_register.dart';
import 'package:ai_saas/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // يمنع الشاشة من التغير عند ظهور الكيبورد

      backgroundColor: const Color(0xfff8faff),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // النص الرئيسي
                    const Text(
                      'نسيت كلمة المرور؟',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0d1e3d),
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 8),

                    // النص الفرعي
                    const Text(
                      'أدخل بريدك الإلكتروني',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 32),

                    // حقل إدخال البريد الإلكتروني
                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: 'example@domain.com',
                        hintStyle:  TextStyle(color: Colors.black),
                        suffixIcon: const Icon(Icons.email_outlined, color: Colors.black38),
                        filled: true,
                        fillColor: const Color(0xfff0f3ff),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xff623ce7), width: 1.5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // زر إرسال الرمز بتدرج لوني
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff512da8),
                            Color(0xff7c4dff),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff7c4dff).withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // if (_formKey.currentState!.validate()) {
                          //   // منطق إرسال الرمز (API Call) يوضع هنا
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(content: Text('جاري إرسال الرمز...')),
                          //   );
                          // }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CodeRegister(), // واجهة تسجيل الدخول الخاصة بك
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'إرسال الرمز',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.send, color: Colors.white, size: 20),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // زر العودة لتسجيل الدخول
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // للعودة للصفحة السابقة
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'العودة لتسجيل الدخول',
                            style: TextStyle(
                              color: Color(0xff623ce7),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: Color(0xff623ce7),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}