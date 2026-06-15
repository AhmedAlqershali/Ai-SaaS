import 'package:ai_saas/screens/auth/register_screen.dart';
import 'package:ai_saas/screens/widgets/card_splash.dart';
import 'package:ai_saas/screens/widgets/bn_screen.dart';
import 'package:ai_saas/models/app_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UserSelection extends StatefulWidget {
  const UserSelection({super.key});
  @override
  State<UserSelection> createState() => _UserSelectionState();
}

class _UserSelectionState extends State<UserSelection> {

  Future<void> selectType(AppType type) async {
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
            SizedBox(height: 20.h),

            Text(
              'Tradex مرحبا بك في',
              style: GoogleFonts.ibmPlexSans(fontSize: 36.sp),
            ),

            Text(
              'اختر كيف تود البدء اليوم',
              style: GoogleFonts.ibmPlexSans(fontSize: 18.sp),
            ),

            SizedBox(height: 15.h),

            // 1. كارت صاحب المشروع (العميل)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // نمرر النوع هنا
                    builder: (context) =>  RegisterScreen(type: AppType.merchant),
                  ),
                );
              },
              child: CardSplash(
                icon: Icons.storefront,
                name: 'صاحب المشروع',
                subname: 'قم بإدارة أعمالك، عرض منتجاتك والوصول لآلاف المشترين في منطقتك',
                color: 0xffE3DFFF,
                color1: 0xff4D41DF,
              ),
            ),

            // 2. كارت المتسوق (التاجر/المسوق)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // نمرر النوع هنا
                    builder: (context) =>  RegisterScreen(type: AppType.client),
                  ),
                );
              },
              child: CardSplash(
                icon: Icons.shopping_bag_outlined,
                name: 'متسوق',
                subname: 'استكشف أفضل العروض، تتبع طلباتك، واحصل على تجربة تسوق ذكية وفريدة',
                color: 0xff68FADE,
                color1: 0xff007162,
              ),
            ),

        const Spacer(),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10.r,
                    offset: Offset(6.w, 0),
                  ),
                ],
              ),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                child: Padding(
                  padding: EdgeInsets.all(15.0.r),
                  child: Column(
                    children: [
                      Text(
                        'أمان بياناتك أولويتنا',
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'نحن نستخدم أحدث تقنيات التشفير لضمان خصوصيتك وأمان تعاملاتك المالية داخل منصتنا.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      SizedBox(height: 15.h),
                      CircleAvatar(
                        radius: 24.r,
                        backgroundImage: const AssetImage('assets/images/bank.jpg'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
