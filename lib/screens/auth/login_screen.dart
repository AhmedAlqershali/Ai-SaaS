import 'package:ai_saas/screens/auth/forget_password_screen.dart';
import 'package:ai_saas/screens/shopper_home.dart';
import 'package:ai_saas/screens/widgets/size_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF5145E5), Color(0xFF3B1E91)],
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.auto_awesome,
                        color: Colors.white,
                        size: 50,
                      ),
                      const SizedBox(height: 20),
                      // العنوان
                      Text(
                        " مرحباً بك في Tradex",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ibmPlexSans(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      // الوصف
                      Text(
                        "المستقبل الذكي لإدارة تجارتك واستثماراتك الرقمية في مكان واحد.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ibmPlexSans(
                          color: Colors.white,
                          fontSize: 18,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(
                  "تسجيل الدخول إلى حسابك",
                  style: TextStyle(
                    fontSize: 32,
                    color: Color(0xFF4A4A4A),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),

                const Text(
                  "البريد الإلكتروني ",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 60,
                  child: TextField(
                    style: TextStyle(decoration: TextDecoration.none),
                    decoration: InputDecoration(

                      hintText: "example@tradex.com",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                      prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
                      filled: true,
                      fillColor: const Color(0xffF2F3FF),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // حقل كلمة المرور
                const Text("كلمة المرور", style: TextStyle(color: Colors.grey)),
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
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

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
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const Text(
                          "تذكرني",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen(), // واجهة تسجيل الدخول الخاصة بك
                          ),
                        );


                      },
                      child: const Text(
                        "نسيت كلمة المرور؟",
                        style: TextStyle(color: Color(0xFF5145E5)),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Size_Button(
                    onPressed:(){

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ShopperHomePage(), // واجهة تسجيل الدخول الخاصة بك
                        ),
                      );

                    },

                    name: 'تسجيل الدخول',
                    color: Color(0xFF5145E5),
                    colorname: Colors.white,
                    size: Size(350, 60),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color(0xFFE0E0E0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "أو المتابعة عبر",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color(0xFFE0E0E0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // أزرار جوجل وآبل
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

                const SizedBox(height: 30),

                // نص إنشاء حساب جديد
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
                      "ليس لديك حساب؟ ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "أنشئ حساباً جديداً",
                        style: TextStyle(
                          color: Color(0xFF5145E5),
                          fontWeight: FontWeight.bold,
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
