import 'package:ai_saas/screens/widgets/add_product_textfield.dart';
import 'package:ai_saas/screens/widgets/size_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  bool isEnabled1 = false;
  bool isEnabled2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(radius: 24.r, backgroundColor: Colors.red),
            TextButton(
              onPressed: () {},
              child: Text(
                'حفظ كمسودة',
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff4D41DF),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'إضافة منتج جديد',
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.close, size: 24.sp))],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(18.0.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'بيانات المنتج الأساسية',
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff464555),
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      Icons.storefront,
                      color: const Color(0xff4D41DF),
                      size: 20.sp,
                    ),
                  ],
                ),
              ),
              Text(
                'اسم المنتج',
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff464555),
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 56.h,
                width: 278.w,
                child: const add_product_textfield(name: 'مثال: سماعات لاسلكي'),
              ),
              SizedBox(height: 10.h),
              Text(
                '(USD)',
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff464555),
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 56.h,
                width: 278.w,
                child: const add_product_textfield(name: '0.00'),
              ),
              SizedBox(height: 10.h),
              Text(
                'الفئة',
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff464555),
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 56.h,
                width: 278.w,
                child: const add_product_textfield(name: 'الالكترونيات'),
              ),
              SizedBox(height: 10.h),

              Container(
                width: 320.w,
                height: 534.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16.r),
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.w,
                        vertical: 20.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 180.w,
                                height: 72.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xff4D41DF),
                                  borderRadius: BorderRadius.circular(24.r),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        textAlign: TextAlign.right,
                                        'توليد وصف بالذكاء\n الاصطناعي',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(width: 14.w),
                                    Icon(
                                      Icons.auto_awesome,
                                      color: Colors.white,
                                      size: 22.sp,
                                    ),
                                    SizedBox(width: 15.w),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                'وصف\n المنتج',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              SizedBox(width: 8.w),
                              Icon(
                                Icons.insert_drive_file,
                                color: const Color(0xff4D41DF),
                                size: 24.sp,
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          SizedBox(
                            height: 300.h,
                            width: 278.w,
                            child: TextField(
                              maxLines: null,
                              expands: true,
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 14.sp),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xffF2F3F6),
                                hintText:
                                    'ابدأ بكتابة وصف المنتج أو استخدم الذكاء\nالاصطناعي لتوليد وصف احترافي تلقائياً...',
                                hintStyle: GoogleFonts.ibmPlexSans(
                                  fontSize: 14.sp,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.r),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'نصحية الذكاء الاصطناعي',
                                style: GoogleFonts.ibmPlexSans(
                                  fontSize: 14.sp,
                                  color: const Color(0xff3622CA),
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Icon(
                                Icons.lightbulb,
                                color: const Color(0xff3622CA),
                                size: 20.sp,
                              ),
                            ],
                          ),
                          Text(
                            textAlign: TextAlign.right,
                            'بالكلمات المفتاحية يزيد من ظهور منتجك في نتائج البحث بنسبة تصل إلى40%.الوصف الغني',
                            style: GoogleFonts.ibmPlexSans(
                              fontSize: 14.sp,
                              color: const Color(0xff3622CA),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        width: 6.w,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.r),
                            bottomLeft: Radius.circular(16.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Container(
                height: 294.h,
                width: 294.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      backgroundColor: const Color(0xffC7C4D8),
                      child: Icon(
                        Icons.add_a_photo,
                        color: const Color(0xff3622CA),
                        size: 28.sp,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'رفع صورة المنتج',
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'يدعم JPG, PNG. الحجم الأقصى 5 ميجابايت.',
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 12.sp,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 90.w,
                          height: 90.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.r),
                            color: const Color(0xffC7C4D8),
                          ),
                          child: Center(child: Icon(Icons.add, size: 24.sp)),
                        ),
                        Container(
                          width: 90.w,
                          height: 90.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.r),
                            color: const Color(0xffC7C4D8),
                          ),
                          child: Center(child: Icon(Icons.add, size: 24.sp)),
                        ),
                        Container(
                          width: 90.w,
                          height: 90.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.r),
                            color: const Color(0xffC7C4D8),
                          ),
                          child: Center(child: Icon(Icons.add, size: 24.sp)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Column(
                children: [
                  Text(
                    'الحالة والظهور',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: const Color(0xffC7C4D8),
                    ),
                    height: 44.h,
                    width: 294.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Switch(
                          activeThumbColor: const Color(0xff006B5C),
                          value: isEnabled1,
                          onChanged: (value) {
                            setState(() {
                              isEnabled1 = value;
                            });
                          },
                        ),
                        const Spacer(),
                        Text(
                          'مرئي للجميع',
                          style: GoogleFonts.ibmPlexSans(
                            fontSize: 16.sp,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Icon(Icons.remove_red_eye, color: const Color(0xff006B5C), size: 24.sp),
                        SizedBox(width: 15.w),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: const Color(0xffC7C4D8),
                    ),
                    height: 44.h,
                    width: 294.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Switch(
                          activeThumbColor: const Color(0xff006B5C),
                          value: isEnabled2,
                          onChanged: (value) {
                            setState(() {
                              isEnabled2 = value;
                            });
                          },
                        ),
                        const Spacer(),
                        Text(
                          'منتج مميز',
                          style: GoogleFonts.ibmPlexSans(
                            fontSize: 16.sp,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Icon(
                          Icons.local_fire_department_outlined,
                          color: const Color(0xff914800),
                          size: 24.sp,
                        ),
                        SizedBox(width: 15.w),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Size_Button(
                    onPressed:(){},
                    name: 'نشر المنتج الآن',
                    color: const Color(0xff3622CA),
                    size: Size(294.w, 60.h),
                    colorname: Colors.white,
                  ),
                  SizedBox(height: 20.h),
                  Size_Button(
                    onPressed:(){},
                    name: 'معاينة المتجر',
                    color: const Color(0xffC7C4D8),
                    size: Size(294.w, 60.h),
                    colorname: const Color(0xff191C1E) ,
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
