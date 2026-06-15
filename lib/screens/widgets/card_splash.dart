import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CardSplash extends StatefulWidget {
  final String name;
  final String subname;
  final int color;
  final int color1;
  final IconData icon;

  const CardSplash({
    super.key,
    required this.name,
    required this.color,
    required this.color1,
    required this.subname,
    required this.icon,
  });

  @override
  State<CardSplash> createState() => _CardSplashState();
}

class _CardSplashState extends State<CardSplash> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26.r)),
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26.r)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.name,
              style: GoogleFonts.ibmPlexSans(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 8.h),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios_new, size: 20.sp),
                ),
                SizedBox(width: 40.w,),
                Expanded(
                  child: Text(
                    widget.subname,
                    textAlign: TextAlign.right,
                    style: GoogleFonts.ibmPlexSans(fontSize: 14.sp),
                  ),
                ),
                SizedBox(width: 10.w),

                Container(
                  height: 64.h,
                  width: 64.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.r),
                    color: Color(widget.color),
                  ),
                  child: Icon(
                    widget.icon,
                    color: Color(widget.color1),
                    size: 30.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}
