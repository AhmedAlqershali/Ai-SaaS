import 'package:ai_saas/screens/recently_arrived_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ملاحظة: تأكد من وجود شاشة OfferScreen في مشروعك، سأفترض وجودها أو توجيهها لصفحة فارغة حالياً
import 'package:ai_saas/screens/widgets/bn_screen.dart'; // كمثال للتوجيه

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xff4D41DF);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffF8F9FD),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: const Color(0xff1A1A1A), size: 20.sp),
            onPressed: () => Navigator.maybePop(context),
          ),
          title: Text(
            'الإشعارات',
            style: GoogleFonts.ibmPlexSans(
              color: const Color(0xff1A1A1A),
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.settings_outlined, color: primaryColor, size: 22.sp),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          children: [
            _buildSectionHeader('اليوم'),
            SizedBox(height: 12.h),

            const NotificationCard(
              text: 'عرض 50% على كل القطع المتوفرة لدى محل حكاية. استغل العرض الكمية محدودة 🔥',
              time: '10:30 ص',
              icon: Icons.local_offer_rounded,
              iconColor: Colors.redAccent,
              type: 'offer',
            ),
            SizedBox(height: 12.h),

            const NotificationCard(
              text: 'وصل حديثاً، كولكشن فساتين مناسبات لدى Lovista Store. متوفر بجميع المقاسات والألوان.',
              time: '09:30 ص',
              icon: Icons.auto_awesome_rounded,
              iconColor: Colors.orange,
              type: 'new_arrival',
            ),

            SizedBox(height: 24.h),

            _buildSectionHeader('الأمس'),
            SizedBox(height: 12.h),

            const NotificationCard(
              text: 'تم تحديث حالة طلبك رقم #1024. الطلب الآن في مرحلة التوصيل.',
              time: 'أمس، 08:20 م',
              icon: Icons.local_shipping_rounded,
              iconColor: primaryColor,
              type: 'order_update',
            ),
            SizedBox(height: 12.h),

            const NotificationCard(
              text: 'كوبون خصم جديد بانتظارك! استخدم الكود TRADEX20 للحصول على خصم إضافي.',
              time: 'أمس، 02:15 م',
              icon: Icons.confirmation_number_rounded,
              iconColor: Colors.green,
              type: 'offer',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.ibmPlexSans(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: const Color(0xff1A1A1A),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String text;
  final String time;
  final IconData icon;
  final Color iconColor;
  final String type;

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
        if (type == 'new_arrival') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RecentlyArrivedScreen()),
          );
        } else if (type == 'offer') {
          // يمكن توجيهه لشاشة العروض أو صفحة مخصصة
        }
      },
      child: Container(
        padding: EdgeInsets.all(14.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: const Color(0xffEFEFEF), width: 1.w),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الأيقونة (تظهر جهة اليمين في الـ RTL)
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 24.sp),
            ),
            SizedBox(width: 14.w),
            // محتوى الإشعار
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 13.5.sp,
                      height: 1.5,
                      color: const Color(0xff1A1A1A),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    time,
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 11.sp,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}