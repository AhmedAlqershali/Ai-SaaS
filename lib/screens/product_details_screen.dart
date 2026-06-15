import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8fafc),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end, // محاذاة لليمين (اللغة العربية)
            children: [
              // ------ 1. الجزء العلوي: صورة المنتج والأزرار العائمة ------
              Stack(
                children: [
                  Container(
                    height: 350.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://images.unsplash.com/photo-1620916566398-39f1143ab7be?q=80&w=500'), // رابط تجريبي لصورة السيروم
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // زر العودة الخلفي
                  Positioned(
                    top: 16.h,
                    left: 16.w,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20.r,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black87, size: 20.sp),
                        onPressed: () => Navigator.maybePop(context),
                      ),
                    ),
                  ),
                  // زر المفضلة
                  Positioned(
                    top: 16.h,
                    right: 16.w,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20.r,
                      child: Icon(Icons.favorite_border_outlined, color: Colors.black54, size: 20.sp),
                    ),
                  ),
                ],
              ),

              // ------ 2. تفاصيل وبيانات المنتج الثابتة ------
              Padding(
                padding: EdgeInsets.all(16.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Anua',
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'سيروم نياسيناميد 70%',
                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: const Color(0xff1a1a1a)),
                    ),
                    SizedBox(height: 16.h),

                    Text(
                      'الوصف',
                      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      'منحي بشرتك الإشراقة التي تستحقها مع سيروم الخوخ من Anua. تم تصميم هذا السيروم خصيصاً ليمنحك بشرة زجاجية صافية وناعمة، حيث يعمل بتركيز عالٍ من مستخلص الخوخ والنياسيناميد على تفتيح البشرة، توحيد لونها، وتقليص مظهر المسام بشكل فعال.',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 13.sp, color: Colors.black54, height: 1.6),
                    ),
                    SizedBox(height: 16.h),

                    Text(
                      'طريقة الاستخدام',
                      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      'ضعي 2-3 قطرات على بشرة نظيفة بعد استخدام التونر، ودلكيها بلطف حتى تمتصها البشرة تماماً. استخدميه صباحاً ومساءً للحصول على أفضل النتائج.',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 13.sp, color: Colors.black54, height: 1.6),
                    ),
                    SizedBox(height: 24.h),

                    // ------ 3. السعر والتحكم بالكمية ------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // عداد ثابت بقيمة 1
                        Container(
                          height: 38.h,
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200, width: 1.5.w),
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove, size: 16.sp, color: Colors.black54),
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () {},
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: Text(
                                  '1',
                                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.add, size: 16.sp, color: Colors.black54),
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        // السعر الثابت 120 شيكل الموضح بالصورة
                        Text(
                          '₪120',
                          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w900, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),

                    // ------ 4. زر تواصل عبر واتساب ------
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff14db66),
                        minimumSize: Size(double.infinity, 52.h),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                            'تواصل عبر واتساب',
                            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          SizedBox(width: 8.w),
                          Icon(Icons.chat_bubble_outline_outlined, color: Colors.white, size: 20.sp),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // ------ 5. قسم أخرى بالأسفل ------
                    Text(
                      'أخرى',
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    SizedBox(height: 12.h),
                    _buildRelatedProductsHorizontalList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // قائمة المنتجات المقترحة الثابتة
  Widget _buildRelatedProductsHorizontalList() {
    return SizedBox(
      height: 180.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        reverse: true, // يبدأ التمرير من اليمين للياسر اتساقاً مع اتجاه التطبيق
        physics: const BouncingScrollPhysics(),
        children: [
          const RelatedProductCard(
            title: 'سيروم الكافيين للعيون',
            price: '200',
            imageUrl: 'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?q=80&w=300',
          ),
          SizedBox(width: 12.w),
          const RelatedProductCard(
            title: 'سيروم نياسيناميد',
            price: '210',
            imageUrl: 'https://images.unsplash.com/photo-1608248597481-496100c8c836?q=80&w=300',
          ),
        ],
      ),
    );
  }
}

// ==========================================
// ويدجت كرت المنتج المقترح الثابت
// ==========================================
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
      width: 140.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0.r),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0.r),
                    image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: 6.h,
                  left: 6.w,
                  child: Container(
                    width: 24.w,
                    height: 24.h,
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: Icon(Icons.favorite_border_outlined, color: Colors.black54, size: 14.sp),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(6.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, color: Colors.black87),
                ),
                SizedBox(height: 4.h),
                Text(
                  '₪$price',
                  style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
