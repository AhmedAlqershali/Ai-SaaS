import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ==========================================
// 1. شاشة الإشعارات (Notifications Screen)
// ==========================================
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xfff8fafc),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: const Color(0xff1a1a1a), size: 20.sp),
            onPressed: () => Navigator.maybePop(context),
          ),
          title: Text(
            'الإشعارات',
            style: GoogleFonts.ibmPlexSans(
              color: const Color(0xff1a1a1a),
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          children: [
            _buildSectionHeader('اليوم'),
            SizedBox(height: 12.h),
            const NotificationCard(
              text: 'عرض 50% على كل القطع المتوفرة لدى محل حكاية. استغل العرض الكمية محدودة',
              time: 'منذ 10 دقائق',
              icon: Icons.percent_rounded,
              iconColor: Colors.red,
              type: 'offer',
            ),
            SizedBox(height: 12.h),
            const NotificationCard(
              text: 'وصل حديثاً، كولكشن فساتين مناسبات لدى Lovista Store. متوفر بجميع المقاسات.',
              time: 'منذ ساعتين',
              icon: Icons.auto_awesome_rounded,
              iconColor: Colors.orange,
              type: 'new_arrival',
            ),
            SizedBox(height: 24.h),
            _buildSectionHeader('الأمس'),
            SizedBox(height: 12.h),
            const NotificationCard(
              text: 'تمت إضافة منتجات جديدة في قسم الإلكترونيات. تصفحها الآن!',
              time: 'أمس، 04:00 مساءً',
              icon: Icons.notifications_active_rounded,
              iconColor: Color(0xff4D41DF),
              type: 'new_arrival',
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
        color: const Color(0xff1a1a1a),
      ),
    );
  }
}

// ==========================================
// 2. كرت الإشعار (Notification Card)
// ==========================================
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => const RecentlyArrivedScreen()));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const OfferScreen()));
        }
      },
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 45.w,
              height: 45.w,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 22.sp),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: GoogleFonts.ibmPlexSans(fontSize: 13.sp, color: Colors.black87, height: 1.4),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    time,
                    style: GoogleFonts.ibmPlexSans(fontSize: 11.sp, color: Colors.grey),
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

// ==========================================
// 3. شاشة "وصل حديثاً" (RecentlyArrivedScreen)
// ==========================================
class RecentlyArrivedScreen extends StatelessWidget {
  const RecentlyArrivedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xfff8fafc),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: const Color(0xff1a1a1a), size: 20.sp),
            onPressed: () => Navigator.maybePop(context),
          ),
          title: Text('وصل حديثاً', style: GoogleFonts.ibmPlexSans(color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(16.r),
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.68, // ضبط التناسب لمنع تداخل النصوص
            crossAxisSpacing: 14.w,
            mainAxisSpacing: 14.h,
          ),
          itemCount: 10,
          itemBuilder: (context, index) => const ProductGridCard(),
        ),
      ),
    );
  }
}

class ProductGridCard extends StatelessWidget {
  const ProductGridCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10)],
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
                    'https://images.unsplash.com/photo-1595777457583-95e059d581b8?q=80&w=500',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: 8.h,
                  left: 8.w,
                  child: CircleAvatar(
                    radius: 15.r,
                    backgroundColor: Colors.white.withOpacity(0.9),
                    child: Icon(Icons.favorite_border_rounded, size: 16.sp, color: Colors.grey),
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
                  'فستان سهرة قصير فاخر',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.ibmPlexSans(fontSize: 13.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('₪220', style: GoogleFonts.ibmPlexSans(fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xff4D41DF))),
                    Row(
                      children: [
                        _buildColorDot(Colors.red.shade900),
                        SizedBox(width: 4.w),
                        _buildColorDot(Colors.black),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorDot(Color color) {
    return Container(
      width: 10.w,
      height: 10.w,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

// ==========================================
// 4. شاشة العروض (OfferScreen)
// ==========================================
class OfferScreen extends StatelessWidget {
  const OfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xfff8fafc),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: const Color(0xff1a1a1a), size: 20.sp),
            onPressed: () => Navigator.maybePop(context),
          ),
          title: Text('العروض والتخفيضات', style: GoogleFonts.ibmPlexSans(color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.local_offer_rounded, size: 80.sp, color: Colors.grey.shade300),
              SizedBox(height: 16.h),
              Text(
                'لا توجد عروض حالياً',
                style: GoogleFonts.ibmPlexSans(fontSize: 16.sp, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}