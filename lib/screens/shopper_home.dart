import 'package:ai_saas/screens/nearby_stores_screen.dart';
import 'package:ai_saas/screens/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopperHomePage extends StatefulWidget {
  const ShopperHomePage({super.key});

  @override
  State<ShopperHomePage> createState() => _ShopperHomePageState();
}

class _ShopperHomePageState extends State<ShopperHomePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: SafeArea(
          child: Column(
            children: [
              _buildTopBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSearchBar(),
                      _buildHeroBanner(),
                      SizedBox(height: 20.h),
                      _buildCategories(),
                      SizedBox(height: 20.h),
                      _buildNearbyStores(),
                      SizedBox(height: 20.h),
                      _buildNearbyProducts(),
                      SizedBox(height: 20.h),
                      _buildWeekendPromo(),
                      SizedBox(height: 80.h),
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

  Widget _buildTopBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: const Color(0xFF5B4FCF),
            child: Icon(Icons.person, color: Colors.white, size: 20.sp),
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsScreen(),
                ),
              );
            },
              child: Icon(Icons.notifications_outlined, size: 24.sp)),
          const Spacer(),
          Text(
            'النصيرات',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 4.w),
          Icon(Icons.location_on, color: const Color(0xFF5B4FCF), size: 16.sp),
          const Spacer(),
          Icon(Icons.menu, size: 24.sp),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: TextField(
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: 'ابحث عن منتجات , ماركات , متاجر ........',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 13.sp),
            prefixIcon: Icon(Icons.search, color: Colors.grey, size: 20.sp),
            border: InputBorder.none,
            contentPadding:
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroBanner() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Container(
        height: 180.h,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF5B4FCF), Color(0xFF7B6FEF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.25),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                'عرض لفترة محدودة',
                style: TextStyle(color: Colors.white, fontSize: 11.sp),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'تسوّق في النصيرات',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'أفضل العروض في النصيرات 🔥',
              style: TextStyle(color: Colors.white70, fontSize: 13.sp),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF5B4FCF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  padding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                ),
                child: Text(
                  'اكتشف الان',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories() {
    final categories = [
      {'icon': Icons.checkroom, 'label': 'ملابس'},
      {'icon': Icons.sports_handball, 'label': 'احذية'},
      {'icon': Icons.face, 'label': 'كوزمتكس'},
      {'icon': Icons.restaurant, 'label': 'طعام'},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: categories.map((cat) {
          return Column(
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      blurRadius: 8.r,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                ),
                child: Icon(
                  cat['icon'] as IconData,
                  color: const Color(0xFF5B4FCF),
                  size: 26.sp,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                cat['label'] as String,
                style: TextStyle(fontSize: 12.sp),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildNearbyStores() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NearbyStoresScreen(),
                    ),
                  );
                },
                child: Text(
                  'عرض المزيد',
                  style: TextStyle(color: const Color(0xFF5B4FCF), fontSize: 13.sp),
                ),
              ),
              Text(
                'متاجر قريبة',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 160.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(right: 16.w),
            children: [
              _buildStoreCard(
                name: 'معرض حكاية للملابس',
                location: 'النصيرات وسط شارع القسام .',
                rating: 4.9,
                isMain: true,
              ),
              SizedBox(width: 10.w),
              _buildStoreCard(
                name: 'الرنتيز\nالنصير',
                location: '',
                rating: null,
                isMain: false,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStoreCard({
    required String name,
    required String location,
    required double? rating,
    required bool isMain,
  }) {
    if (!isMain) {
      return Container(
        width: 100.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          image: const DecorationImage(
            image: NetworkImage(
                'https://via.placeholder.com/100x160/cccccc/999999?text=Store'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: EdgeInsets.all(8.r),
          alignment: Alignment.bottomRight,
          child: Text(
            name,
            style: TextStyle(
                color: Colors.white,
                fontSize: 11.sp,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),
        ),
      );
    }

    return Container(
      width: 220.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(12.r)),
                child: Container(
                  height: 100.h,
                  width: double.infinity,
                  color: const Color(0xFF8B7355),
                  child: Icon(Icons.store, size: 50.sp, color: Colors.white54),
                ),
              ),
              if (rating != null)
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 14.sp),
                        SizedBox(width: 2.w),
                        Text(
                          '$rating',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 13.sp),
                ),
                if (location.isNotEmpty)
                  Text(
                    location,
                    style: TextStyle(color: Colors.grey, fontSize: 11.sp),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNearbyProducts() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4.r,
                    ),
                  ],
                ),
                child: Icon(Icons.tune, size: 20.sp),
              ),
              Text(
                'منتجات مختارة',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        // Featured Product Card
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.07),
                  blurRadius: 10.r,
                  offset: Offset(0, 4.h),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(12.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: const Color(0xFF5B4FCF),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Text(
                              'الرائج الان',
                              style:
                              TextStyle(color: Colors.white, fontSize: 11.sp),
                            ),
                          ),
                          Text(
                            '45.00 ش',
                            style: TextStyle(
                              color: const Color(0xFF5B4FCF),
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        '✨ سكارف حرير فاخر',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'فخامة بدوية من قلب غزة ✨\nبتصاميم تراثية مميزة',
                        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(0)),
                  child: Container(
                    height: 200.h,
                    width: double.infinity,
                    color: const Color(0xFF8B2FC9),
                    child: Icon(Icons.shopping_bag,
                        size: 80.sp, color: Colors.white38),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.r),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart_outlined, size: 20.sp),
                      label: Text('اضف الى السلة', style: TextStyle(fontSize: 16.sp)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5B4FCF),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.h),
        // Product Grid
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Expanded(
                child: _buildProductCard(
                  name: 'نظارات طيار رائقة 😎',
                  price: '85 ش',
                  distance: 'يبعد 0.5 كم',
                  color: const Color(0xFF2C2C2C),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildProductCard(
                  name: 'حذاء رياضي أحمر سريع',
                  price: '120 ش',
                  distance: 'يبعد 2.1 كم',
                  color: const Color(0xFFFF4444),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard({
    required String name,
    required String price,
    required String distance,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(12.r)),
                child: Container(
                  height: 120.h,
                  width: double.infinity,
                  color: color.withOpacity(0.15),
                  child: Icon(Icons.shopping_bag, size: 50.sp, color: color),
                ),
              ),
              Positioned(
                top: 8.h,
                left: 8.w,
                child: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.favorite_border,
                      size: 16.sp, color: Colors.grey),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 12.sp, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 4.h),
                Text(
                  distance,
                  style: TextStyle(color: Colors.grey, fontSize: 10.sp),
                ),
                SizedBox(height: 4.h),
                Text(
                  price,
                  style: TextStyle(
                    color: const Color(0xFF5B4FCF),
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekendPromo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A2E),
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.all(20.r),
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4CAF50),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                padding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              ),
              child: Text(
                'احصل على العرض',
                style: TextStyle(fontSize: 11.sp),
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'عروض التقنية لعطلة',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'نهاية الأسبوع 🔥',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'خصومات حتى %40 🎉',
                  style: TextStyle(color: Colors.white70, fontSize: 11.sp),
                ),
                Text(
                  'على أجهزة الفعل القريبة منك',
                  style: TextStyle(color: Colors.white70, fontSize: 11.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
