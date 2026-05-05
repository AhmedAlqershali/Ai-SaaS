import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DitailsProducts extends StatelessWidget {
  const DitailsProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // لضمان اتجاه اللغة العربية
      child: Scaffold(

        body: SafeArea(
          child: SingleChildScrollView( // أضفنا هذا لكي لا يتوقف الكود عند امتلاء الشاشة
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // القسم العلوي: الصورة الكبيرة مع التاج
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/shoes.png',
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 15,
                      right: 15,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'إصدار محدود',
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // القسم الأوسط: صورتين بجانب بعض
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/shoes.png',
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/shoes.png',
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),

                // القسم السفلي: النص مع الأيقونة
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle, color: Color(0xFF00897B), size: 20),
                      SizedBox(width: 8),
                      Text(
                        'حرفة فلسطينية أصيلة',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00897B),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // اسم المنتج والسعر
                _buildHeader(),
                const SizedBox(height: 20),
                // معلومات التاجر
                _buildStoreBadge(),
                const SizedBox(height: 24),
                // وصف المنتج
                const Text(
                  'وصف المنتج',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'وشاح حريري أنيق بخامة مميزة ✨ مرسوم يدويًا ويعكس جمال التراث والصمود. ألوانه مستوحاة من غروب البحر وتمنحك إطلالة فريدة.',
                  style: TextStyle(color: Colors.black54, height: 1.5),
                ),
                const SizedBox(height: 20),
                // مميزات المنتج
                _buildFeatureRow(Icons.verified_outlined, 'حرير طبيعي 100%'),
                _buildFeatureRow(Icons.verified_outlined, 'حواف مخيطة يدويًا لمتانة أعلى'),
                _buildFeatureRow(Icons.verified_outlined, 'الأبعاد: 90 × 90 سم'),
                const SizedBox(height: 24),
                // اختيارات العطر
                const Text('اختر العطر', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                _buildFragranceOptions(),
                const SizedBox(height: 30),
                // بطاقات الشحن والضمان
                _buildInfoCards(),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
        bottomSheet: _buildWhatsAppButton(context),
      ),
    );
  }

}







Widget _buildHeader() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'وشاح حريري أنيق',
        style: GoogleFonts.ibmPlexSans(fontSize: 36, fontWeight: FontWeight.bold),
      ),
      Row(
        children: [
           Text(
            '45.00 ش',
            style: GoogleFonts.ibmPlexSans(
              fontSize: 30,
              color: Color(0xFF5B4FCF),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            '65.00 ش',
            style: GoogleFonts.ibmPlexSans(
              fontSize: 16,
              color: Colors.grey.withOpacity(0.7),
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    ],
  );
}

// 2. بطاقة المتجر
Widget _buildStoreBadge() {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: const Color(0xFFF5F5F5),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.black,
          child: Icon(Icons.store, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('يباع بواسطة',
                style: GoogleFonts.ibmPlexSans(fontSize: 12, color: Colors.grey)),
            Text('The Gaza Atelier',
                style: GoogleFonts.ibmPlexSans(fontSize:16,fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    ),
  );
}

// 3. صفوف المميزات
Widget _buildFeatureRow(IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        Icon(icon, color: const Color(0xFF5B4FCF), size: 20),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 14)),
      ],
    ),
  );
}

// 4. خيارات العطر
Widget _buildFragranceOptions() {
  return Wrap(
    spacing: 10,
    children: [
      _buildChip('يافا متوسطي', isSelected: true),
      _buildChip('وردة الصحراء'),
      _buildChip('بستان الزيتون'),
    ],
  );
}

Widget _buildChip(String label, {bool isSelected = false}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: isSelected ? const Color(0xFF5B4FCF) : const Color(0xFFEEEEEE),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      label,
      style: GoogleFonts.ibmPlexSans(
        color: isSelected ? Colors.white : Colors.black87,
        fontSize: 14,
      ),
    ),
  );
}

// 5. بطاقات الشحن والضمان
Widget _buildInfoCards() {
  return Row(
    children: [
      _infoCard(Icons.local_shipping_outlined, 'شحن سريع'),
      const SizedBox(width: 15),
      _infoCard(Icons.shield_outlined, 'دفع آمن 100%'),
    ],
  );
}

Widget _infoCard(IconData icon, String text) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.teal),
          const SizedBox(height: 8),
          Text(text, style:  GoogleFonts.ibmPlexSans(fontSize: 12)),
        ],
      ),
    ),
  );
}

// 6. زر الواتساب (إصلاح مشكلة الكونتكس هنا)
Widget _buildWhatsAppButton(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(20),
    color: Colors.white,
    child: ElevatedButton(
      onPressed: () {
        // منطق فتح الواتساب
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF25D366),
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          // استخدمنا أيقونة الرسائل المتوفرة افتراضياً
          Icon(FontAwesomeIcons.whatsapp, color: Colors.white),
          SizedBox(width: 10),
          Text(
            'اطلب الآن عبر واتساب',
            style: GoogleFonts.ibmPlexSans(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
        ],
      ),
    ),
  );
}