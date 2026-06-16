import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  // متغيرات للتحكم في إظهار وإخفاء النص داخل الحقول
  bool _obscureText1 = true;
  bool _obscureText2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FD), // لون الخلفية الهادئ المعتمد في التطبيق
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Container(
              padding: EdgeInsets.all(24.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // ليأخذ الكارت مساحة المحتوى فقط تماماً كالصورة
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 16.h),

                  // أيقونة القفل الدائرية مع سهم التحديث الخلفي
                  CircleAvatar(
                    radius: 40.r,
                    backgroundColor: const Color(0xff4D41DF).withOpacity(0.1),
                    child: Icon(
                      Icons.lock_reset_rounded,
                      color: const Color(0xff4D41DF),
                      size: 36.sp,
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // العنوان الرئيسي للواجهة
                  Text(
                    'تعيين كلمة مرور جديدة',
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff1A1A1A),
                    ),
                  ),
                  SizedBox(height: 8.h),

                  // النص الفرعي التوضيحي
                  Text(
                    'الرجاء إدخال كلمة المرور الجديدة وتأكيدها.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 13.sp,
                      color: const Color(0xff707070),
                    ),
                  ),
                  SizedBox(height: 28.h),

                  // حقل إدخال كلمة المرور الجديدة
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      obscureText: _obscureText1,
                      textAlign: TextAlign.right,
                      style: GoogleFonts.ibmPlexSans(fontSize: 14.sp),
                      decoration: InputDecoration(
                        hintText: 'كلمة المرور الجديدة',
                        hintStyle: GoogleFonts.ibmPlexSans(fontSize: 14.sp, color: Colors.black38),
                        // أيقونة العين تظهر على اليسار حسب اتجاه النص العربي المعاكس
                        prefixIcon: IconButton(
                          icon: Icon(
                            _obscureText1 ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                            color: Colors.black38,
                            size: 20.sp,
                          ),
                          onPressed: () => setState(() => _obscureText1 = !_obscureText1),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(color: Color(0xffEFEFEF)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(color: Color(0xff4D41DF)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 14.h),

                  // حقل تأكيد كلمة المرور
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      obscureText: _obscureText2,
                      textAlign: TextAlign.right,
                      style: GoogleFonts.ibmPlexSans(fontSize: 14.sp),
                      decoration: InputDecoration(
                        hintText: 'تأكيد كلمة المرور',
                        hintStyle: GoogleFonts.ibmPlexSans(fontSize: 14.sp, color: Colors.black38),
                        prefixIcon: IconButton(
                          icon: Icon(
                            _obscureText2 ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                            color: Colors.black38,
                            size: 20.sp,
                          ),
                          onPressed: () => setState(() => _obscureText2 = !_obscureText2),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(color: Color(0xffEFEFEF)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(color: Color(0xff4D41DF)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // زر التحديث الرئيسي بلون الهوية والسهم الموجه لليسار
                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: ElevatedButton(
                      onPressed: () {
                        // أكشن تحديث كلمة المرور والانتقال لشاشة النجاح
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff4D41DF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back, // السهم المتجه لليسار كما في التصميم تماماً لمتابعة الخطوات
                            color: Colors.white,
                            size: 20.sp,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'تحديث كلمة المرور',
                            style: GoogleFonts.ibmPlexSans(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}