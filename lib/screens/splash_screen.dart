import 'dart:async';

import 'package:ai_saas/screens/user_selection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progress = 0.0;

  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        progress += 0.05;
      });

      if (progress >= 1) {
        timer.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => UserSelection()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 400,
            height: 400,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 144,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white10
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Tradex',
                        style: GoogleFonts.ibmPlexSans(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff4D41DF),
                        ),
                      ),
                      SizedBox(width: 20),
                      Transform.rotate(
                        angle: .09,
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Color(0xff4D41DF),
                          ),
                          child: Icon(
                            Icons.flash_on,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'AI سوقك الذكي باستخدام ',
                  style: GoogleFonts.ibmPlexSans(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  'التجارة الإلكترونية المعززة بالذكاء الاصطناعي في متناول يدك',
                  style: GoogleFonts.ibmPlexSans(fontSize: 18),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: LinearProgressIndicator(
                      value: progress,
                      color: Color(0xff4D41DF),

                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
