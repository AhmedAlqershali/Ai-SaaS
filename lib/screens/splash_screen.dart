import 'dart:async';
import 'package:ai_saas/screens/user_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progress = 0.0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (mounted) {
        setState(() {
          progress += 0.05;
        });
      }

      if (progress >= 1) {
        timer.cancel();
        _navigateToNext();
      }
    });
  }

  void _navigateToNext() {
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const UserSelection()),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // تنظيف التايمر لمنع تسريب الذاكرة
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FD),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              const Spacer(flex: 3),

              // ======= قسم الشعار (Logo Section) مع حماية من الخروج عن الشاشة =======
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tradex',
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 50.sp, // تقليل بسيط لضمان الأمان
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff4D41DF),
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    _buildLogoIcon(),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              // ======= قسم النصوص الترحيبية =======
              Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    Text(
                      'سوقك الذكي مدعوماً بالذكاء الاصطناعي',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff1A1A1A),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'التجارة الإلكترونية المعززة بالذكاء الاصطناعي في متناول يدك',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 14.sp,
                        color: const Color(0xff707070),
                        height: 1.4, // تصحيح: الارتفاع نسبة وليس بكسل
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(flex: 4),

              // ======= قسم شريط التحميل الأنيق =======
              _buildProgressBar(),
              SizedBox(height: 40.h), // مسافة أمان سفلية
            ],
          ),
        ),
      ),
    );
  }

  // ويجت أيقونة البرق المنفصل
  Widget _buildLogoIcon() {
    return Transform.rotate(
      angle: 0.12,
      child: Container(
        height: 55.h,
        width: 55.h, // استخدام h للطرفين يضمن بقاءه مربعاً تماماً
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          color: const Color(0xff4D41DF),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff4D41DF).withOpacity(0.2),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Icon(
          Icons.flash_on,
          size: 30.sp,
          color: Colors.white,
        ),
      ),
    );
  }

  // ويجت شريط التحميل
  Widget _buildProgressBar() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: SizedBox(
            height: 5.h,
            width: 200.w, // عرض محدد للشريط ليعطي شكلاً أكثر رقيّاً
            child: LinearProgressIndicator(
              value: progress,
              color: const Color(0xff4D41DF),
              backgroundColor: const Color(0xff4D41DF).withOpacity(0.1),
            ),
          ),
        ),
      ],
    );
  }
}