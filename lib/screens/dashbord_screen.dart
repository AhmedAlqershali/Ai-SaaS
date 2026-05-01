import 'package:ai_saas/screens/widgets/history_item_tile.dart';
import 'package:ai_saas/screens/widgets/size_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashbordScreen extends StatelessWidget {
  const DashbordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff4D41DF),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  width: 342,
                  height: 300,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              textAlign: TextAlign.right,
                              'مساعدك الذكي لإدارة متجرك باحترافية',
                              style: GoogleFonts.ibmPlexSans(
                                fontSize: 36,
                                letterSpacing: -0.9,

                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.right,
                              'استخدم أدوات الذكاء الاصطناعي لتوفير وقتك وزيادة مبيعاتك بضغطة زر واحدة',
                              style: GoogleFonts.ibmPlexSans(
                                fontSize: 18,

                                color: Color(0xffE3DFFF),
                              ),
                            ),
                            Spacer(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Size_Button(
                                  name: 'شاهد الشرح',
                                  color: Color(0xff4D41DF),
                                  size: Size(119, 58),
                                  colorname: Colors.white,
                                ),
                                Size_Button(
                                  name: 'ابدا الان',
                                  color: Colors.white,
                                  size: Size(119, 58),
                                  colorname: Color(0xff4D41DF),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                width: 342,
                height: 320,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xff68FADE),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            'الاكثر استخداما',
                            style: GoogleFonts.ibmPlexSans(
                              fontSize: 16,

                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          height: 24,
                          width: 111,
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xffE3DFFF),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          width: 50,
                          height: 50,
                          child: Icon(
                            Icons.insert_drive_file_outlined,
                            color: const Color(0xff4D41DF),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 30, left: 70, top: 20),

                      child: Text(
                        textAlign: TextAlign.right,
                        'كتابة وصف المنتج',
                        style: GoogleFonts.ibmPlexSans(
                          fontSize: 24,
                          color: Color(0xff191C1E),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        right: 30,
                        left: 70,
                        top: 20,
                        bottom: 20,
                      ),

                      child: Text(
                        textAlign: TextAlign.right,
                        'حوّل مواصفات منتجك إلى نصوص بيعية جذابة تقنع العميل بالشراء فوراً',
                        style: GoogleFonts.ibmPlexSans(
                          fontSize: 16,
                          color: Color(0xff464555),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        right: 50,
                        left: 50,
                        top: 20,
                        bottom: 20,
                      ),
                      child: Size_Button(
                        name: 'ابدا الوصف',
                        color: Color(0xffF2F3F6),
                        colorname: Colors.black,
                        size: Size(278, 48),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                decoration: BoxDecoration(
                  color: Color(0xffF2F3F6),
                  borderRadius: BorderRadius.circular(24),
                ),
                width: 342,
                height: 290,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Color(0xffFFDCC6),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Icon(Icons.camera_alt, color: Color(0xff914800)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      textAlign: TextAlign.right,
                      'إنشاء بوست انستغرام',
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      textAlign: TextAlign.right,
                      'احصل على أفكار لمحتوى الصور والتعليقات المناسبة لكل منصة اجتماعية.',
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 16,
                        color: Color(0xff464555),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Size_Button(
                        name: 'صمم المنشور ',
                        color: Colors.white,
                        colorname: Colors.black,
                        size: Size(278, 48),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),

                width: 342,
                height: 232,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Color(0xff68FADE),
                      ),
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          '#',
                          style: TextStyle(
                            color: Color(0xff006B5C),
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      textAlign: TextAlign.right,
                      'توليد هاشتاغات',
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      textAlign: TextAlign.right,
                      'ارفع نسبة الوصول لمنتجاتك باستخدام هاشتاغات ذكية ومخصصة.',
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 14,
                        color: Color(0xff464555),
                      ),
                    ),
                    Size_Button(
                      name: 'توليد الان',
                      color: Colors.white,
                      colorname: Colors.black,
                      size: Size(278, 44),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                decoration: BoxDecoration(
                  color: Color(0xffF2F3F6),
                  borderRadius: BorderRadius.circular(24),
                ),
                width: 342,
                height: 290,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Color(0xffC4C0FF),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Icon(
                        Icons.chat_outlined,
                        color: Color(0xff4D41DF),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      textAlign: TextAlign.right,
                      'كتابة ردود للعملاء',
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      textAlign: TextAlign.right,
                      'ردود سريعة واحترافية على استفسارات العملاء وشكاواهم بكل لباقة.',
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 16,
                        color: Color(0xff464555),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Size_Button(
                        name: 'رد ذكي  ',
                        color: Colors.white,
                        colorname: Colors.black,
                        size: Size(278, 48),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 342,
                height: 176,
                decoration: BoxDecoration(
                  color: Color(0xff2E3133),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '98%',
                      style: GoogleFonts.ibmPlexSans(
                        color: Color(0xff44DDC2),
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'دقة المحتوى المولد بواسطة AI',
                      style: GoogleFonts.ibmPlexSans(
                        color: Color(0xffE1E2E5),
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),

                    Text(
                      '########## 10,000 ##########',
                      style: GoogleFonts.ibmPlexSans(
                        color: Color(0xffE1E2E5),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),

                width: 342,
                height: 340,
                decoration: BoxDecoration(
                  color: Color(0xffF2F3F6),
                  borderRadius: BorderRadius.circular(24),
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
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff4D41DF),
                            ),
                          ),
                        ),
                        Text(
                          'اخر العماليات ',
                          style: GoogleFonts.ibmPlexSans(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    HistoryItemTile(
                      name: 'وصف منتج: عطر واحة النخيل',
                      time: 'قبل ١٥ دقيقة',
                      icon1: Icons.edit_note_outlined,
                    ),
                    SizedBox(height: 10),
                    HistoryItemTile(
                      name: 'منشور انستغرام: تخفيضات الشتاء',
                      time: 'قبل ساعتان ',
                      icon1: Icons.share,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}
