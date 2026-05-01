import 'package:ai_saas/screens/splash_screen.dart';
import 'package:ai_saas/screens/widgets/card_splash.dart';
import 'package:ai_saas/screens/widgets/bn_screen.dart';
import 'package:ai_saas/models/app_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserSelection extends StatefulWidget {
  const UserSelection({super.key});

  @override
  State<UserSelection> createState() => _UserSelectionState();
}

class _UserSelectionState extends State<UserSelection> {
  Future<void> _selectType(AppType type) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => BnScreen(type: type)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Text(
              'Tradex مرحبا بك في',
              style: GoogleFonts.ibmPlexSans(fontSize: 36),
            ),

            Text(
              'اختر كيف تود البدء اليوم',
              style: GoogleFonts.ibmPlexSans(fontSize: 18),
            ),

            const SizedBox(height: 15),

            GestureDetector(
              onTap: () {
                _selectType(AppType.client);
              },
              child: CardSplash(
                icon: Icons.storefront,
                name: 'صاحب المشروع',
                subname:
                    'قم بإدارة أعمالك، عرض منتجاتك والوصول لآلاف المشترين في منطقتك',
                color: 0xffE3DFFF,
                color1: 0xff4D41DF,
              ),
            ),

            GestureDetector(
              onTap: () {
                _selectType(AppType.merchant);
              },
              child: CardSplash(
                icon: Icons.shopping_bag_outlined,
                name: 'متسوق',
                subname:
                    'استكشف أفضل العروض، تتبع طلباتك، واحصل على تجربة تسوق ذكية وفريدة',
                color: 0xff68FADE,
                color1: 0xff007162,
              ),
            ),

            GestureDetector(
              onTap: () {
                _selectType(AppType.guest);
              },
              child: CardSplash(
                icon: Icons.remove_red_eye,
                name: 'زائر',
                subname:
                    'تصفح المنتجات والأسواق المحلية المتاحة دون الحاجة لإنشاء حساب حالياً',
                color: 0xffFFDCC6,
                color1: 0xff914800,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              'هل لديك حساب بالفعل؟',
              style: GoogleFonts.ibmPlexSans(fontSize: 14),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff4D41DF).withOpacity(0.1),
                foregroundColor: Colors.black,
                fixedSize: const Size(300, 50),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SplashScreen()),
                );
              },
              child: Text(
                'تسجيل الدخول',
                style: GoogleFonts.ibmPlexSans(fontSize: 20),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(6, 0),
                  ),
                ],
              ),
              child: const Card(
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text('أمان بياناتك أولويتنا'),
                      SizedBox(height: 10),
                      Text(
                        'نحن نستخدم أحدث تقنيات التشفير لضمان خصوصيتك وأمان تعاملاتك المالية داخل منصتنا.',
                        textAlign: TextAlign.center,
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
