import 'package:ai_saas/screens/nearby_stores_screen.dart';
import 'package:ai_saas/screens/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopperHomePage extends StatefulWidget {
  const ShopperHomePage({super.key});

  @override
  State<ShopperHomePage> createState() => _ShopperHomePageState();
}

class _ShopperHomePageState extends State<ShopperHomePage> {
  // الألوان الثابتة للهوية البصرية
  final Color primaryColor = const Color(0xff4D41DF);
  final Color scaffoldBg = const Color(0xffF8F9FD);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: scaffoldBg,
        body: SafeArea(
          child: Column(
            children: [
              _buildTopBar(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSearchBar(),
                      SizedBox(height: 16.h),
                      _buildHeroBanner(),
                      SizedBox(height: 24.h),
                      _buildCategories(),
                      SizedBox(height: 24.h),
                      _buildNearbyStores(),
                      SizedBox(height: 24.h),
                      _buildNearbyProducts(),
                      SizedBox(height: 24.h),
                      _buildWeekendPromo(),
                      SizedBox(height: 30.h), // مساحة مريحة في الأسفل
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ======= شريط التطبيق العلوي =======
  Widget _buildTopBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22.r,
            backgroundColor: primaryColor.withOpacity(0.1),
            child: Icon(Icons.person_outline_rounded, color: primaryColor, size: 22.sp),
          ),
          SizedBox(width: 10.w),
          _buildNotificationIcon(),
          const Spacer(),
          // قسم الموقع الجغرافي - مع حماية من تداخل النصوص
          Flexible(
            flex: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_on_rounded, color: primaryColor, size: 16.sp),
                    SizedBox(width: 4.w),
                    Flexible(
                      child: Text(
                        'النصيرات',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.ibmPlexSans(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff1A1A1A),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'المنطقة الوسطى',
                  style: GoogleFonts.ibmPlexSans(fontSize: 10.sp, color: Colors.black38),
                )
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu_rounded, size: 26.sp, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationIcon() {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationsScreen())),
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFEFEFEF)),
        ),
        child: Icon(Icons.notifications_none_rounded, size: 22.sp, color: Colors.black87),
      ),
    );
  }

  // ======= حقل البحث =======
  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          style: GoogleFonts.ibmPlexSans(fontSize: 14.sp),
          decoration: InputDecoration(
            hintText: 'ابحث عن منتجات، ماركات، متاجر...',
            hintStyle: GoogleFonts.ibmPlexSans(color: Colors.black38, fontSize: 13.sp),
            prefixIcon: Icon(Icons.search_rounded, color: Colors.black38, size: 22.sp),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
          ),
        ),
      ),
    );
  }

  // ======= البانر الترويجي =======
  Widget _buildHeroBanner() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [primaryColor, const Color(0xff6A5AE0)]),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'تسوّق في النصيرات',
            style: GoogleFonts.ibmPlexSans(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.h),
          Text(
            'أفضل العروض والخصومات القريبة منك 🔥',
            style: GoogleFonts.ibmPlexSans(color: Colors.white.withOpacity(0.9), fontSize: 13.sp),
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: primaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
            ),
            child: Text('اكتشف الآن', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  // ======= التصنيفات =======
  Widget _buildCategories() {
    final categories = [
      {'icon': Icons.checkroom_rounded, 'label': 'ملابس'},
      {'icon': Icons.ice_skating_rounded, 'label': 'أحذية'},
      {'icon': Icons.face_retouching_natural_rounded, 'label': 'كوزمتكس'},
      {'icon': Icons.restaurant_rounded, 'label': 'طعام'},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: categories.map((cat) {
          return Column(
            children: [
              Container(
                width: 65.w,
                height: 65.w, // استخدام w يضمن شكل دائري مثالي
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 5)],
                ),
                child: Icon(cat['icon'] as IconData, color: primaryColor, size: 26.sp),
              ),
              SizedBox(height: 8.h),
              Text(cat['label'] as String, style: GoogleFonts.ibmPlexSans(fontSize: 12.sp, fontWeight: FontWeight.w500)),
            ],
          );
        }).toList(),
      ),
    );
  }

  // ======= المتاجر القريبة =======
  Widget _buildNearbyStores() {
    return Column(
      children: [
        _buildSectionHeader('متاجر قريبة منك', () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NearbyStoresScreen()))),
        SizedBox(height: 12.h),
        SizedBox(
          height: 180.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: 2,
            separatorBuilder: (_, __) => SizedBox(width: 12.w),
            itemBuilder: (context, index) => _buildStoreCard(
              name: index == 0 ? 'معرض حكاية للملابس' : 'بوتيك الرنتيسي للرجال',
              location: 'النصيرات - الشارع العام',
              rating: 4.8,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStoreCard({required String name, required String location, required double rating}) {
    return Container(
      width: 240.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFEFEFEF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.05),
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
              ),
              child: Center(child: Icon(Icons.storefront_rounded, size: 40.sp, color: primaryColor.withOpacity(0.3))),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp)),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.star_rounded, color: Colors.amber, size: 14.sp),
                    SizedBox(width: 4.w),
                    Text('$rating', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold)),
                    SizedBox(width: 8.w),
                    Text(location, style: TextStyle(color: Colors.black38, fontSize: 11.sp)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ======= المنتجات =======
  Widget _buildNearbyProducts() {
    return Column(
      children: [
        _buildSectionHeader('منتجات مختارة لك', () {}),
        SizedBox(height: 12.h),
        // المنتج الرئيسي المتميز
        _buildFeaturedProduct(),
        SizedBox(height: 16.h),
        // شبكة منتجات ثنائية
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Expanded(child: _buildSmallProductCard('نظارات طيار 😎', '85 ₪')),
              SizedBox(width: 12.w),
              Expanded(child: _buildSmallProductCard('حذاء رياضي مريح', '120 ₪')),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedProduct() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFFEFEFEF)),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('✨ سكارف حرير فاخر', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    Text('فخامة بدوية بتصاميم تراثية', style: TextStyle(color: Colors.black45, fontSize: 12.sp)),
                  ],
                ),
                Text('45 ₪', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 18.sp)),
              ],
            ),
          ),
          Container(height: 140.h, width: double.infinity, color: primaryColor.withOpacity(0.02), child: Icon(Icons.shopping_bag_outlined, size: 50.sp, color: primaryColor.withOpacity(0.2))),
          Padding(
            padding: EdgeInsets.all(12.r),
            child: SizedBox(
              width: double.infinity,
              height: 45.h,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: primaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r))),
                child: const Text('أضف إلى السلة', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallProductCard(String name, String price) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16.r), border: Border.all(color: const Color(0xFFEFEFEF))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 90.h, width: double.infinity, color: scaffoldBg, child: Icon(Icons.grid_view_rounded, color: primaryColor.withOpacity(0.2))),
          SizedBox(height: 8.h),
          Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp)),
          SizedBox(height: 4.h),
          Text(price, style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 13.sp)),
        ],
      ),
    );
  }

  // ======= عناصر مساعدة =======
  Widget _buildSectionHeader(String title, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: GoogleFonts.ibmPlexSans(fontSize: 18.sp, fontWeight: FontWeight.bold)),
          TextButton(onPressed: onTap, child: Text('عرض الكل', style: TextStyle(color: primaryColor, fontSize: 13.sp, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  Widget _buildWeekendPromo() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(color: const Color(0xFF1E1B4B), borderRadius: BorderRadius.circular(20.r)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('عروض نهاية الأسبوع 🔥', style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.bold)),
                Text('خصومات تصل إلى 40%', style: TextStyle(color: Colors.white70, fontSize: 11.sp)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: primaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r))),
            child:  Text('احصل عليه', style: TextStyle(color: Colors.white, fontSize: 11.sp)),
          ),
        ],
      ),
    );
  }
}