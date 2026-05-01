import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryItemTile extends StatelessWidget {
  String name;
  String time;
  IconData icon1;

   HistoryItemTile({
    required this.name,
    required this.time,
    required this.icon1,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      width: 282,
      height: 96,
      child: Row(
        children: [
          Expanded(
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.copy),
            ),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: GoogleFonts.ibmPlexSans(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                time,
                style: GoogleFonts.ibmPlexSans(
                  color: Color(0xff464555),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Center(
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xffC4C0FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(), // إزالة القيود الافتراضية للحجم
                  onPressed: () {},
                  icon:  Icon(
                    icon1,
                    color: Color(0xff4D41DF),
                    size: 20,
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
