import 'package:ai_saas/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreDetailsScreen extends StatelessWidget {
  const StoreDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // الألوان الموحدة للبراند
    const Color primaryColor = Color(0xff4D41DF);
    const Color textColor = Color(0xff1A1A1A);
    const Color subTextColor = Color(0xff718096);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffF8FAF1).withOpacity(0.97),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: Text(
            'تفاصيل المتجر',
            style: GoogleFonts.ibmPlexSans(
              color: textColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: textColor, size: 18.sp),
            onPressed: () => Navigator.maybePop(context),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ─── 1. صورة المتجر الرئيسية ───
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 0),
                child: Container(
                  height: 180.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1596462502278-27bfdc403348?q=80&w=600',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Container(color: Colors.grey.shade200, child: const Icon(Icons.broken_image)),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),

                    // ─── 2. اسم المتجر والتقييم ───
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'الرئيسي كوزمتكس',
                            style: GoogleFonts.ibmPlexSans(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        _buildRatingBadge('4.7'),
                      ],
                    ),
                    SizedBox(height: 12.h),

                    // ─── 3. بطاقة معلومات المتجر ───
                    _buildStoreInfoCard(primaryColor),
                    SizedBox(height: 20.h),

                    // ─── 4. قسم "عن المتجر" ───
                    Text(
                      'عن المتجر',
                      style: GoogleFonts.ibmPlexSans(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: textColor
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      'نحن في (الرئيسي كوزمتكس) نؤمن أن الجمال هو انعكاس للعناية بالتفاصيل. متخصصون في توفير أرقى منتجات التجميل من ماركات عالمية.',
                      style: GoogleFonts.ibmPlexSans(
                          fontSize: 13.sp,
                          color: subTextColor,
                          height: 1.5
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // ─── 5. الأقسام العرضية ───
                    _buildSectionHeader('جديدنا', primaryColor),
                    SizedBox(height: 12.h),
                    _buildHorizontalProductList(),

                    SizedBox(height: 24.h),

                    _buildSectionHeader('الأكثر مبيعاً', primaryColor),
                    SizedBox(height: 12.h),
                    _buildHorizontalProductList(),

                    SizedBox(height: 30.h), // مساحة إضافية في الأسفل
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ويجت التقييم
  Widget _buildRatingBadge(String rate) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: const Color(0xffFFC107).withOpacity(0.12),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Icon(Icons.star_rounded, color: const Color(0xffFFB300), size: 16.sp),
          SizedBox(width: 4.w),
          Text(
            rate,
            style: GoogleFonts.ibmPlexSans(
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
              color: const Color(0xffFF8F00),
            ),
          ),
        ],
      ),
    );
  }

  // بطاقة تفاصيل العنوان والوقت
  Widget _buildStoreInfoCard(Color primaryColor) {
    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xffE2E8F0)),
      ),
      child: Column(
        children: [
          _buildInfoRow(Icons.location_on_rounded, 'النصيرات، مقابل هايبر مول', primaryColor),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Divider(color: const Color(0xffEDF2F7), thickness: 1.h),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _buildInfoRow(Icons.access_time_filled_rounded, '10:00 ص - 08:00 م', primaryColor)),
              _buildStatusBadge(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(icon, size: 18.sp, color: color),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.ibmPlexSans(fontSize: 13.sp, color: const Color(0xff4A5568)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildStatusBadge() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: const Color(0xff10B981).withOpacity(0.1),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        'مفتوح الآن',
        style: GoogleFonts.ibmPlexSans(
          color: const Color(0xff10B981),
          fontWeight: FontWeight.bold,
          fontSize: 11.sp,
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, Color primaryColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: GoogleFonts.ibmPlexSans(fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xff1A1A1A))),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero),
          child: Text('عرض الكل', style: GoogleFonts.ibmPlexSans(fontSize: 13.sp, fontWeight: FontWeight.bold, color: primaryColor)),
        ),
      ],
    );
  }

  Widget _buildHorizontalProductList() {
    return SizedBox(
      height: 210.h, // زيادة الارتفاع قليلاً لضمان عدم حدوث Overflow عند تكبير النصوص
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 3,
        separatorBuilder: (context, index) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          return const ProductItemCard(
            title: 'سيروم الكافيين للعيون والمناطق الحساسة',
            price: '200',
            imageUrl: 'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?q=80&w=300',
          );
        },
      ),
    );
  }
}

class ProductItemCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductItemCard({
    Key? key,
    required this.title,
    required this.price,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductDetailsScreen())),
      child: Container(
        width: 145.w, // زيادة العرض قليلاً للتوازن
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: const Color(0xffEDF2F7)),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 8, offset: const Offset(0, 2))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة المنتج
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(14.r)),
                  child: Image.network(
                    imageUrl,
                    height: 110.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(height: 110.h, color: Colors.grey.shade100, child: const Icon(Icons.image)),
                  ),
                ),
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: Container(
                    padding: EdgeInsets.all(5.r),
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: Icon(Icons.favorite_rounded, color: const Color(0xffE53E3E).withOpacity(0.3), size: 15.sp),
                  ),
                ),
              ],
            ),
            // تفاصيل المنتج
            Padding(
              padding: EdgeInsets.all(10.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2, // يسمح بسطرين لضمان عدم ضياع الوصف
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.ibmPlexSans(fontSize: 12.sp, fontWeight: FontWeight.w600, color: const Color(0xff2D3748), height: 1.2),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₪$price',
                        style: GoogleFonts.ibmPlexSans(fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xff4D41DF)),
                      ),
                      Container(
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(color: const Color(0xff4D41DF).withOpacity(0.1), borderRadius: BorderRadius.circular(6.r)),
                        child: Icon(Icons.add_rounded, size: 16.sp, color: const Color(0xff4D41DF)),
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