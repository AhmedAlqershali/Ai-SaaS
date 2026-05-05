import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        actionsPadding: EdgeInsets.only(right: 20),

        title: Text(
          'Tradex',
          style: GoogleFonts.ibmPlexSans(
            fontSize: 24,

            fontWeight: FontWeight.bold,
            color: const Color(0xff4D41DF),
          ),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.shopping_bag_outlined,
          color: const Color(0xff4D41DF),
          size: 25,
        ),
        actions: [
          Icon(
            Icons.location_on_outlined,
            color: const Color(0xff4D41DF),
            size: 25,
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [

                  // 2. طبقة تغميق وضبابية (اختياري لزيادة التركيز على البطاقة)
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    // درجة الضبابية
                    child: Container(
                      color: Colors.black.withOpacity(0.3), // تغميق خفيف
                    ),
                  ),

                  // 3. البطاقة البيضاء في المنتصف
                  Center(child: _buildStoreCard()),
                ],
              ),
              _buildCategoryFilter(),



            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStoreCard() {
    return Container(
      width: 340,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
      ),
      child: Stack(
        children: [
          Container(
            width: 342, // العرض المطلوب
            height: 400, // الطول المطلوب
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40), // زوايا منحنية متناسقة مع التصميم
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/images/shop.jpg',
                fit: BoxFit.cover, // هذا السطر يجعل الصورة تمشي وتتمدد حسب حجم الكونتينر تماماً
              ),
            ),
          ),
          // اللوجو مع خلفيته المنحنية
          Positioned(
            top: 50,
            left: 50,
            right: 50,
            child: Container(
            height: 320,
            width: 342,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFE8EAF6),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      color: const Color(0xFF101C26),
                      height: 90,
                      width: 90,
                      child: Image.asset(
                        'assets/images/bank.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                 Text(
                  'متجر الأناقة للملابس',
                  style: GoogleFonts.ibmPlexSans(fontSize: 26, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(
                      'النصيرات، شارع السوق العام',
                      style: GoogleFonts.ibmPlexSans(color: Colors.grey),
                    ),
                    SizedBox(width: 6),
                    Icon(Icons.location_on_outlined, color: Color(0xFF7E57C2)),
                  ],
                ),
                const SizedBox(height: 35),
                // زر الواتساب

InkWell(
  onTap: (){},
  child:Container(
    width: double.infinity,
    height: 60,
    decoration: BoxDecoration(
      color: const Color(0xFF00695C),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Icon(FontAwesomeIcons.whatsapp, color: Colors.white),
        SizedBox(width: 10),
        Text(
          'تواصل عبر واتساب',
          style: GoogleFonts.ibmPlexSans(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    ),
  ),
)
              ],
            ),
          ),
          ),

        ],
      ),
    );
  }

  Widget _buildCategoryFilter() {
    // قائمة البيانات
    final List<String> categories = ['الكل', 'قمصان', 'بناطيل', 'فساتين'];
    int selectedIndex = 0; // يمكنك تحويلها لـ Variable في الكلاس للتحكم بالحالة

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 45, // الارتفاع المناسب للأزرار
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            bool isSelected = index == selectedIndex;
            return Container(
              margin: const EdgeInsets.only(left: 12),
              child: Chip(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                label: Text(
                  categories[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black54,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                backgroundColor: isSelected
                    ? const Color(0xFF5B4FCF) // البنفسجي للمختار
                    : const Color(0xFFF5F6F9), // الرمادي الفاتح للبقية
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: BorderSide.none,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
