import 'package:ai_saas/models/app_type.dart';
import 'package:ai_saas/screens/auth/code_register.dart';
import 'package:ai_saas/screens/auth/complete_registration_screen.dart';
import 'package:ai_saas/screens/auth/login_screen.dart';
import 'package:ai_saas/screens/home_screen.dart';
import 'package:ai_saas/screens/shopper_home.dart';
import 'package:ai_saas/screens/user_selection.dart';
import 'package:ai_saas/screens/widgets/size_button.dart';
import 'package:flutter/material.dart';
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
              fontSize: 32,
              color: Color(0xff8127CF),
            ),
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.close))],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    'انشاء حساب جديد',
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'انضم إلى مستقبل التجارة الذكية في Tradex',
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Text(
                  "الاسم بالكامل ",
                  style: GoogleFonts.ibmPlexSans(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 60,
                  child: TextField(
                    style: TextStyle(decoration: TextDecoration.none),
                    decoration: InputDecoration(
                      hintText: "ادخل الاسم الثلاثي",
                      hintStyle: TextStyle(color: Colors.black54, fontSize: 14),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.black54,
                      ),
                      filled: true,
                      fillColor: Color(0xffF2F3FF),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "البريد الإلكتروني ",
                  style: GoogleFonts.ibmPlexSans(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 60,
                  child: TextField(
                    style: TextStyle(decoration: TextDecoration.none),
                    decoration: InputDecoration(
                      hintText: "example@tradex.com",
                      hintStyle: TextStyle(color: Colors.black54, fontSize: 14),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.black54,
                      ),
                      filled: true,
                      fillColor: Color(0xffF2F3FF),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "رقم الهاتف ",
                  style: GoogleFonts.ibmPlexSans(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 60,
                  child: TextField(
                    style: TextStyle(decoration: TextDecoration.none),
                    decoration: InputDecoration(
                      hintText: "05XXXXXXXX",
                      hintStyle: TextStyle(color: Colors.black54, fontSize: 14),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.black54,
                      ),
                      filled: true,
                      fillColor: Color(0xffF2F3FF),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "كلمة المرور",
                  style: GoogleFonts.ibmPlexSans(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 60,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "********",
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
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (val) {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Text(
                      " الخاصة بـ تراديكس. سياسة الخصوصيةوشروط الخدمةأوافق على",
                      style: GoogleFonts.ibmPlexSans(
                        color: const Color(0xff4648D4),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Size_Button(
                    onPressed:(){
                      {
                        // نقوم بالفحص بناءً على النوع الممرر للواجهة باستخدام widget.type
                        if (widget.type == AppType.merchant) {
                          // إذا كان القادم متسوق (صاحب المتجر/المسوق) -> ينقله لواجهة إكمال الملف الشخصي
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CompleteProfileScreen(type: AppType.merchant,), // واجهة غزة ورقم الجوال
                            ),
                          );

                        } else if (widget.type == AppType.client) {

                          // إذا كان القادم صاحب المشروع (العميل) -> ينقله مباشرة لواجهة تسجيل الدخول (أو الرئيسية)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  CodeRegister(type:AppType.client), // واجهة تسجيل الدخول الخاصة بك
                            ),
                          );

                        }
                      }
                    },
                    name: 'انشاء حساب جديد',
                    color: Color(0xff4648D4),
                    colorname: Colors.white,
                    size: Size(350, 60),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0E7FF), // نفس لون الخلفية الزرقاء الفاتحة في صورتك
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.headset_mic_rounded, // أيقونة الدعم الفني
                        color: Color(0xFF5145E5),  // لون الأيقونة البنفسجي
                        size: 25,
                      ),
                    ),
                    SizedBox(width: 10,),
                    const Text(
                      " لديك حساب؟ ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        // نقوم بالفحص بناءً على النوع الممرر للواجهة باستخدام widget.type
                        if (widget.type == AppType.merchant) {

                          // إذا كان القادم متسوق (صاحب المتجر/المسوق) -> ينقله لواجهة إكمال الملف الشخصي
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CompleteProfileScreen(type: AppType.merchant,), // واجهة غزة ورقم الجوال
                            ),
                          );

                        } else if (widget.type == AppType.client) {

                          // إذا كان القادم صاحب المشروع (العميل) -> ينقله مباشرة لواجهة تسجيل الدخول (أو الرئيسية)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(type: AppType.client,), // واجهة تسجيل الدخول الخاصة بك
                            ),
                          );

                        }
                      },
                      child: const Text(
                        "ادخل هناً",
                        style: TextStyle(
                          color: Color(0xFF5145E5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    // زر جوجل
                    Expanded(
                      child: socialButton(
                        label: "جوجل",
                        imagePath:
                        'assets/google_logo.png', // تأكد من إضافة المسار الصحيح
                      ),
                    ),
                    const SizedBox(width: 15),
                    // زر آبل
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
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imagePath != null)
            Icon(Icons.person)
          else if (icon != null)
            Icon(icon, size: 24),
          const SizedBox(width: 10),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),


        ],
      ),
    );
  }
}
