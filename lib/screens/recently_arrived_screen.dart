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
            type: 'offer', // يوجه إلى OfferScreen
          ),
          SizedBox(height: 12.h),

          const NotificationCard(
            text: 'وصل حديثاً , كولشكن فساتين مناسبات لدى Lovista Store . متوفر بجميع المقاسات والألوان.',
            time: '9:30 am',
            icon: Icons.fiber_new,
            iconColor: Colors.orange,
            type: 'new_arrival', // يوجه إلى RecentlyArrivedScreen
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
            type: 'offer', // يوجه إلى OfferScreen
          ),
          SizedBox(height: 12.h),

          const NotificationCard(
            text: 'وصل حديثاً , كولشكن فساتين مناسبات لدى Lovista Store . متوفر بجميع المقاسات والألوان.',
            time: '9:30 am',
            icon: Icons.fiber_new,
            iconColor: Colors.orange,
            type: 'new_arrival', // يوجه إلى RecentlyArrivedScreen
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
// 2. ويدجت كرت الإشعار (Notification Card) مع الفحص الذكي
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
        // فحص نوع الإشعار والانتقال بناءً على طلبك الدقيق للكلاسات
        if (type == 'new_arrival') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RecentlyArrivedScreen()),
          );
        } else if (type == 'offer') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OfferScreen()),
          );
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

// ==========================================
// 3. شاشة "وصل حديثاً" (RecentlyArrivedScreen)
// ==========================================
class RecentlyArrivedScreen extends StatelessWidget {
  const RecentlyArrivedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8fafc),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: const Color(0xff1a1a1a), size: 24.sp),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: Text(
          'وصل حديثاً',
          style: TextStyle(
            color: const Color(0xff1a1a1a),
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0.r),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.72,
          crossAxisSpacing: 16.0.w,
          mainAxisSpacing: 16.0.h,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return _buildProductCard();
        },
      ),
    );
  }

  Widget _buildProductCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0.r),
                    image: const DecorationImage(
                      image: NetworkImage('https://images.unsplash.com/photo-1595777457583-95e059d581b8?q=80&w=500'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: Container(
                    width: 32.w,
                    height: 30.h,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.black54,
                      size: 18.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'فستان سهرة قصير',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff1a1a1a),
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _buildColorDot(const Color(0xff912b39)),
                        SizedBox(width: 4.w),
                        _buildColorDot(Colors.black),
                        SizedBox(width: 4.w),
                        _buildColorDot(const Color(0xff0f4c81)),
                      ],
                    ),
                    Text(
                      '₪220',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
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
      width: 12.w,
      height: 12.h,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

// ==========================================
// 4. شاشة العروض المحدثة (OfferScreen)
// ==========================================
class OfferScreen extends StatelessWidget {
  const OfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8fafc),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: const Color(0xff1a1a1a), size: 24.sp),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: Text(
          'العروض والتخفيضات',
          style: TextStyle(
            color: const Color(0xff1a1a1a),
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'مرحباً بك في واجهة العروض (OfferScreen)',
          style: TextStyle(fontSize: 18.sp, color: Colors.grey, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
