import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class add_product_textfield extends StatelessWidget {
  final String name;
  const add_product_textfield({
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.right,
      style: TextStyle(fontSize: 14.sp),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF2F3F6),
        hintText: name,
        hintStyle: GoogleFonts.ibmPlexSans(fontSize: 14.sp),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
      ),
    );
  }
}
