import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeTextField extends StatelessWidget {
  const CodeTextField({
    Key? key,
    required this.editingController,
    required this.focusNode,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController editingController;
  final FocusNode focusNode;
  final void Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: editingController,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        style: GoogleFonts.nunito(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
        maxLength: 1,
        onChanged: onChanged,
        keyboardType: const TextInputType.numberWithOptions(
          signed: false,
          decimal: false,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          counterText: '',
          hintText: '*',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.w),
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1.w),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    );
  }
}
