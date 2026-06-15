import 'package:ai_saas/screens/store_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NearbyStoresScreen extends StatelessWidget {
  const NearbyStoresScreen({Key? key}) : super(key: key);

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
          'المتاجر القريبة',
          style: TextStyle(
            color: const Color(0xff1a1a1a),
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.0.h),
        children: const [
          // المتجر الأول: الرئيسي كوزمتكس
          StoreCard(
            storeName: 'الرئيسي كوزمتكس',
            location: 'النصيرات , مقابل هايبر مول',
            rating: '4.7',
            imageUrl: 'https://images.unsplash.com/photo-1441986300917-64674bd600d8?q=80&w=600',
            targetScreen: StoreDetailsScreen(), // نمرر كلاس واجهة تفاصيل المتجر هنا
          ),
          SizedBox(height: 16),

          // المتجر الثاني: معرض حكاية
          StoreCard(
            storeName: 'معرض حكاية للملابس',
            location: 'النصيرات , وسط شارع القسام',
            rating: '4.1',
            imageUrl: 'https://images.unsplash.com/photo-1596462502278-27bfdc403348?q=80&w=600',
            targetScreen: StoreDetailsScreen(), // يمكنك تمرير كلاس آخر مستقبلاً لكل متجر
          ),
          SizedBox(height: 16),

          // المتجر الثالث: wow Fashion
          StoreCard(
            storeName: 'wow Fashion',
            location: 'النصيرات , مقابل هايبر مول',
            rating: '4.5',
            imageUrl: 'https://images.unsplash.com/photo-1525507119028-ed4c629a60a3?q=80&w=600',
            targetScreen: StoreDetailsScreen(),
          ),
        ],
      ),
    );
  }
}

class StoreCard extends StatelessWidget {
  final String storeName;
  final String location;
  final String rating;
  final String imageUrl;
  final Widget targetScreen;

  const StoreCard({
    Key? key,
    required this.storeName,
    required this.location,
    required this.rating,
    required this.imageUrl,
    required this.targetScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetScreen),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.0.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              children: [
                Container(
                  height: 160.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 12.h,
                  left: 12.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 14.sp),
                        SizedBox(width: 4.w),
                        Text(
                          rating,
                          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.0.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    storeName,
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xff1a1a1a)),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        location,
                        style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade600),
                      ),
                      SizedBox(width: 4.w),
                      Icon(Icons.location_on_outlined, size: 16.sp, color: Colors.grey.shade700),
                    ],
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
