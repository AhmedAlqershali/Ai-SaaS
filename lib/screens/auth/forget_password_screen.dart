import 'package:ai_saas/models/app_type.dart';
import 'package:ai_saas/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatefulWidget {
  final AppType type;

  const ForgotPasswordScreen({super.key,required this.type});

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
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // النص الرئيسي
                    Text(
                      'نسيت كلمة المرور؟',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff0d1e3d),
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(height: 8.h),

                    // النص الفرعي
                    Text(
                      'أدخل بريدك الإلكتروني',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(height: 32.h),

                    // حقل إدخال البريد الإلكتروني
                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 14.sp),
                      decoration: InputDecoration(
                        hintText: 'example@domain.com',
                        hintStyle: const TextStyle(color: Colors.black),
                        suffixIcon: Icon(Icons.email_outlined, color: Colors.black38, size: 20.sp),
                        filled: true,
                        fillColor: const Color(0xfff0f3ff),
                        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(color: Color(0xff623ce7), width: 1.5),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // زر إرسال الرمز بتدرج لوني
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
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
                            blurRadius: 8.r,
                            offset: Offset(0, 4.h),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed:(){
                            if (widget.type == AppType.merchant) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(type: AppType.merchant),
                                ),
                              );
                            } else if (widget.type == AppType.client) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(type: AppType.client),
                                ),
                              );
                            }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'إرسال الرمز',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Icon(Icons.send, color: Colors.white, size: 20.sp),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),

                    // زر العودة لتسجيل الدخول
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'العودة لتسجيل الدخول',
                            style: TextStyle(
                              color: const Color(0xff623ce7),
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 14.sp,
                            color: const Color(0xff623ce7),
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
