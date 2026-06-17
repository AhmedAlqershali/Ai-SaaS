import 'package:ai_saas/models/app_type.dart';
import 'package:ai_saas/screens/auth/email_verification_screen.dart';
import 'package:ai_saas/screens/widgets/bn_screen.dart';
import 'package:ai_saas/screens/widgets/size_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  final AppType type;
  const LoginScreen({super.key, required this.type});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF4D41DF);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffF8F9FD),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ======= كارت الترحيب الذكي =======
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(24.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [primaryColor, Color(0xFF3127A5)],
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.auto_awesome, color: Colors.white, size: 40.sp),
                        SizedBox(height: 16.h),
                        Text(
                          "مرحباً بك في Tradex",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.ibmPlexSans(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "المستقبل الذكي لإدارة تجارتك واستثماراتك الرقمية في مكان واحد.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.ibmPlexSans(
                            color: Colors.white.withOpacity(0.85),
                            fontSize: 13.sp,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // ======= عنوان تسجيل الدخول =======
                  Text(
                    "تسجيل الدخول",
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 22.sp,
                      color: const Color(0xFF1A1A1A),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // ======= حقل البريد الإلكتروني =======
                  _buildInputLabel("البريد الإلكتروني"),
                  _buildTextFieldContainer(
                    child: TextField(
                      style: GoogleFonts.ibmPlexSans(fontSize: 14.sp),
                      keyboardType: TextInputType.emailAddress,
                      decoration: _buildInputDecoration(
                        hint: "example@tradex.com",
                        icon: Icons.email_outlined,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // ======= حقل كلمة المرور =======
                  _buildInputLabel("كلمة المرور"),
                  _buildTextFieldContainer(
                    child: TextField(
                      obscureText: _obscureText,
                      style: GoogleFonts.ibmPlexSans(fontSize: 14.sp),
                      decoration: _buildInputDecoration(
                        hint: "********",
                        icon: Icons.lock_outline,
                      ).copyWith(
                        suffixIcon: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                            color: Colors.black38,
                            size: 20.sp,
                          ),
                          onPressed: () => setState(() => _obscureText = !_obscureText),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),

                  // ======= تذكرني ونسيت كلمة المرور =======
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 24.w,
                            height: 24.w,
                            child: Checkbox(
                              value: _rememberMe,
                              activeColor: primaryColor,
                              onChanged: (val) => setState(() => _rememberMe = val ?? false),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "تذكرني",
                            style: GoogleFonts.ibmPlexSans(color: const Color(0xff707070), fontSize: 13.sp),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmailVerificationScreen(
                                type: widget.type,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "نسيت كلمة المرور؟",
                          style: GoogleFonts.ibmPlexSans(color: primaryColor, fontSize: 13.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // ======= زر تسجيل الدخول =======
                  Size_Button(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => BnScreen(type: widget.type)),
                      );
                    },
                    name: 'تسجيل الدخول',
                    color: primaryColor,
                    colorname: Colors.white,
                    size: Size(double.infinity, 54.h),
                  ),
                  SizedBox(height: 24.h),

                  // ======= الفاصل =======
                  _buildDivider(),

                  SizedBox(height: 20.h),

                  // ======= أزرار السوشيال =======
                  Row(
                    children: [
                      Expanded(
                        child: socialButton(label: "جوجل", icon: Icons.g_mobiledata_rounded),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: socialButton(label: "آبل", icon: Icons.apple_rounded),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),

                  // ======= إنشاء حساب جديد =======
                  _buildFooter(primaryColor),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildInputLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        label,
        style: GoogleFonts.ibmPlexSans(color: const Color(0xff707070), fontSize: 13.sp, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildTextFieldContainer({required Widget child}) {
    return Container(
      height: 54.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFEFEFEF)),
      ),
      child: child,
    );
  }

  InputDecoration _buildInputDecoration({required String hint, required IconData icon}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.ibmPlexSans(color: Colors.black26, fontSize: 14.sp),
      prefixIcon: Icon(icon, color: Colors.black38, size: 20.sp),
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(vertical: 14.h),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(child: Divider(thickness: 1, color: Color(0xFFEFEFEF))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text("أو المتابعة عبر", style: GoogleFonts.ibmPlexSans(color: Colors.black38, fontSize: 12.sp)),
        ),
        const Expanded(child: Divider(thickness: 1, color: Color(0xFFEFEFEF))),
      ],
    );
  }

  Widget _buildFooter(Color primaryColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "ليس لديك حساب؟ ",
          style: GoogleFonts.ibmPlexSans(color: const Color(0xff707070), fontSize: 13.sp),
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Text(
            "أنشئ حساباً جديداً",
            style: GoogleFonts.ibmPlexSans(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 13.sp),
          ),
        ),
      ],
    );
  }

  Widget socialButton({required String label, required IconData icon}) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFEFEFEF)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24.sp, color: Colors.black87),
          SizedBox(width: 6.w),
          Text(label, style: GoogleFonts.ibmPlexSans(fontWeight: FontWeight.bold, fontSize: 14.sp, color: Colors.black87)),
        ],
      ),
    );
  }
}