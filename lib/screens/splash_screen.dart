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

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (mounted) {
        setState(() {
          progress += 0.05;
        });
      }

      if (progress >= 1) {
        timer.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const UserSelection()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FD), // نفس الخلفية الهادئة المعتمدة في باقي واجهاتك
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(), // لدفع المحتوى الرئيسي إلى المنتصف تماماً

                // ======= قسم الشعار (Logo Section) =======
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // اسم التطبيق
                    Text(
                      'Tradex',
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 54.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff4D41DF),
                        letterSpacing: 1.w,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    // أيقونة البرق المائلة الاحترافية
                    Transform.rotate(
                      angle: 0.12, // تدوير خفيف وأنيق
                      child: Container(
                        height: 64.h,
                        width: 64.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.r),
                          color: const Color(0xff4D41DF),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff4D41DF).withOpacity(0.25),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.flash_on,
                          size: 34.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),

                // ======= قسم النصوص الترحيبية (Typography) =======
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      Text(
                        'سوقك الذكي مدعوماً بالذكاء الاصطناعي',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ibmPlexSans(
                          fontSize: 22.sp,
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
                          height: 1.5.h,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(), // دفع مؤشر التحميل إلى الأسفل بشكل متناسق

                // ======= قسم شريط التحميل الأنثيق (Progress Bar) =======
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r), // حواف دائرية للشريط
                    child: SizedBox(
                      height: 5.h, // شريط نحيف وأنيق (Modern)
                      child: LinearProgressIndicator(
                        value: progress,
                        color: const Color(0xff4D41DF),
                        backgroundColor: const Color(0xff4D41DF).withOpacity(0.1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}