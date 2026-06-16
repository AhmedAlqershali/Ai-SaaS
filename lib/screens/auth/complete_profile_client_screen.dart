import 'package:ai_saas/models/app_type.dart';
import 'package:ai_saas/screens/auth/code_register.dart';
import 'package:ai_saas/screens/auth/complet_profile_photo_screen.dart';
import 'package:flutter/material.dart';

class CompleteProfileClientScreen extends StatefulWidget {
  const CompleteProfileClientScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileClientScreen> createState() =>
      _CompleteProfileClientScreenState();
}

class _CompleteProfileClientScreenState
    extends State<CompleteProfileClientScreen> {
  // متغير لتخزين المنطقة المحددة
  String? _selectedRegion = 'غزة';

  // قائمة المناطق المعروضة في التصميم "6.PNG" مع الأيقونات الخاصة بها
  final List<Map<String, dynamic>> _regions = [
    {'name': 'غزة', 'icon': Icons.location_on_outlined},
    {'name': 'شمال غزة', 'icon': Icons.map_outlined},
    {'name': 'خانيونس', 'icon': Icons.explore_outlined},
    {'name': 'رفح', 'icon': Icons.navigation_outlined},
    {'name': 'دير البلح', 'icon': Icons.location_on_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    // الألوان الرئيسية بناءً على التصميم
    const Color primaryColor = Color(0xFF5342E6);
    const Color backgroundColor = Color(0xFFF7F8FC);
    const Color cardBgColor = Colors.white;

    return Directionality(
      textDirection: TextDirection.rtl, // لضمان دعم اللغة العربية والاتجاهات
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'إكمال الملف للمتسوق',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      // العنوان الرئيسي
                      const Text(
                        'حدد منطقتك',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // النص الفرعي
                      const Text(
                        'اختر المنطقة التي تتواجد بها لتخصيص تجربتك.',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 24),

                      // حقل البحث
                      TextFormField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: 'ابحث عن منطقتك...',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFFE5E7EB),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFFE5E7EB),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // زر استخدام الموقع الحالي
                      OutlinedButton.icon(
                        onPressed: () {
                          // تفعيل الجي بي اس هنا لاحقاً
                        },
                        icon: const Icon(
                          Icons.my_location,
                          size: 18,
                          color: primaryColor,
                        ),
                        label: const Text(
                          'استخدام موقعي الحالي',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 48),
                          backgroundColor: primaryColor.withOpacity(0.05),
                          side: const BorderSide(color: Colors.transparent),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // قائمة المناطق الديناميكية
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _regions.length,
                        itemBuilder: (context, index) {
                          final region = _regions[index];
                          final isSelected = _selectedRegion == region['name'];

                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: cardBgColor,
                              borderRadius: BorderRadius.circular(12),
                              // تعديل الشرط هنا ليكون مباشر وبدون التباس في الـ Casting
                              border: Border.all(
                                color: isSelected ? primaryColor : Colors.grey.shade200,
                                width: isSelected ? 1.5 : 1,
                              ),
                            ),
                            child: Theme(
                              // لتعديل ثيم الـ Radio ليطابق التصميم الدائري المعكوس في الـ RTL
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor: Colors.grey.shade300,
                              ),
                              child: RadioListTile<String>(
                                value: region['name'],
                                groupValue: _selectedRegion,
                                activeColor: primaryColor,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                // الدائرة على الطرف الآخر
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      region['name'],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                    // صندوق الأيقونة الخلفي الرمادي الصغير
                                    Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Icon(
                                        region['icon'],
                                        color: Colors.grey.shade600,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedRegion = value;
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              // زر التالي الثابت بالأسفل يفصله خط رفيع
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Color(0xFFE5E7EB), width: 1),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CompleteProfilePhotoScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    minimumSize: const Size(double.infinity, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'التالي',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
