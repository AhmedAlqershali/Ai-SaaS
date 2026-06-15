import 'package:ai_saas/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingAIPage extends StatelessWidget {
  const OnboardingAIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                // ─── الجزء العلوي: تاق الذكاء الاصطناعي ───
                 Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEEBFF),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children:  [
                        Icon(Icons.auto_awesome, size: 14.sp, color: const Color(0xFF5B4FCF)),
                        SizedBox(width: 6.w),
                        Text(
                          'الذكاء الاصطناعي',
                          style: GoogleFonts.ibmPlexSans(
                            color: const Color(0xFF5B4FCF),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 10.h),

                // ─── العناوين ───
                 Text(
                   textAlign: TextAlign.right,
                  'سوّق باستخدام',
                  style: GoogleFonts.ibmPlexSans(fontSize: 36.sp, fontWeight: FontWeight.bold),
                ),
                 Text(
                   textAlign: TextAlign.right,
                  'الذكاء الاصطناعي',
                  style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF5B4FCF),
                  ),
                ),
                SizedBox(height: 16.h),
                 Text(
                  'حوّل أفكارك إلى حملات تسويقية احترافية في ثوانٍ معدودة. دع مساعدنا الذكي يتولى كتابة المحتوى وتصميم العروض.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ibmPlexSans(color: Colors.grey, fontSize: 18.sp, height: 1.5),
                ),

                const Spacer(),

                // ─── الجزء الأوسط: Stack للعناصر العائمة ───

                SizedBox(
                  height: 280.h,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [

                      // صورة الساعة الرئيسية
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24.r),
                        child: Image.asset(
                          'assets/images/shoes.png', // استبدلها بصورتك
                          height: 200.h,
                          width: 250.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // داخل دالة build في Stack الصور
                      Positioned(
                        top: 15.h,
                        right: 15.w,
                        child: _buildSuggestedDescriptionCard(), // بطاقة وصف مقترح
                      ),
                      Positioned(
                        top: 90.h,
                        left: 0,
                        child: _buildShareBadge(), // أيقونة المشاركة
                      ),
                      // بطاقة "تحليل البيانات" البنفسجية
                      Positioned(
                        bottom: 25.h,
                        left: 10.w,
                        child: _buildFloatingBadge(
                          icon: Icons.psychology,
                          label: 'تحليل البيانات',
                          color: const Color(0xFF5B4FCF),
                        ),
                      ),
                      // بطاقة "الزيادة المتوقعة" البرتقالية
                      Positioned(
                        top: 80.h,
                        left: 0,
                        child: _buildStatBadge(),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // ─── مؤشر الصفحات (Dots) ───
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDot(false),
                    SizedBox(width: 5.w),
                    _buildDot(true), // النقطة النشطة
                    SizedBox(width: 5.w),
                    _buildDot(false),
                  ],
                ),
                SizedBox(height: 15.h),

                // ─── أزرار التحكم ───
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SplashScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B4FCF),
                    minimumSize: Size(double.infinity, 40.h),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                  ),
                  child:  Text(
                    'التالي',
                    style: GoogleFonts.ibmPlexSans(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SplashScreen()),
                    );
                  },
                  child:  Text(
                    'تخطي للمرحلة النهائية',
                    style: GoogleFonts.ibmPlexSans(color: Colors.grey, fontSize: 14.sp),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ميثود لبناء النقاط السفلية
  Widget _buildDot(bool isActive) {
    return Container(
      height: 8.h,
      width: isActive ? 24.w : 8.w,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF5B4FCF) : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }

  // ميثود للبطاقات العائمة الصغيرة
  Widget _buildFloatingBadge({required IconData icon, required String label, required Color color}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 20.sp),
          SizedBox(height: 4.h),
          Text(label, style: TextStyle(color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  // ميثود لبطاقة الإحصائيات (الزيادة المتوقعة)
  Widget _buildStatBadge() {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE0D3),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Icon(Icons.trending_up, color: Colors.brown, size: 18.sp),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('زيادة متوقعة', style: TextStyle(fontSize: 10.sp, color: Colors.brown)),
              Text('+240%', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.brown)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestedDescriptionCard() {
    return Container(
      width: 220.w, // عرض مناسب لاحتواء النص
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20.r,
            offset: Offset(0, 10.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end, // لضمان محاذاة النص لليمين
        mainAxisSize: MainAxisSize.min,
        children: [
          // العنوان العلوي مع النقطة الخضراء
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'وصف مقترح',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF37474F),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                width: 9.w,
                height: 9.h,
                decoration: const BoxDecoration(
                  color: Color(0xFF00695C),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          // النص المطلوب إضافته
          Text(
            "اكتشف الأناقة العصرية مع ساعتنا الجديدة. صممت لتناسب نمط حياتك الذكي.",
            textAlign: TextAlign.right, // محاذاة النص العربي
            style: TextStyle(
              fontSize: 12.sp,
              color: const Color(0xFF546E7A),
              height: 1.6, // تباعد الأسطر ليعطي طابع الذكاء الاصطناعي المنظم
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildShareBadge() {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: const Color(0xFF76FFDE), // اللون السماوي الفاتح في الصورة
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r),
          bottomLeft: Radius.circular(15.r),
          bottomRight: Radius.circular(15.r),
        ),
      ),
      child: Icon(
        Icons.share,
        color: const Color(0xFF00BFA5),
        size: 20.sp,
      ),
    );
  }

}
