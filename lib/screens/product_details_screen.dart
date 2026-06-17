import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // ضمان الاتجاه العربي
      child: Scaffold(
        backgroundColor: const Color(0xffF8F9FD),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ------ 1. صورة المنتج والأزرار العائمة ------
                    Stack(
                      children: [
                        Container(
                          height: 380.h,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?q=80&w=500',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                          ),
                        ),
                        // زر العودة
                        Positioned(
                          top: 40.h,
                          right: 16.w,
                          child: _buildCircularButton(
                            icon: Icons.arrow_back_ios_new_rounded,
                            onTap: () => Navigator.maybePop(context),
                          ),
                        ),
                        // زر المفضلة
                        Positioned(
                          top: 40.h,
                          left: 16.w,
                          child: _buildCircularButton(
                            icon: Icons.favorite_border_rounded,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),

                    // ------ 2. تفاصيل المنتج ------
                    Padding(
                      padding: EdgeInsets.all(20.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Anua',
                            style: GoogleFonts.ibmPlexSans(
                                fontSize: 14.sp,
                                color: const Color(0xff4D41DF),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            'سيروم نياسيناميد 70%',
                            style: GoogleFonts.ibmPlexSans(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff1A1A1A)
                            ),
                          ),
                          SizedBox(height: 20.h),

                          _buildSectionTitle('الوصف'),
                          SizedBox(height: 8.h),
                          Text(
                            'امنحي بشرتك الإشراقة التي تستحقها مع سيروم الخوخ من Anua. يعمل بتركيز عالٍ من مستخلص الخوخ والنياسيناميد على تفتيح البشرة وتوحيد لونها.',
                            style: GoogleFonts.ibmPlexSans(
                                fontSize: 13.sp,
                                color: const Color(0xff707070),
                                height: 1.6
                            ),
                          ),
                          SizedBox(height: 20.h),

                          _buildSectionTitle('طريقة الاستخدام'),
                          SizedBox(height: 8.h),
                          Text(
                            'ضعي 2-3 قطرات على بشرة نظيفة بعد استخدام التونر، ودلكيها بلطف حتى تمتصها البشرة تماماً.',
                            style: GoogleFonts.ibmPlexSans(
                                fontSize: 13.sp,
                                color: const Color(0xff707070),
                                height: 1.6
                            ),
                          ),
                          SizedBox(height: 30.h),

                          // ------ 3. السعر والكمية ------
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '₪120',
                                style: GoogleFonts.ibmPlexSans(
                                    fontSize: 26.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xff1A1A1A)
                                ),
                              ),
                              _buildQuantityStepper(),
                            ],
                          ),
                          SizedBox(height: 30.h),

                          // ------ 4. قسم منتجات أخرى ------
                          _buildSectionTitle('منتجات قد تعجبك'),
                          SizedBox(height: 14.h),
                          _buildRelatedProductsHorizontalList(),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ------ 5. زر الواتساب الثابت في الأسفل ------
            _buildBottomWhatsAppButton(),
          ],
        ),
      ),
    );
  }

  // ويجت عنوان القسم
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.ibmPlexSans(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xff1A1A1A)
      ),
    );
  }

  // ويجت الأزرار العلوية الدائرية
  Widget _buildCircularButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))
            ]
        ),
        child: Icon(icon, color: Colors.black87, size: 20.sp),
      ),
    );
  }

  // ويجت عداد الكمية
  Widget _buildQuantityStepper() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFEFEFEF), width: 1.5.w),
        borderRadius: BorderRadius.circular(30.r),
        color: Colors.white,
      ),
      child: Row(
        children: [
          _buildStepButton(Icons.add_rounded, () {}),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              '1',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
          ),
          _buildStepButton(Icons.remove_rounded, () {}),
        ],
      ),
    );
  }

  Widget _buildStepButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4.r),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Icon(icon, size: 20.sp, color: Colors.black87),
      ),
    );
  }

  // زر الواتساب السفلي
  Widget _buildBottomWhatsAppButton() {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -4))
          ]
      ),
      child: SizedBox(
        width: double.infinity,
        height: 55.h,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff14db66),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
            elevation: 0,
          ),
          onPressed: () {},
          icon: Icon(Icons.chat_bubble_outline_rounded, color: Colors.white, size: 22.sp),
          label: Text(
            'تواصل عبر واتساب',
            style: GoogleFonts.ibmPlexSans(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildRelatedProductsHorizontalList() {
    return SizedBox(
      height: 200.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 3,
        separatorBuilder: (context, index) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          return const RelatedProductCard(
            title: 'منتج مرتبط مميز',
            price: '200',
            imageUrl: 'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?q=80&w=300',
          );
        },
      ),
    );
  }
}

class RelatedProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const RelatedProductCard({
    Key? key,
    required this.title,
    required this.price,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFEFEFEF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
              child: Image.network(imageUrl, fit: BoxFit.cover, width: double.infinity),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, maxLines: 1, overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold)),
                SizedBox(height: 4.h),
                Text('₪$price', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: const Color(0xff4D41DF))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}