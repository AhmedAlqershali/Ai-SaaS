import 'package:ai_saas/screens/splash_screen.dart';
import 'package:ai_saas/screens/widgets/card_splash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserSelection extends StatefulWidget {
  const UserSelection({super.key});

  @override
  State<UserSelection> createState() => _UserSelectionState();
}

class _UserSelectionState extends State<UserSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'Tradex مرحبا بك في',
              style: GoogleFonts.ibmPlexSans(fontSize: 36),
            ),

            Text(
              'اختر كيف تود البدء اليوم',
              style: GoogleFonts.ibmPlexSans(fontSize: 18),
            ),

            SizedBox(height: 15),

            CardSplash(
              icon: Icons.storefront,
              name: 'صاحب المشروع',
              subname:
                  'قم بإدارة أعمالك، عرض منتجاتك والوصول لآلاف المشترين في منطقتك',
              color: 0xffE3DFFF,
              color1: 0xff4D41DF,
            ),
            CardSplash(
              icon: Icons.shopping_bag_outlined,
              name: 'متسوق',
              subname:
                  'استكشف أفضل العروض، تتبع طلباتك، واحصل على تجربة تسوق ذكية وفريدة',
              color: 0xff68FADE,
              color1: 0xff007162,
            ),
            CardSplash(
              icon: Icons.remove_red_eye,
              name: 'زائر',
              subname:
                  'تصفح المنتجات والأسواق المحليةالمتاحة دون الحاجة لإنشاء حساب حالياً',
              color: 0xffFFDCC6,
              color1: 0xff914800,
            ),
            SizedBox(height: 15),
            Text(
              'هل لديك حساب بالفعل؟',
              style: GoogleFonts.ibmPlexSans(fontSize: 14),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff4D41DF0D).withValues(alpha: 0.1),                foregroundColor: Colors.black,
                fixedSize: Size(300, 50),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SplashScreen(),
                  ),
                );
              },
              child: Text(
                'تسجيل الدخول',
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(6, 0),
                  ),
                ],
              ),
              child: Card(
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('أمان بياناتك أولويتنا'),
                      Text(
                        'نحن نستخدم أحدث تقنيات التشفير لضمان خصوصيتك وأمان تعاملاتك المالية داخل منصتنا.',
                      ),
                      SizedBox(height: 15),
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage('assets/images/bank.jpg'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
