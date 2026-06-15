import 'package:ai_saas/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreDetailsScreen extends StatelessWidget {
  const StoreDetailsScreen({Key? key}) : super(key: key);

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
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end, // محاذاة العناصر للغة العربية
          children: [
            // صورة المتجر الرئيسية
            Container(
              height: 180.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0.r),
                image: const DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1596462502278-27bfdc403348?q=80&w=600'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 12.h),

            // اسم المتجر والتقييم
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 18.sp),
                    SizedBox(width: 4.w),
                    Text(
                      '4.7',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                    ),
                  ],
                ),
                Text(
                  'الرئيسي كوزمتكس',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff1a1a1a),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),

            // قسم عن المتجر
            Text(
              'عن المتجر',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            SizedBox(height: 6.h),
            Text(
              'نحن في (الرئيسي كوزمتكس) نؤمن أن الجمال هو انعكاس للعناية بالتفاصيل. متخصصون في توفير أرقى منتجات التجميل والعناية بالبشرة من أشهر العلامات التجارية العالمية، لنضمن لك تجربة تسوق تلبي احتياجاتك وتبرز جمالك بلمسة احترافية.',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 13.sp, color: Colors.black54, height: 1.6),
            ),
            SizedBox(height: 20.h),

            // تفاصيل العنوان ومواعيد العمل
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text('مواعيد العمل :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp)),
                        SizedBox(width: 4.w),
                        Icon(Icons.access_time, size: 16.sp, color: Colors.black54),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text('10 صباحاً - 8 مساءً', style: TextStyle(fontSize: 12.sp, color: Colors.black54)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text('العنوان :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp)),
                        SizedBox(width: 4.w),
                        Icon(Icons.location_on_outlined, size: 16.sp, color: Colors.black54),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text('النصيرات , مقابل هايبر مول', style: TextStyle(fontSize: 12.sp, color: Colors.black54)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'مفتوح الآن',
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 14.sp),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: const Divider(),
            ),

            // ------ قسم جديدنا ------
            _buildSectionHeader('جديدنا'),
            SizedBox(height: 10.h),
            _buildHorizontalProductList(),

            SizedBox(height: 20.h),

            // ------ قسم الأكثر مبيعاً ------
            _buildSectionHeader('الأكثر مبيعاً'),
            SizedBox(height: 10.h),
            _buildHorizontalProductList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: const Color(0xff1a1a1a),
      ),
    );
  }

  Widget _buildHorizontalProductList() {
    return SizedBox(
      height: 175.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        reverse: true, // يبدأ التمرير من اليمين لليسام ليناسب اللغة العربية
        physics: const BouncingScrollPhysics(),
        children: [
          const ProductItemCard(
            title: 'سيروم الكافيين للعيون',
            price: '200',
            imageUrl: 'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?q=80&w=300',
          ),
          SizedBox(width: 12.w),
          const ProductItemCard(
            title: 'سيروم نياسيناميد',
            price: '210',
            imageUrl: 'https://images.unsplash.com/photo-1608248597481-496100c8c836?q=80&w=300',
          ),
          SizedBox(width: 12.w),
          const ProductItemCard(
            title: 'تونر البشرة النقي',
            price: '180',
            imageUrl: 'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?q=80&w=300',
          ),
        ],
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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductDetailsScreen(),
          ),
        );
      },
      child: Container(
        width: 140.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // صورة المنتج المصغرة وزر القلب
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0.r),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6.h,
                    left: 6.w,
                    child: Container(
                      width: 26.w,
                      height: 26.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.black54,
                        size: 14.sp,
                      ),
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
      ),
    );
  }
}
