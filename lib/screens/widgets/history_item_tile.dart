import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryItemTile extends StatefulWidget {
  final String name;
  final String time;
  final IconData icon1;

  const HistoryItemTile({
    required this.name,
    required this.time,
    required this.icon1,
    super.key,
  });

  @override
  State<HistoryItemTile> createState() => _HistoryItemTileState();
}

class _HistoryItemTileState extends State<HistoryItemTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      width: 282.w,
      height: 96.h,
      child: Row(
        children: [
          Expanded(
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.copy, size: 24.sp),
            ),
          ),
          SizedBox(width: 10.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.name,
                style: GoogleFonts.ibmPlexSans(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.time,
                style: GoogleFonts.ibmPlexSans(
                  color: const Color(0xff464555),
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          SizedBox(width: 10.w,),
          Expanded(
            child: Center(
              child: Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: const Color(0xffC4C0FF),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {},
                  icon: Icon(
                    widget.icon1,
                    color: const Color(0xff4D41DF),
                    size: 20.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
