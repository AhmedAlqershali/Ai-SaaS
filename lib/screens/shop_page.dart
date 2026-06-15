import 'dart:ui';

import 'package:ai_saas/screens/widgets/product_shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        actionsPadding: EdgeInsets.only(right: 20.w),

        title: Text(
          'Tradex',
          style: GoogleFonts.ibmPlexSans(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xff4D41DF),
          ),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.shopping_bag_outlined,
          color: const Color(0xff4D41DF),
          size: 25.sp,
        ),
        actions: [
          Icon(
            Icons.location_on_outlined,
            color: const Color(0xff4D41DF),
            size: 25.sp,
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  // 2. طبقة تغميق وضبابية (اختياري لزيادة التركيز على البطاقة)
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    // درجة الضبابية
                    child: Container(
                      color: Colors.black.withOpacity(0.3), // تغميق خفيف
                    ),
                  ),

                  // 3. البطاقة البيضاء في المنتصف
                  Center(child: _buildStoreCard()),
                ],
              ),
              _buildCategoryFilter(),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  // عدد العناصر في القائمة
                  itemCount: 3,
                  // بناء كل عنصر بناءً على الفهرس (Index)
                  itemBuilder: (context, index) {
                    return const ProductShop(
                      title: 'فستان كتان كلاسيك',
                      description:
                          'تصميم عصري من الكتان الطبيعي، مريح ومناسب لجميع المناسبات الصيفية.',
                      price: '120',
                      imageUrl: 'assets/images/girl.png',
                      badgeText: 'وصل حديثا',
                    );
                  },
                ),
              ),

              Center(
                child: Padding(
                  padding: EdgeInsets.all(18.0.r),
                  child: Container(
                    decoration: BoxDecoration(
                          color: const Color(0xffE3DFFF),
                      borderRadius: BorderRadius.circular(24.r)
                    ),
                    padding: EdgeInsets.all(20.0.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end, // محاذاة العناصر لليمين
                      children: [
                        // شارة "زورونا في الفرع"
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE0D9F3),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text(
                            'زورونا في الفرع',
                            style: TextStyle(
                              color: const Color(0xFF5D3AC8),
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                              fontFamily: 'Cairo', // استبدله بخطك المفضل
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),

                        // العنوان الرئيسي
                         Center(
                           child: Text(
                              'نحن بانتظارك في\nقلب النصيرات',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w900,
                                height: 1.2,
                                fontFamily: 'Cairo',
                              ),
                              textAlign: TextAlign.right,
                            ),
                         ),

                        SizedBox(height: 25.h),

                        // النص الوصفي
                         Center(
                           child: Text(
                              'تفضل بزيارتنا لتجربة أحدث صيحات الموضة العالمية بجودة محلية لا تضاهى. متجرنا يقع في أكثر المناطق حيوية لسهولة الوصول.',
                              style: TextStyle(
                                color: const Color(0xFF6C757D),
                                fontSize: 16.sp,
                                height: 1.6,
                                fontFamily: 'Cairo',
                              ),
                              textAlign: TextAlign.right,
                            ),
                         ),

                        SizedBox(height: 40.h),

                        // بطاقة ساعات العمل
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(20.r),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10.r,
                                offset: Offset(0, 4.h),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // نصوص ساعات العمل
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'ساعات العمل',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Cairo',
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Text(
                                        'يومياً من 10:00 صباحاً حتى 10:00 مساءً',
                                        style: TextStyle(
                                          color: const Color(0xFF6C757D),
                                          fontSize: 14.sp,
                                          fontFamily: 'Cairo',
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 15.w),
                              // الأيقونة
                              Container(
                                padding: EdgeInsets.all(10.r),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE0D9F3),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.access_time_filled,
                                  color: const Color(0xFF5D3AC8),
                                  size: 28.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStoreCard() {
    return Container(
      width: 340.w,
      height: 400.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(45.r)),
      child: Stack(
        children: [
          Container(
            width: 342.w, // العرض المطلوب
            height: 400.h, // الطول المطلوب
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                40.r,
              ), // زوايا منحنية متناسقة مع التصميم
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40.r),
              child: Image.asset(
                'assets/images/shop.jpg',
                fit: BoxFit
                    .cover, // هذا السطر يجعل الصورة تمشي وتتمدد حسب حجم الكونتينر تماماً
              ),
            ),
          ),
          // اللوجو مع خلفيته المنحنية
          Positioned(
            top: 50.h,
            left: 50.w,
            right: 50.w,
            child: Container(
              height: 320.h,
              width: 342.w,
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: const Color(0xFFE8EAF6),
                borderRadius: BorderRadius.circular(28.r),
              ),
              child: Column(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.r),
                      child: Container(
                        color: const Color(0xFF101C26),
                        height: 90.h,
                        width: 90.w,
                        child: Image.asset(
                          'assets/images/bank.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Text(
                    'متجر الأناقة للملابس',
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'النصيرات، شارع السوق العام',
                        style: GoogleFonts.ibmPlexSans(color: Colors.grey, fontSize: 14.sp),
                      ),
                      SizedBox(width: 6.w),
                      Icon(
                        Icons.location_on_outlined,
                        color: const Color(0xFF7E57C2),
                        size: 20.sp,
                      ),
                    ],
                  ),
                  SizedBox(height: 35.h),

                  // زر الواتساب
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFF00695C),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.whatsapp, color: Colors.white, size: 24.sp),
                          SizedBox(width: 10.w),
                          Text(
                            'تواصل عبر واتساب',
                            style: GoogleFonts.ibmPlexSans(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryFilter() {
    final List<String> categories = ['الكل', 'قمصان', 'بناطيل', 'فساتين'];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 45.h,
        margin: EdgeInsets.symmetric(vertical: 10.h),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemBuilder: (context, index) {
            bool isSelected = index == selectedIndex;

            return Container(
              margin: EdgeInsets.only(left: 12.w),
              child: ChoiceChip(
                // النص
                label: Text(categories[index]),
                // هل هو مختار؟
                selected: isSelected,
                // ماذا يحدث عند النقر؟
                onSelected: (bool selected) {
                  setState(() {
                    selectedIndex = index; // تحديث الرقم المختار
                  });
                },
                // التنسيقات
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black54,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 14.sp,
                ),
                selectedColor: const Color(0xFF5B4FCF), // لون المختار
                backgroundColor: const Color(0xFFF5F6F9), // لون غير المختار
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r),
                ),
                side: BorderSide.none, // إخفاء الإطار الافتراضي
                showCheckmark: false, // إخفاء علامة الصح الافتراضية
              ),
            );
          },
        ),
      ),
    );
  }
}
