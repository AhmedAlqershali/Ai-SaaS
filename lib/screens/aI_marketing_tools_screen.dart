import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/colors.dart';


// ─── Dashboard SCREEN ──────────────────────────────────────────────────────────────
class AlMarketingToolsScreen extends StatefulWidget {
  const AlMarketingToolsScreen({super.key});

  @override
  State<AlMarketingToolsScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<AlMarketingToolsScreen> {
  int _selectedIndex = 1; // Dashboard selected by default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 20.h),
          child: Column(
            children: [
              _buildTopBar(),
              _buildHeroBanner(),
              SizedBox(height: 24.h),
              _buildToolCard(
                tag: 'الأكثر استخداماً',
                icon: Icons.description_outlined,
                iconColor: AppColors.purple,
                title: 'كتابة وصف منتج',
                subtitle: 'حوّل مواصفات منتجك إلى نصوص بيعية جذابة تقنع العميل بالشراء فوراً.',
                buttonText: 'ابدأ الوصف ←',
                buttonColor: AppColors.purple,
              ),
              _buildToolCard(
                icon: Icons.camera_alt_outlined,
                iconColor: AppColors.orange,
                title: 'إنشاء بوست انستغرام',
                subtitle: 'احصل على أفكار لمحتوى الصور والتعليقات المناسبة لكل منصة اجتماعية.',
                buttonText: 'صمم المنشور ←',
                buttonColor: AppColors.orange,
              ),
              _buildToolCard(
                icon: Icons.tag,
                iconColor: AppColors.teal,
                title: 'توليد هاشتاقات',
                subtitle: 'ارفع نسبة الوصول لمنشوراتك باستخدام هاشتاقات ذكية ومخصصة.',
                buttonText: 'توليد الآن',
                buttonColor: AppColors.teal,
              ),
              _buildToolCard(
                icon: Icons.chat_bubble_outline,
                iconColor: AppColors.pink,
                title: 'كتابة ردود للعملاء',
                subtitle: 'ردود سريعة واحترافية على استفسارات العملاء وشكاواهم بكل لباقة.',
                buttonText: 'رد ذكي',
                buttonColor: AppColors.pink,
              ),
              SizedBox(height: 16.h),
              _buildAccuracyCard(),
              SizedBox(height: 24.h),
              _buildRecentOperations(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // ── TOP BAR ─────────────────────────────────────────────────────────────────
  Widget _buildTopBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          // Avatar
          Container(
            width: 38.w,
            height: 38.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.purple.withOpacity(0.15),
            ),
            child: Icon(Icons.person, color: AppColors.purple, size: 22.sp),
          ),
          SizedBox(width: 10.w),
          Text(
            'Oasis AI',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const Spacer(),
          // Notifications
          Stack(
            children: [
              Icon(Icons.notifications_none, size: 26.sp, color: AppColors.textDark),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 8.w,
                  height: 8.h,
                  decoration: const BoxDecoration(
                    color: AppColors.orange,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 14.w),
          Icon(Icons.menu, size: 26.sp, color: AppColors.textDark),
        ],
      ),
    );
  }

  // ── HERO BANNER ─────────────────────────────────────────────────────────────
  Widget _buildHeroBanner() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.all(28.r),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF7B6FFF), Color(0xFF5A4FDF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'مساعدك الذكي\nلإدارة متجرك\nباحترافية',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
                height: 1.4,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              'استخدم أدوات الذكاء الاصطناعي لتوفير وزيادة مبيعاتك بضغطة زر واحدة.',
              style: TextStyle(
                color: AppColors.white.withOpacity(0.85),
                fontSize: 14.sp,
                height: 1.5,
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                _heroButton('ابدأ الآن', AppColors.white, AppColors.purple),
                SizedBox(width: 12.w),
                _heroButton(
                  'شاهد الشرح',
                  Colors.transparent,
                  AppColors.white,
                  isOutlined: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _heroButton(String text, Color bg, Color textColor,
      {bool isOutlined = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 11.h),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12.r),
        border: isOutlined ? Border.all(color: AppColors.white, width: 1.5.w) : null,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
        ),
      ),
    );
  }

  // ── TOOL CARD ────────────────────────────────────────────────────────────────
  Widget _buildToolCard({
    String? tag,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String buttonText,
    required Color buttonColor,
  }) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: AppColors.cardWhite,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 44.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(icon, color: iconColor, size: 22.sp),
                ),
                if (tag != null) ...[
                  const Spacer(),
                  Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: AppColors.green.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(
                        color: AppColors.green,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            SizedBox(height: 14.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 13.sp,
                color: AppColors.textGray,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 11.h),
                decoration: BoxDecoration(
                  color: buttonColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: buttonColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── ACCURACY CARD ─────────────────────────────────────────────────────────
  Widget _buildAccuracyCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppColors.darkBg,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        children: [
          Text(
            '98%',
            style: TextStyle(
              color: AppColors.green,
              fontSize: 52.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'دقة المحتوى المولود بواسطة AI',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            'بناءً على أكثر من 10,000 محتوى تم إنشاؤه',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white.withOpacity(0.45),
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }

  // ── RECENT OPERATIONS ────────────────────────────────────────────────────
  Widget _buildRecentOperations() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'آخر العمليات',
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'عرض السجل',
                    style: TextStyle(color: AppColors.purple, fontSize: 13.sp),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            _recentItem(
              icon: Icons.description_outlined,
              iconColor: AppColors.purple,
              title: 'وصف منتج: عطر "واحة النخيل"',
              time: 'قبل ١٥ دقيقة',
            ),
            SizedBox(height: 10.h),
            _recentItem(
              icon: Icons.share_outlined,
              iconColor: AppColors.orange,
              title: 'منشور انستغرام: تخفيضات الشتاء',
              time: 'قبل ٤٥ دقيقة',
            ),
          ],
        ),
      ),
    );
  }

  Widget _recentItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String time,
  }) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(icon, color: iconColor, size: 20.sp),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.textGray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── BOTTOM NAV ───────────────────────────────────────────────────────────
  Widget _buildBottomNav() {
    final items = [
      _NavItem(icon: Icons.person_outline, label: 'الحساب', index: 0),
      _NavItem(icon: Icons.grid_view_rounded, label: 'لوحة التحكم', index: 1),
      _NavItem(icon: Icons.search, label: 'بحث', index: 2),
      _NavItem(icon: Icons.home_outlined, label: 'الرئيسية', index: 3),
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.cardWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 16.r,
              offset: Offset(0, -4.h),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            final isSelected = _selectedIndex == item.index;
            return GestureDetector(
              onTap: () => setState(() => _selectedIndex = item.index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding:
                EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.purple.withOpacity(0.12)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      item.icon,
                      color: isSelected ? AppColors.purple : AppColors.textGray,
                      size: 24.sp,
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      item.label,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color:
                        isSelected ? AppColors.purple : AppColors.textGray,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  final int index;
  const _NavItem({required this.icon, required this.label, required this.index});
}
