import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Size_Button extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  final Color color;
  final Color colorname;
  final Size size;
  
  const Size_Button({
    required this.name,
    required this.onPressed,
    required this.color,
    required this.colorname,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: size,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r))
      ),
      onPressed: onPressed,
      child: Text(name,
        style: GoogleFonts.ibmPlexSans(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: colorname,
        ),
      ),
    );
  }
}
