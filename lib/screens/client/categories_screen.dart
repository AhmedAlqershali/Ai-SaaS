import 'package:ai_saas/models/item_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                width: double.infinity,
                child: Text(
                  'التصنيفات ',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.ibmPlexSans(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                width: double.infinity,
                child: Text(
                  'تصفح أفضل المتاجر والخدمات في منطقتك ',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.ibmPlexSans(
                    fontSize: 18.sp,
                    color: const Color(0xff464555),
                  ),
                ),
              ),
              GridView.builder(
                padding: EdgeInsets.all(8.r),
                itemCount: categories.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.w,
                  mainAxisSpacing: 20.h,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  final item = categories[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8.r,
                          offset: Offset(0, 5.h),
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () => debugPrint(item.title),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 15.h),
                          Container(
                            padding: EdgeInsets.all(15.r),
                            decoration: const BoxDecoration(
                              color: Color(0xFFEDE7F6),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              item.icon,
                              size: 30.sp,
                              color: const Color(0xFF5E35B1),
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Text(
                            item.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 342.w,
                height: 193.h,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/shoes.png',
                      width: 342.w,
                      height: 193.h,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 100.h,
                      right: 10.w,
                      child: Container(
                        width: 45.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                          color: const Color(0xff4D41DF),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Center(
                          child: Text(
                            'متميز',
                            style: GoogleFonts.ibmPlexSans(
                              fontSize: 12.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 50.h,
                      right: 10.w,
                      child: Text(
                        'أفضل عروض المولات',
                        style: GoogleFonts.ibmPlexSans(
                          fontSize: 24.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30.h,
                      right: 10.w,
                      child: Text(
                        'استكشف خصومات تصل إلى ٥٠٪',
                        style: GoogleFonts.ibmPlexSans(
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
