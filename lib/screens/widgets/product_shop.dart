import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductShop extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String price;
  final String? badgeText;

  const ProductShop({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    this.badgeText,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // لضبط الاتجاه للعربية
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10.r,
              offset: Offset(0, 5.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // قسم الصورة مع الشارة (Badge)
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                  child: Image.asset(
                    imageUrl,
                    height: 350.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                if (badgeText != null)
                  Positioned(
                    top: 12.h,
                    right: 12.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        badgeText!,
                        style: GoogleFonts.ibmPlexSans(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff4D41DF),
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            Padding(
              padding: EdgeInsets.all(16.0.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // السعر والعنوان في صف واحد
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.ibmPlexSans(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "$price  شيكل",
                        style: GoogleFonts.ibmPlexSans(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff006B5C), // لون السعر الموضح في الصورة
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  // الوصف
                  Text(
                    description,
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 14.sp,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 20.h),
                  // زر إضافة للسلة
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_bag_outlined, size: 20.sp),
                      label: Text(
                        "أضف للسلة",
                        style: GoogleFonts.ibmPlexSans(fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF2F2F7), // لون الزر الفاتح
                        foregroundColor: Colors.black,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
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
