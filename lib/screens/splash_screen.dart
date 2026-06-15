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
      body: SafeArea(
        child: Center(
          child: Container(
            width: 400.w,
            height: 400.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 144.h,
                  width: 350.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: Colors.white10
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Tradex',
                        style: GoogleFonts.ibmPlexSans(
                          fontSize: 60.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff4D41DF),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Transform.rotate(
                        angle: .09,
                        child: Container(
                          height: 80.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.r),
                            color: const Color(0xff4D41DF),
                          ),
                          child: Icon(
                            Icons.flash_on,
                            size: 40.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  'AI سوقك الذكي باستخدام ',
                  style: GoogleFonts.ibmPlexSans(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  'التجارة الإلكترونية المعززة بالذكاء الاصطناعي في متناول يدك',
                  style: GoogleFonts.ibmPlexSans(fontSize: 18.sp),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0.r),
                  child: Center(
                    child: LinearProgressIndicator(
                      value: progress,
                      color: const Color(0xff4D41DF),
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
