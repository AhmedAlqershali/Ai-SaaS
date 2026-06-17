import 'package:ai_saas/screens/store_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NearbyStoresScreen extends StatelessWidget {
  const NearbyStoresScreen({Key? key}) : super(key: key);

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
            // أيقونة العودة العصرية
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: const Color(0xff1A1A1A), size: 20.sp),
            onPressed: () => Navigator.maybePop(context),
          ),
          title: Text(
            'المتاجر القريبة',
            style: GoogleFonts.ibmPlexSans(
              color: const Color(0xff1A1A1A),
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
            // استخدام ListView بدون const لأن العناصر تحتوي على .h و .w
            const StoreCard(
              storeName: 'الرئيسي كوزمتكس',
              location: 'النصيرات، مقابل هايبر مول',
              rating: '4.7',
              imageUrl: 'https://images.unsplash.com/photo-1441986300917-64674bd600d8?q=80&w=600',
              targetScreen: StoreDetailsScreen(),
            ),
            SizedBox(height: 16.h),

            const StoreCard(
              storeName: 'معرض حكاية للملابس',
              location: 'النصيرات، وسط شارع القسام',
              rating: '4.1',
              imageUrl: 'https://images.unsplash.com/photo-1596462502278-27bfdc403348?q=80&w=600',
              targetScreen: StoreDetailsScreen(),
            ),
            SizedBox(height: 16.h),

            const StoreCard(
              storeName: 'wow Fashion',
              location: 'النصيرات، مقابل هايبر مول',
              rating: '4.5',
              imageUrl: 'https://images.unsplash.com/photo-1525507119028-ed4c629a60a3?q=80&w=600',
              targetScreen: StoreDetailsScreen(),
            ),
            // مساحة إضافية في الأسفل لضمان عدم التصاق الكرت الأخير بحافة الشاشة
            SizedBox(height: 20.h),
          ],
        ),
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
          borderRadius: BorderRadius.circular(16.r), // زوايا أنعم متناسقة مع باقي التطبيق
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // يبدأ من اليمين في الـ RTL
          children: [
            Stack(
              children: [
                // الصورة مع معالج أخطاء التحميل
                Image.network(
                  imageUrl,
                  height: 160.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 160.h,
                    color: Colors.grey.shade100,
                    child: const Icon(Icons.broken_image, color: Colors.grey),
                  ),
                ),
                // ملصق التقييم
                Positioned(
                  top: 12.h,
                  right: 12.w, // يمين في الـ RTL
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star_rounded, color: Colors.amber, size: 16.sp),
                        SizedBox(width: 4.w),
                        Text(
                          rating,
                          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    storeName,
                    style: GoogleFonts.ibmPlexSans(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff1A1A1A)
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Icon(Icons.location_on_rounded, size: 16.sp, color: const Color(0xff4D41DF)),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: Text(
                          location,
                          style: GoogleFonts.ibmPlexSans(
                              fontSize: 13.sp,
                              color: const Color(0xff707070)
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
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