import 'package:ai_saas/models/item_category.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Text(
                  'التصنيفات ',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.ibmPlexSans(
                    fontSize: 36,

                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Text(
                  'تصفح أفضل المتاجر والخدمات في منطقتك ',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.ibmPlexSans(
                    fontSize: 18,
                    color: Color(0xff464555),
                  ),
                ),
              ),
              GridView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: categories.length,
                shrinkWrap: true,
                // حل مشكلة RenderBox was not laid out
                physics: ScrollPhysics(),
                // تعطيل التمرير الداخلي للجريد
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.4, // ضبط التناسب ليناسب شكل الصورة
                ),
                itemBuilder: (context, index) {
                  final item = categories[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () => print(item.title),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 15),
                          // الدائرة الخلفية للأيقونة (كما في الصورة)
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEDE7F6),
                              // لون بنفسجي فاتح جداً
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              item.icon,
                              size: 30,
                              color: const Color(0xFF5E35B1), // لون الأيقونة
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            item.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold, // خط عريض
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Container(
                width: 342,
                height: 193,
                child: Stack(
                  children: [
                    Image.asset('assets/images/shoes.png'),
                    Positioned(
                      bottom: 100,
                      right: 10,
                      child: Container(
                        width: 45,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Color(0xff4D41DF),

                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          'متمير',
                          style: GoogleFonts.ibmPlexSans(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      right: 10,
                      child: Text(
                        textAlign: TextAlign.center,
                        'أفضل عروض المولات',
                        style: GoogleFonts.ibmPlexSans(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      right: 10,
                      child: Text(
                        textAlign: TextAlign.center,
                        'استكشف خصومات تصل إلى ٥٠٪',
                        style: GoogleFonts.ibmPlexSans(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
