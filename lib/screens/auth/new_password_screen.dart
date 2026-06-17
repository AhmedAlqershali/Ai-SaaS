import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool _obscureText1 = true;
  bool _obscureText2 = true;

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xff4D41DF);
    const Color textColor = Color(0xff1A1A1A);
    const Color subTextColor = Color(0xff707070);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffF8F9FD),
        body: SafeArea(
          child: Center(
            // SingleChildScrollView يحمي الواجهة من الـ Overflow عند ظهور لوحة المفاتيح
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: Container(
                padding: EdgeInsets.all(24.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r), // زوايا أنعم
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 10.h),

                    // أيقونة القفل المحدثة
                    CircleAvatar(
                      radius: 40.r,
                      backgroundColor: primaryColor.withOpacity(0.1),
                      child: Icon(
                        Icons.lock_reset_rounded,
                        color: primaryColor,
                        size: 40.sp,
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // العنوان
                    Text(
                      'تعيين كلمة مرور جديدة',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    SizedBox(height: 10.h),

                    // النص التوضيحي
                    Text(
                      'الرجاء إدخال كلمة المرور الجديدة وتأكيدها للمتابعة.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 13.sp,
                        color: subTextColor,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 30.h),

                    // حقل كلمة المرور الأولى
                    _buildPasswordField(
                      hint: 'كلمة المرور الجديدة',
                      isObscured: _obscureText1,
                      onToggle: () => setState(() => _obscureText1 = !_obscureText1),
                    ),

                    SizedBox(height: 16.h),

                    // حقل تأكيد كلمة المرور
                    _buildPasswordField(
                      hint: 'تأكيد كلمة المرور الجديدة',
                      isObscured: _obscureText2,
                      onToggle: () => setState(() => _obscureText2 = !_obscureText2),
                    ),

                    SizedBox(height: 30.h),

                    // زر التحديث
                    SizedBox(
                      width: double.infinity,
                      height: 54.h,
                      child: ElevatedButton(
                        onPressed: () {
                          // منطق التحديث هنا
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'تحديث كلمة المرور',
                              style: GoogleFonts.ibmPlexSans(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Icon(
                              Icons.check_circle_outline_rounded,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ويجت مخصص لبناء حقول كلمة المرور لتقليل تكرار الكود
  Widget _buildPasswordField({
    required String hint,
    required bool isObscured,
    required VoidCallback onToggle,
  }) {
    return TextField(
      obscureText: isObscured,
      textAlign: TextAlign.right,
      style: GoogleFonts.ibmPlexSans(fontSize: 14.sp),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.ibmPlexSans(fontSize: 13.sp, color: Colors.black38),
        // الأيقونة جهة اليسار (Suffix في الـ RTL)
        suffixIcon: IconButton(
          icon: Icon(
            isObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            color: Colors.black38,
            size: 20.sp,
          ),
          onPressed: onToggle,
        ),
        prefixIcon: const Icon(Icons.lock_outline_rounded, color: Colors.black26),
        filled: true,
        fillColor: const Color(0xffF2F3F6), // تغيير بسيط للون الحقل ليعطي عمقاً
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Color(0xff4D41DF), width: 1.5),
        ),
      ),
    );
  }
}