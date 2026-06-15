import 'package:ai_saas/models/app_type.dart';
import 'package:ai_saas/screens/auth/forget_password_screen.dart';
import 'package:ai_saas/screens/widgets/bn_screen.dart';
import 'package:ai_saas/screens/widgets/size_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  final AppType type;
  const LoginScreen({super.key,required this.type});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false, // يمنع الشاشة من التغير عند ظهور الكيبورد
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF5145E5), Color(0xFF3B1E91)],
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.auto_awesome,
                        color: Colors.white,
                        size: 50.sp,
                      ),
                      SizedBox(height: 20.h),
                      // العنوان
                      Text(
                        " مرحباً بك في Tradex",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ibmPlexSans(
                          color: Colors.white,
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      // الوصف
                      Text(
                        "المستقبل الذكي لإدارة تجارتك واستثماراتك الرقمية في مكان واحد.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ibmPlexSans(
                          color: Colors.white,
                          fontSize: 18.sp,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "تسجيل الدخول إلى حسابك",
                  style: TextStyle(
                    fontSize: 32.sp,
                    color: const Color(0xFF4A4A4A),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10.h),

                Text(
                  "البريد الإلكتروني ",
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
                SizedBox(height: 8.h),
                SizedBox(
                  height: 40.h,
                  child: TextField(
                    style: const TextStyle(decoration: TextDecoration.none),
                    decoration: InputDecoration(
                      hintText: "example@tradex.com",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                      prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
                      filled: true,
                      fillColor: const Color(0xffF2F3FF),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),

                // حقل كلمة المرور
                Text("كلمة المرور", style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
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
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),

                // تذكرني ونسيت كلمة المرور
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (val) {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                        Text(
                          "تذكرني",
                          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        if (widget.type == AppType.merchant) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen(type: AppType.merchant),
                            ),
                          );
                        } else if (widget.type == AppType.client) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPasswordScreen(type: AppType.client),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "نسيت كلمة المرور؟",
                        style: TextStyle(color: const Color(0xFF5145E5), fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Size_Button(
                    onPressed:(){
                      if (widget.type == AppType.merchant) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BnScreen(type:AppType.merchant ),
                          ),
                        );
                      } else if (widget.type == AppType.client) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BnScreen(type:AppType.client ),
                          ),
                        );
                      }
                    },
                    name: 'تسجيل الدخول',
                    color: const Color(0xFF5145E5),
                    colorname: Colors.white,
                    size: Size(350.w, 40.h),
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color(0xFFE0E0E0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        "أو المتابعة عبر",
                        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color(0xFFE0E0E0),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),

                // أزرار جوجل وآبل
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

                const Spacer(),

                // نص إنشاء حساب جديد
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
                      "ليس لديك حساب؟ ",
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "أنشئ حساباً جديداً",
                        style: TextStyle(
                          color: const Color(0xFF5145E5),
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
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

  // ودجيت فرعية لتصميم الزر الموحد
  Widget socialButton({
    required String label,
    String? imagePath,
    IconData? icon,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
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
