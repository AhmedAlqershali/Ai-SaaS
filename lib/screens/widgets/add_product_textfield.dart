
import 'package:flutter/material.dart';
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
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffF2F3F6),
        hintText: name,
        hintStyle: GoogleFonts.ibmPlexSans(fontSize: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
