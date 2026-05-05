import 'package:ai_saas/screens/splash_screen.dart';
import 'package:flutter/material.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // ─── الجزء العلوي: تاق الذكاء الاصطناعي ───
                 Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEEBFF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children:  [
                        Icon(Icons.auto_awesome, size: 14, color: Color(0xFF5B4FCF)),
                        SizedBox(width: 6),
                        Text(
                          'الذكاء الاصطناعي',
                          style: GoogleFonts.ibmPlexSans(
                            color: Color(0xFF5B4FCF),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 20),

                // ─── العناوين ───
                 Text(
                   textAlign: TextAlign.right,
                  'سوّق باستخدام',
                  style: GoogleFonts.ibmPlexSans(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                 Text(
                   textAlign: TextAlign.right,
                  'الذكاء الاصطناعي',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5B4FCF),
                  ),
                ),
                const SizedBox(height: 16),
                 Text(
                  'حوّل أفكارك إلى حملات تسويقية احترافية في ثوانٍ معدودة. دع مساعدنا الذكي يتولى كتابة المحتوى وتصميم العروض.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ibmPlexSans(color: Colors.grey, fontSize: 18, height: 1.5),
                ),

                const Spacer(),

                // ─── الجزء الأوسط: Stack للعناصر العائمة ───

                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [

                      // صورة الساعة الرئيسية
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          'assets/images/shoes.png', // استبدلها بصورتك
                          height: 200,
                          width: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // داخل دالة build في Stack الصور
                      Positioned(
                        top: 20,
                        right: 20,
                        child: _buildSuggestedDescriptionCard(), // بطاقة وصف مقترح
                      ),
                      Positioned(
                        top: 100,
                        left: 0,
                        child: _buildShareBadge(), // أيقونة المشاركة
                      ),
                      // بطاقة "تحليل البيانات" البنفسجية
                      Positioned(
                        bottom: 40,
                        left: 10,
                        child: _buildFloatingBadge(
                          icon: Icons.psychology,
                          label: 'تحليل البيانات',
                          color: const Color(0xFF5B4FCF),
                        ),
                      ),
                      // بطاقة "الزيادة المتوقعة" البرتقالية
                      Positioned(
                        top: 80,
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
                    const SizedBox(width: 5),
                    _buildDot(true), // النقطة النشطة
                    const SizedBox(width: 5),
                    _buildDot(false),
                  ],
                ),
                const SizedBox(height: 30),

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
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child:  Text(
                    'التالي',
                    style: GoogleFonts.ibmPlexSans(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
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
                    style: GoogleFonts.ibmPlexSans(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 20),
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
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF5B4FCF) : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  // ميثود للبطاقات العائمة الصغيرة
  Widget _buildFloatingBadge({required IconData icon, required String label, required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  // ميثود لبطاقة الإحصائيات (الزيادة المتوقعة)
  Widget _buildStatBadge() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE0D3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.trending_up, color: Colors.brown, size: 18),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('زيادة متوقعة', style: TextStyle(fontSize: 10, color: Colors.brown)),
              Text('+240%', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.brown)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestedDescriptionCard() {
    return Container(
      width: 220, // عرض مناسب لاحتواء النص
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 10),
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
              const Text(
                'وصف مقترح',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF37474F),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 9,
                height: 9,
                decoration: const BoxDecoration(
                  color: Color(0xFF00695C),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // النص المطلوب إضافته
          const Text(
            "اكتشف الأناقة العصرية مع ساعتنا الجديدة. صممت لتناسب نمط حياتك الذكي.",
            textAlign: TextAlign.right, // محاذاة النص العربي
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF546E7A),
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
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xFF76FFDE), // اللون السماوي الفاتح في الصورة
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: const Icon(
        Icons.share,
        color: Color(0xFF00BFA5),
        size: 20,
      ),
    );
  }

}