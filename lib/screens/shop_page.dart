import 'dart:ui';

import 'package:ai_saas/screens/widgets/product_shop.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int selectedIndex = 0;
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
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  // عدد العناصر في القائمة
                  itemCount: 3,
                  // بناء كل عنصر بناءً على الفهرس (Index)
                  itemBuilder: (context, index) {
                    return ProductShop(
                      title: 'فستان كتان كلاسيك',
                      description:
                          'تصميم عصري من الكتان الطبيعي، مريح ومناسب لجميع المناسبات الصيفية.',
                      price: '120',
                      imageUrl: 'assets/images/girl.png',
                      badgeText: 'وصل حديثا',
                    );
                  },
                ),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    decoration: BoxDecoration(
                          color: Color(0xffE3DFFF),
                      borderRadius: BorderRadius.circular(24)
                    ),
                    padding:  EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end, // محاذاة العناصر لليمين
                      children: [
                        // شارة "زورونا في الفرع"
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE0D9F3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'زورونا في الفرع',
                            style: TextStyle(
                              color: Color(0xFF5D3AC8),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: 'Cairo', // استبدله بخطك المفضل
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // العنوان الرئيسي
                         Center(
                           child: Text(
                              'نحن بانتظارك في\nقلب النصيرات',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 32,
                                fontWeight: FontWeight.w900,
                                height: 1.2,
                                fontFamily: 'Cairo',
                              ),
                              textAlign: TextAlign.right,
                            ),
                         ),

                        const SizedBox(height: 25),

                        // النص الوصفي
                         Center(
                           child: Text(
                              'تفضل بزيارتنا لتجربة أحدث صيحات الموضة العالمية بجودة محلية لا تضاهى. متجرنا يقع في أكثر المناطق حيوية لسهولة الوصول.',
                              style: TextStyle(
                                color: Color(0xFF6C757D),
                                fontSize: 16,
                                height: 1.6,
                                fontFamily: 'Cairo',
                              ),
                              textAlign: TextAlign.right,
                            ),
                         ),

                        const SizedBox(height: 40),

                        // بطاقة ساعات العمل
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // نصوص ساعات العمل
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Text(
                                      'ساعات العمل',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Cairo',
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Text(
                                        'يومياً من 10:00 صباحاً حتى 10:00 مساءً',
                                        style: TextStyle(
                                          color: Color(0xFF6C757D),
                                          fontSize: 14,
                                          fontFamily: 'Cairo',
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 15),
                              // الأيقونة
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE0D9F3),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.access_time_filled,
                                  color: Color(0xFF5D3AC8),
                                  size: 28,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
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
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(45)),
      child: Stack(
        children: [
          Container(
            width: 342, // العرض المطلوب
            height: 400, // الطول المطلوب
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                40,
              ), // زوايا منحنية متناسقة مع التصميم
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/images/shop.jpg',
                fit: BoxFit
                    .cover, // هذا السطر يجعل الصورة تمشي وتتمدد حسب حجم الكونتينر تماماً
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
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'النصيرات، شارع السوق العام',
                        style: GoogleFonts.ibmPlexSans(color: Colors.grey),
                      ),
                      SizedBox(width: 6),
                      Icon(
                        Icons.location_on_outlined,
                        color: Color(0xFF7E57C2),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),

                  // زر الواتساب
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFF00695C),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryFilter() {
    final List<String> categories = ['الكل', 'قمصان', 'بناطيل', 'فساتين'];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 45,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            bool isSelected = index == selectedIndex;

            return Container(
              margin: const EdgeInsets.only(left: 12),
              child: ChoiceChip(
                // النص
                label: Text(categories[index]),
                // هل هو مختار؟
                selected: isSelected,
                // ماذا يحدث عند النقر؟
                onSelected: (bool selected) {
                  setState(() {
                    selectedIndex = index; // تحديث الرقم المختار
                  });
                },
                // التنسيقات
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black54,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
                selectedColor: const Color(0xFF5B4FCF), // لون المختار
                backgroundColor: const Color(0xFFF5F6F9), // لون غير المختار
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                side: BorderSide.none, // إخفاء الإطار الافتراضي
                showCheckmark: false, // إخفاء علامة الصح الافتراضية
              ),
            );
          },
        ),
      ),
    );
  }
}
