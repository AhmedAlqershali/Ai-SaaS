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
  final AppType type;

  const RegisterScreen({super.key, required this.type});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscureText = true;
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffF8F9FD),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87, size: 20.sp),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Tradex',
            style: GoogleFonts.ibmPlexSans(
              fontSize: 24.sp, // تقليل بسيط لضمان التوافق
              fontWeight: FontWeight.bold,
              color: const Color(0xff4D41DF),
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ======= العناوين =======
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'إنشاء حساب جديد',
                          style: GoogleFonts.ibmPlexSans(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff1A1A1A),
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          'انضم إلى مستقبل التجارة الذكية في Tradex',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.ibmPlexSans(
                            fontSize: 13.sp,
                            color: const Color(0xff707070),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),

                  // ======= الحقول =======
                  _buildInputLabel("الاسم بالكامل"),
                  _buildTextFieldContainer(
                    child: TextField(
                      style: GoogleFonts.ibmPlexSans(fontSize: 14.sp),
                      decoration: _buildInputDecoration(
                        hintText: "أدخل الاسم الثلاثي",
                        icon: Icons.person_outline_rounded,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  _buildInputLabel("البريد الإلكتروني"),
                  _buildTextFieldContainer(
                    child: TextField(
                      style: GoogleFonts.ibmPlexSans(fontSize: 14.sp),
                      keyboardType: TextInputType.emailAddress,
                      decoration: _buildInputDecoration(
                        hintText: "example@tradex.com",
                        icon: Icons.email_outlined,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  _buildInputLabel("رقم الهاتف"),
                  _buildTextFieldContainer(
                    child: TextField(
                      style: GoogleFonts.ibmPlexSans(fontSize: 14.sp),
                      keyboardType: TextInputType.phone,
                      decoration: _buildInputDecoration(
                        hintText: "05XXXXXXXX",
                        icon: Icons.phone_android_outlined,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  _buildInputLabel("كلمة المرور"),
                  _buildTextFieldContainer(
                    child: TextField(
                      obscureText: _obscureText,
                      style: GoogleFonts.ibmPlexSans(fontSize: 14.sp),
                      decoration: _buildInputDecoration(
                        hintText: "********",
                        icon: Icons.lock_outline_rounded,
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
                  SizedBox(height: 12.h),

                  // ======= شروط الخدمة =======
                  Row(
                    children: [
                      SizedBox(
                        width: 24.w,
                        height: 24.w,
                        child: Checkbox(
                          value: _agreeToTerms,
                          activeColor: const Color(0xff4D41DF),
                          onChanged: (val) => setState(() => _agreeToTerms = val ?? false),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Text(
                          "أوافق على شروط الخدمة وسياسة الخصوصية",
                          style: GoogleFonts.ibmPlexSans(
                            color: const Color(0xff4D41DF),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),

                  // ======= زر المتابعة =======
                  Size_Button(
                    onPressed: () {
                      if (widget.type == AppType.merchant) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CompleteProfileMerchantScreen(type: AppType.merchant),
                          ),
                        );
                      } else if (widget.type == AppType.client) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CompleteProfileClientScreen(),
                          ),
                        );
                      }
                    },
                    name: 'إنشاء حساب جديد',
                    color: const Color(0xff4D41DF),
                    colorname: Colors.white,
                    size: Size(double.infinity, 54.h),
                  ),
                  SizedBox(height: 20.h),

                  // ======= هل لديك حساب؟ =======
                  _buildLoginRedirect(),

                  SizedBox(height: 24.h),

                  // ======= الفاصل =======
                  _buildSocialDivider(),

                  SizedBox(height: 20.h),

                  // ======= أزرار السوشيال =======
                  Row(
                    children: [
                      Expanded(
                        child: socialButton(
                          label: "جوجل",
                          icon: Icons.g_mobiledata_rounded,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: socialButton(
                          label: "آبل",
                          icon: Icons.apple_rounded,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h, right: 4.w),
      child: Text(
        label,
        style: GoogleFonts.ibmPlexSans(
          color: const Color(0xff707070),
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildTextFieldContainer({required Widget child}) {
    return Container(
      height: 54.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFEFEFEF)),
      ),
      child: child,
    );
  }

  InputDecoration _buildInputDecoration({required String hintText, required IconData icon}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: GoogleFonts.ibmPlexSans(color: Colors.black26, fontSize: 13.sp),
      prefixIcon: Icon(icon, color: Colors.black38, size: 20.sp),
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(vertical: 15.h),
    );
  }

  Widget _buildLoginRedirect() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "لديك حساب بالفعل؟ ",
          style: GoogleFonts.ibmPlexSans(color: const Color(0xff707070), fontSize: 13.sp),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(type: widget.type),
              ),
            );
          },
          child: Text(
            "سجل دخولك",
            style: GoogleFonts.ibmPlexSans(
              color: const Color(0xFF4D41DF),
              fontWeight: FontWeight.bold,
              fontSize: 13.sp,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSocialDivider() {
    return Row(
      children: [
        const Expanded(child: Divider(thickness: 1, color: Color(0xFFEFEFEF))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text(
            "أو التسجيل عبر",
            style: GoogleFonts.ibmPlexSans(color: Colors.black38, fontSize: 11.sp),
          ),
        ),
        const Expanded(child: Divider(thickness: 1, color: Color(0xFFEFEFEF))),
      ],
    );
  }

  Widget socialButton({required String label, required IconData icon}) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFEFEFEF)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 22.sp, color: Colors.black87),
          SizedBox(width: 6.w),
          Text(
            label,
            style: GoogleFonts.ibmPlexSans(
              fontWeight: FontWeight.bold,
              fontSize: 13.sp,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}