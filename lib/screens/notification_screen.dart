import 'package:ai_saas/screens/recently_arrived_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ==========================================
// 1. شاشة الإشعارات الأساسية (Notifications Screen)
// ==========================================
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8fafc), // خلفية الواجهة المائلة للبياض
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: const Color(0xff3f2d56), size: 24.sp),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: Text(
          'الاشعارات',
          style: TextStyle(
            color: const Color(0xff1a1a1a),
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined, color: const Color(0xff3f2d56), size: 24.sp),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.0.h),
        children: [
          // ------ قسم اليوم ------
          _buildSectionHeader('اليوم'),
          SizedBox(height: 10.h),

          const NotificationCard(
            text: 'عرض 50% على كل القطع المتوفرة لدى محل حكاية .\nاستغل العرض الكمية محدودة',
            time: '10:30 am',
            icon: Icons.percent,
            iconColor: Colors.red,
            type: 'offer', // يوجه إلى شاشة العروض
          ),
          SizedBox(height: 12.h),

          const NotificationCard(
            text: 'وصل حديثاً , كولشكن فساتين مناسبات لدى Lovista Store . متوفر بجميع المقاسات والألوان.',
            time: '9:30 am',
            icon: Icons.fiber_new,
            iconColor: Colors.orange,
            type: 'new_arrival', // يوجه إلى شاشة وصل حديثاً
          ),

          SizedBox(height: 24.h),

          // ------ قسم الأمس ------
          _buildSectionHeader('الأمس'),
          SizedBox(height: 10.h),

          const NotificationCard(
            text: 'عرض 50% على كل القطع المتوفرة لدى محل حكاية .\nاستغل العرض الكمية محدودة',
            time: '10:30 am',
            icon: Icons.percent,
            iconColor: Colors.red,
            type: 'offer',
          ),
          SizedBox(height: 12.h),

          const NotificationCard(
            text: 'وصل حديثاً , كولشكن فساتين مناسبات لدى Lovista Store . متوفر بجميع المقاسات والألوان.',
            time: '9:30 am',
            icon: Icons.fiber_new,
            iconColor: Colors.orange,
            type: 'new_arrival',
          ),
        ],
      ),
    );
  }

  // ويدجت عنوان القسم (اليوم / الأمس)
  Widget _buildSectionHeader(String title) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xff1a1a1a),
        ),
      ),
    );
  }
}

// ==========================================
// 2. ويدجت كرت الإشعار الذكي والمنفصل (Notification Card)
// ==========================================
class NotificationCard extends StatelessWidget {
  final String text;
  final String time;
  final IconData icon;
  final Color iconColor;
  final String type; // الفحص عن طريق النوع: 'offer' أو 'new_arrival'

  const NotificationCard({
    Key? key,
    required this.text,
    required this.time,
    required this.icon,
    required this.iconColor,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // فحص نوع الإشعار والانتقال بناءً عليه
        if (type == 'new_arrival') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RecentlyArrivedScreen()),
          );
        } else if (type == 'offer') {

        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colors.grey.shade200, width: 1.5.w),
        ),
        padding: EdgeInsets.all(16.0.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // نص الإشعار والوقت في عمود مرن
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 14.sp,
                      height: 1.5,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            // الأيقونة الدائرية الملونة جهة اليسار
            Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(color: iconColor.withOpacity(0.3), width: 1.w),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 26.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
