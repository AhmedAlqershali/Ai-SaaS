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
                  height: 369,
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
                            SizedBox(height: 100,)
                          ],
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
    );
  }
}
