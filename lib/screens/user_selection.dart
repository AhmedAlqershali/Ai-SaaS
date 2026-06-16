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
  // متغير لحفظ النوع المحدد حالياً (افتراضياً متسوق بناءً على الصورة)
  AppType _selectedType = AppType.client;

  Future<void> selectType(AppType type) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => BnScreen(type: type)),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF5342E6);
    const Color backgroundColor = Color(0xFFF9FAFF);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40.h),

            // العنوان الرئيسي والتوضيحي من الصورة 7.PNG
            Text(
              'مرحباً بك في Tradex',
              style: GoogleFonts.ibmPlexSans(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'اختر نوع الحساب للمتابعة',
              style: GoogleFonts.ibmPlexSans(
                fontSize: 14.sp,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 30.h),

            // 1. كارت متسوق (AppType.client)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedType = AppType.client;
                  });
                },
                child: Container(
                  height: 140.h,
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: _selectedType == AppType.client ? primaryColor : Colors.grey.shade200,
                      width: _selectedType == AppType.client ? 1.5.w : 1.w,
                    ),
                  ),
                  child: Row(
                    children: [
                      // النصوص والتفاصيل داخل الكرت (تبدأ من اليمين بسبب الـ RTL التلقائي في التطبيق)
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'متسوق',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              'ابحث عن المنتجات، قارن الأسعار، وتسوق بسهولة ذكية.',
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.grey.shade600,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12.w),
                      // الصورة ثلاثية الأبعاد الخاصة بالمتسوق
                      Container(
                        width: 80.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/client.png'), // يرجى إضافة مسار الصورة هنا
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // 2. كارت تاجر / صاحب المشروع (AppType.merchant)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedType = AppType.merchant;
                  });
                },
                child: Container(
                  height: 140.h,
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: _selectedType == AppType.merchant ? primaryColor : Colors.grey.shade200,
                      width: _selectedType == AppType.merchant ? 1.5.w : 1.w,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'تاجر',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              'قم ببيع منتجاتك، تتبع أرباحك، ووسع تجارتك باستخدام الذكاء الاصطناعي.',
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.grey.shade600,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12.w),
                      // الصورة ثلاثية الأبعاد الخاصة بالتاجر
                      Container(
                        width: 80.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/merchant.png'), // يرجى إضافة مسار الصورة هنا
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const Spacer(),

            // الجزء السفلي: زر المتابعة الثابت ونصوص الشروط والأحكام
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // عند الضغط على متابعة يتم التوجيه لصفحة التسجيل وتمرير النوع المحدد تلقائياً
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(type: _selectedType),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      minimumSize: Size(double.infinity, 52.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 2,
                    ),
                    child: Text(
                      'متابعة',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  // نص الموافقة على الشروط الأسفل الزر
                  Text(
                    'بالنقر على متابعة، فإنك توافق على شروط الخدمة',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}