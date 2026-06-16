import 'package:ai_saas/models/app_type.dart';
import 'package:ai_saas/screens/auth/email_verification_screen.dart';
import 'package:ai_saas/screens/auth/new_password_screen.dart';
import 'package:ai_saas/screens/edit_profile_screen.dart';
import 'package:ai_saas/screens/onboarding2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 3; // لتحديد تبويب "حسابي" كعنصر نشط في شريط التنقل السفلي

  @override
  Widget build(BuildContext context) {
    // الألوان الثابتة المتوافقة مع الهوية البصرية للمشروع والصورة
    const Color primaryColor = Color(0xff623ce7);
    const Color textColor = Color(0xff0d1e3d);
    const Color itemBackgroundColor = Color(0xfff4f6fa);
    const Color scaffoldBgColor = Color(0xfffafdff);

    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl, // تنسيق الواجهة بالكامل باللغة العربية
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 24.0.h),
            child: Column(
              children: [
                // 1. قسم الصورة الشخصية والاسم والموقع
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 90.w,
                        height: 90.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: primaryColor, width: 2.w),
                          image: const DecorationImage(
                            image: NetworkImage('https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&q=80&w=300'), // رابط تجريبي لصورة المستخدم الشخصية
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'أحمد القرشلي',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on_outlined, size: 16.sp, color: Colors.grey),
                          SizedBox(width: 4.w),
                          Text(
                            'غزة، فلسطين',
                            style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 28.h),

                // 2. قائمة خيارات الحساب والتحكم
                _buildMenuOption(
                  title: 'المعلومات الشخصية',
                  icon: Icons.person_outline,
                  backgroundColor: itemBackgroundColor,
                  textColor: textColor,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfileScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 12.h),
                _buildMenuOption(
                  title: 'تغيير كلمة المرور',
                  icon: Icons.lock_open_outlined,
                  backgroundColor: itemBackgroundColor,
                  textColor: textColor,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewPasswordScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 12.h),
                _buildMenuOption(
                  title: 'تسجيل خروج',
                  icon: Icons.logout_outlined,
                  backgroundColor: itemBackgroundColor,
                  textColor: textColor,
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingAIPage(),
                      ),
                          (route) => false,
                    );
                  },
                ),
                SizedBox(height: 28.h),

                // 3. رأس قسم "منتجاتي المفضلة" مع زر عرض الكل
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'منتجاتي المفضلة',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'عرض الكل',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),

                // 4. شبكة عرض المنتجات المفضلة (عمودين متناسقين)
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 16.w,
                  childAspectRatio: 0.78,
                  children: [
                    _buildProductCard(
                      title: 'حذاء رياضي نايكي',
                      price: '240 ₪',
                      imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&q=80&w=300',
                      primaryColor: primaryColor,
                    ),
                    _buildProductCard(
                      title: 'ساعة ذكية Series 9',
                      price: '1200 ₪',
                      imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&q=80&w=300',
                      primaryColor: primaryColor,
                    ),
                    _buildProductCard(
                      title: 'سماعات رأس لاسلكية',
                      price: '450 ₪',
                      imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&q=80&w=300',
                      primaryColor: primaryColor,
                    ),
                    _buildProductCard(
                      title: 'نظارات شمسية',
                      price: '180 ₪',
                      imageUrl: 'https://images.unsplash.com/photo-1572635196237-14b3f281503f?auto=format&fit=crop&q=80&w=300',
                      primaryColor: primaryColor,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),

      // 5. شريط التنقل السفلي المطابق تماماً لأيقونات الصورة
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
          unselectedLabelStyle: TextStyle(fontSize: 12.sp),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_outlined),
              activeIcon: Icon(Icons.grid_view),
              label: 'الفئات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
              label: 'بحث',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              activeIcon: Icon(Icons.person),
              label: 'حسابي',
            ),
          ],
        ),
      ),
    );
  }

  // دالة مساعدة مخصصة لبناء خيارات الحساب والتحكم (Buttons)
  Widget _buildMenuOption({
    required String title,
    required IconData icon,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey, size: 22.sp),
            SizedBox(width: 14.w),
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // دالة مساعدة لبناء كرت المنتج المفضل مع زر الإعجاب العائم
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
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة المنتج + زر القلب الأحمر المفعل تلقائياً
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // زر الإعجاب (القلب الأحمر الدائري في أعلى اليسار)
                Positioned(
                  top: 8.h,
                  left: 8.w,
                  child: Container(
                    padding: EdgeInsets.all(6.r),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // تفاصيل المنتج (الاسم والسعر) أسفل الصورة
          Padding(
            padding: EdgeInsets.all(12.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff0d1e3d),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  price,
                  style:  TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: primaryColor, // اللون البنفسجي المعتمد للأسعار
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
