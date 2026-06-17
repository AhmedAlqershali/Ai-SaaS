import 'package:ai_saas/models/app_type.dart';
import 'package:ai_saas/screens/auth/email_verification_screen.dart';
import 'package:ai_saas/screens/auth/new_password_screen.dart';
import 'package:ai_saas/screens/edit_profile_screen.dart';
import 'package:ai_saas/screens/onboarding2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // الألوان الثابتة للهوية البصرية
    final Color primaryColor = const Color(0xff623ce7);
    final Color textColor = const Color(0xff0d1e3d);
    final Color itemBackgroundColor = const Color(0xfff4f6fa);
    final Color scaffoldBgColor = const Color(0xfffafdff);

    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: [
                // 1. قسم الصورة الشخصية
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 100.w,
                        height: 100.w, // استخدام w للطرفين يضمن دائرة مثالية
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: primaryColor.withOpacity(0.2), width: 4.w),
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.1),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            )
                          ],
                          image: const DecorationImage(
                            image: NetworkImage('https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&q=80&w=300'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'أحمد القرشلي',
                        style: GoogleFonts.ibmPlexSans(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on_rounded, size: 16.sp, color: primaryColor),
                          SizedBox(width: 4.w),
                          Text(
                            'غزة، فلسطين',
                            style: GoogleFonts.ibmPlexSans(fontSize: 14.sp, color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),

                // 2. قائمة الخيارات
                _buildMenuOption(
                  title: 'المعلومات الشخصية',
                  icon: Icons.person_outline_rounded,
                  backgroundColor: itemBackgroundColor,
                  textColor: textColor,
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EditProfileScreen())),
                ),
                SizedBox(height: 12.h),
                _buildMenuOption(
                  title: 'تغيير كلمة المرور',
                  icon: Icons.lock_open_rounded,
                  backgroundColor: itemBackgroundColor,
                  textColor: textColor,
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NewPasswordScreen())),
                ),
                SizedBox(height: 12.h),
                _buildMenuOption(
                  title: 'تسجيل خروج',
                  icon: Icons.logout_rounded,
                  backgroundColor: const Color(0xffFFF1F1), // لون خروج مميز
                  textColor: Colors.redAccent,
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const OnboardingAIPage()),
                          (route) => false,
                    );
                  },
                ),
                SizedBox(height: 30.h),

                // 3. قسم المفضلة
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'منتجاتي المفضلة',
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'عرض الكل',
                        style: GoogleFonts.ibmPlexSans(
                          color: primaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),

                // 4. شبكة المنتجات المفضلة
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 16.w,
                    childAspectRatio: 0.72, // تعديل النسبة لمنع التداخل
                  ),
                  itemBuilder: (context, index) {
                    return _buildProductCard(
                      title: index == 0 ? 'حذاء رياضي نايكي' : 'ساعة ذكية Series 9',
                      price: index == 0 ? '240 ₪' : '1200 ₪',
                      imageUrl: index == 0
                          ? 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=300'
                          : 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=300',
                      primaryColor: primaryColor,
                    );
                  },
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuOption({
    required String title,
    required IconData icon,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(icon, color: textColor.withOpacity(0.7), size: 22.sp),
            ),
            SizedBox(width: 16.w),
            Text(
              title,
              style: GoogleFonts.ibmPlexSans(
                color: textColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios_rounded, size: 14.sp, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard({
    required String title,
    required String price,
    required String imageUrl,
    required Color primaryColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8.h,
                  right: 8.w, // تعديل الموقع لليمين ليتناسب مع RTL
                  child: CircleAvatar(
                    radius: 15.r,
                    backgroundColor: Colors.white.withOpacity(0.9),
                    child:  Icon(Icons.favorite, color: Colors.red, size: 16.sp),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.ibmPlexSans(fontSize: 13.sp, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  price,
                  style: GoogleFonts.ibmPlexSans(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}