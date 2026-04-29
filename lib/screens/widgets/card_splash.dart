import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      margin: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.name,
              style: GoogleFonts.ibmPlexSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 8),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
                SizedBox(width: 40,),
                Expanded(
                  child: Text(
                    widget.subname,
                    textAlign: TextAlign.right,
                    style: GoogleFonts.ibmPlexSans(fontSize: 14),
                  ),
                ),
                SizedBox(width: 10),

                Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Color(widget.color),
                  ),
                  child: Icon(
                    widget.icon,
                    color: Color(widget.color1),
                    size: 30,
                  ),
                ),
              ],
            ),
            SizedBox(height:  15),

          ],
        ),
      ),
    );
  }
}