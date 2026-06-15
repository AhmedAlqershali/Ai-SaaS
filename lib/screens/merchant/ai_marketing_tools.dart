import 'package:ai_saas/screens/widgets/history_item_tile.dart';
import 'package:ai_saas/screens/widgets/size_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AiMarketingTools extends StatelessWidget {
  const AiMarketingTools({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.h),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff4D41DF),
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  width: 342.w,
                  height: 300.h,
                  child: Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: Column(
                      children: [
                        Text(
                          textAlign: TextAlign.right,
                          'مساعدك الذكي لإدارة متجرك باحترافية',
                          style: GoogleFonts.ibmPlexSans(
                            fontSize: 36.sp,
                            letterSpacing: -0.9,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.right,
                          'استخدم أدوات الذكاء الاصطناعي لتوفير وقتك وزيادة مبيعاتك بضغطة زر واحدة',
                          style: GoogleFonts.ibmPlexSans(
                            fontSize: 18.sp,
                            color: const Color(0xffE3DFFF),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Size_Button(
                              onPressed:(){},
                              name: 'شاهد الشرح',
                              color: const Color(0xff4D41DF),
                              size: Size(119.w, 58.h),
                              colorname: Colors.white,
                            ),
                            Size_Button(
                              onPressed:(){},
                              name: 'ابدا الان',
                              color: Colors.white,
                              size: Size(119.w, 58.h),
                              colorname: const Color(0xff4D41DF),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                width: 342.w,
                height: 320.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 20.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff68FADE),
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          alignment: Alignment.center,
                          height: 24.h,
                          width: 111.w,
                          child: Text(
                            'الاكثر استخداما',
                            style: GoogleFonts.ibmPlexSans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffE3DFFF),
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          width: 50.w,
                          height: 50.h,
                          child: Icon(
                            Icons.insert_drive_file_outlined,
                            color: const Color(0xff4D41DF),
                            size: 24.sp,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 30.w, left: 70.w, top: 20.h),
                      child: Text(
                        textAlign: TextAlign.right,
                        'كتابة وصف المنتج',
                        style: GoogleFonts.ibmPlexSans(
                          fontSize: 24.sp,
                          color: const Color(0xff191C1E),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        right: 30.w,
                        left: 70.w,
                        top: 20.h,
                        bottom: 20.h,
                      ),
                      child: Text(
                        textAlign: TextAlign.right,
                        'حوّل مواصفات منتجك إلى نصوص بيعية جذابة تقنع العميل بالشراء فوراً',
                        style: GoogleFonts.ibmPlexSans(
                          fontSize: 16.sp,
                          color: const Color(0xff464555),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        right: 50.w,
                        left: 50.w,
                        top: 20.h,
                        bottom: 20.h,
                      ),
                      child: Size_Button(
                        onPressed:(){},
                        name: 'ابدا الوصف',
                        color: const Color(0xffF2F3F6),
                        colorname: Colors.black,
                        size: Size(278.w, 48.h),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
                decoration: BoxDecoration(
                  color: const Color(0xffF2F3F6),
                  borderRadius: BorderRadius.circular(24.r),
                ),
                width: 342.w,
                height: 290.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 56.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFDCC6),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Icon(Icons.camera_alt, color: const Color(0xff914800), size: 24.sp),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      textAlign: TextAlign.right,
                      'إنشاء بوست انستغرام',
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      textAlign: TextAlign.right,
                      'احصل على أفكار لمحتوى الصور والتعليقات المناسبة لكل منصة اجتماعية.',
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 16.sp,
                        color: const Color(0xff464555),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Size_Button(
                        onPressed:(){},
                        name: 'صمم المنشور ',
                        color: Colors.white,
                        colorname: Colors.black,
                        size: Size(278.w, 48.h),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                width: 342.w,
                height: 232.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 48.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        color: const Color(0xff68FADE),
                      ),
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          '#',
                          style: TextStyle(
                            color: const Color(0xff006B5C),
                            fontWeight: FontWeight.bold,
                            fontSize: 24.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      textAlign: TextAlign.right,
                      'توليد هاشتاغات',
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      textAlign: TextAlign.right,
                      'ارفع نسبة الوصول لمنتجاتك باستخدام هاشتاغات ذكية ومخصصة.',
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 14.sp,
                        color: const Color(0xff464555),
                      ),
                    ),
                    Size_Button(
                      onPressed:(){},
                      name: 'توليد الان',
                      color: Colors.white,
                      colorname: Colors.black,
                      size: Size(278.w, 44.h),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
                decoration: BoxDecoration(
                  color: const Color(0xffF2F3F6),
                  borderRadius: BorderRadius.circular(24.r),
                ),
                width: 342.w,
                height: 290.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 56.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                        color: const Color(0xffC4C0FF),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Icon(
                        Icons.chat_outlined,
                        color: const Color(0xff4D41DF),
                        size: 24.sp,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      textAlign: TextAlign.right,
                      'كتابة ردود للعملاء',
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      textAlign: TextAlign.right,
                      'ردود سريعة واحترافية على استفسارات العملاء وشكاواهم بكل لباقة.',
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 16.sp,
                        color: const Color(0xff464555),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Size_Button(
                        onPressed:(){},
                        name: 'رد ذكي  ',
                        color: Colors.white,
                        colorname: Colors.black,
                        size: Size(278.w, 48.h),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 342.w,
                height: 176.h,
                decoration: BoxDecoration(
                  color: const Color(0xff2E3133),
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '98%',
                      style: GoogleFonts.ibmPlexSans(
                        color: const Color(0xff44DDC2),
                        fontSize: 36.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'دقة المحتوى المولد بواسطة AI',
                      style: GoogleFonts.ibmPlexSans(
                        color: const Color(0xffE1E2E5),
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 10.h),

                    Text(
                      '########## 10,000 ##########',
                      style: GoogleFonts.ibmPlexSans(
                        color: const Color(0xffE1E2E5),
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
                width: 342.w,
                height: 340.h,
                decoration: BoxDecoration(
                  color: const Color(0xffF2F3F6),
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'عرض السجل ',
                            style: GoogleFonts.ibmPlexSans(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff4D41DF),
                            ),
                          ),
                        ),
                        Text(
                          'اخر العماليات ',
                          style: GoogleFonts.ibmPlexSans(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    const HistoryItemTile(
                      name: 'وصف منتج: عطر واحة النخيل',
                      time: 'قبل ١٥ دقيقة',
                      icon1: Icons.edit_note_outlined,
                    ),
                    SizedBox(height: 10.h),
                    const HistoryItemTile(
                      name: 'منشور انستغرام: تخفيضات الشتاء',
                      time: 'قبل ساعتان ',
                      icon1: Icons.share,
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
