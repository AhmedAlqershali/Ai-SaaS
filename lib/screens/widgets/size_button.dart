import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Size_Button extends StatelessWidget {
  String name;
  VoidCallback onPressed;
  Color color;
  Color colorname;
  Size size;
  Size_Button({
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
          minimumSize: (size)
      ),
      onPressed:onPressed,
      child: Text(name,
        style: GoogleFonts.ibmPlexSans(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: colorname,
        ),
      ),
    );
  }
}
