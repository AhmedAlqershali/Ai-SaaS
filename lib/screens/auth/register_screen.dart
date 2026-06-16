import 'package:ai_saas/models/app_type.dart';
import 'package:ai_saas/screens/auth/code_register.dart';
import 'package:ai_saas/screens/auth/complete_profile_client_screen.dart';
import 'package:ai_saas/screens/auth/complete_registration_merchant_screen.dart';
import 'package:ai_saas/screens/auth/login_screen.dart';
import 'package:ai_saas/screens/widgets/size_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  final AppType type; // هنا نستقبل النوع القادم من الواجهة السابقة

  const RegisterScreen({super.key, required this.type});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // يمنع الشاشة من التغير عند ظهور الكيبورد
        appBar: AppBar(
          title: Text(
            'Tradex',
            style: GoogleFonts.ibmPlexSans(
              fontSize: 32.sp,
              color: const Color(0xff8127CF),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    'انشاء حساب جديد',
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 24.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'انضم إلى مستقبل التجارة الذكية في Tradex',
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 16.sp,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),

                Text(
                  "الاسم بالكامل ",
                  style: GoogleFonts.ibmPlexSans(color: Colors.grey, fontSize: 14.sp),
                ),
                SizedBox(height: 8.h),
                SizedBox(
                  height: 40.h,
                  child: TextField(
                    style: const TextStyle(decoration: TextDecoration.none),
                    decoration: InputDecoration(
                      hintText: "ادخل الاسم الثلاثي",
                      hintStyle: TextStyle(color: Colors.black54, fontSize: 14.sp),
                      prefixIcon: const Icon(
                        Icons.person_outline,
                        color: Colors.black54,
                      ),
                      filled: true,
                      fillColor: const Color(0xffF2F3FF),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "البريد الإلكتروني ",
                  style: GoogleFonts.ibmPlexSans(color: Colors.grey, fontSize: 14.sp),
                ),
                SizedBox(height: 8.h),
                SizedBox(
                  height: 40.h,
                  child: TextField(
                    style: const TextStyle(decoration: TextDecoration.none),
                    decoration: InputDecoration(
                      hintText: "example@tradex.com",
                      hintStyle: TextStyle(color: Colors.black54, fontSize: 14.sp),
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.black54,
                      ),
                      filled: true,
                      fillColor: const Color(0xffF2F3FF),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "رقم الهاتف ",
                  style: GoogleFonts.ibmPlexSans(color: Colors.grey, fontSize: 14.sp),
                ),
                SizedBox(height: 8.h),
                SizedBox(
                  height: 40.h,
                  child: TextField(
                    style: const TextStyle(decoration: TextDecoration.none),
                    decoration: InputDecoration(
                      hintText: "05XXXXXXXX",
                      hintStyle: TextStyle(color: Colors.black54, fontSize: 14.sp),
                      prefixIcon: const Icon(
                        Icons.phone_android_outlined,
                        color: Colors.black54,
                      ),
                      filled: true,
                      fillColor: const Color(0xffF2F3FF),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Text(
                  "كلمة المرور",
                  style: GoogleFonts.ibmPlexSans(color: Colors.grey, fontSize: 14.sp),
                ),
                SizedBox(height: 8.h),
                SizedBox(
                  height: 40.h,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "********",
                      hintStyle: TextStyle(fontSize: 14.sp),
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Colors.grey,
                      ),
                      suffixIcon: const Icon(
                        Icons.visibility_outlined,
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF5F7FF),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (val) {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "أوافق على شروط الخدمة وسياسة الخصوصية الخاصة بـ تراديكس.",
                        style: GoogleFonts.ibmPlexSans(
                          color: const Color(0xff4648D4),
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Center(
                  child: Size_Button(
                    onPressed:(){
                      if (widget.type == AppType.merchant) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CompleteProfileMerchantScreen(type: AppType.merchant,),
                          ),
                        );
                      } else if (widget.type == AppType.client) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CompleteProfileClientScreen() ,
                            ),
                          );
                      }
                    },
                    name: 'انشاء حساب جديد',
                    color: const Color(0xff4648D4),
                    colorname: Colors.white,
                    size: Size(350.w, 40.h),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0E7FF),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10.r,
                            offset: Offset(0, 4.h),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.headset_mic_rounded,
                        color: const Color(0xFF5145E5),
                        size: 25.sp,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      " لديك حساب؟ ",
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (widget.type == AppType.merchant) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(type: AppType.merchant,),
                            ),
                          );
                        } else if (widget.type == AppType.client) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(type: AppType.client,),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "ادخل هنا",
                        style: TextStyle(
                          color: const Color(0xFF5145E5),
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                      child: socialButton(
                        label: "جوجل",
                        imagePath: 'assets/google_logo.png',
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: socialButton(
                        label: "آبل iOS",
                        icon: Icons.apple,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget socialButton({
    required String label,
    String? imagePath,
    IconData? icon,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imagePath != null)
            Icon(Icons.person, size: 24.sp)
          else if (icon != null)
            Icon(icon, size: 24.sp),
          SizedBox(width: 10.w),
          Text(label, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp)),
        ],
      ),
    );
  }
}
