import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  // التحكم في المدخلات
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  String? _selectedRegion;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // الألوان المستخدمة في التصميم
    const Color primaryColor = Color(0xff623ce7);
    const Color textColor = Color(0xff0d1e3d);
    const Color inputFillColor = Color(0xffeff3ff);
    const Color backgroundColor = Color(0xfff8faff);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Tradex',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: primaryColor),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl, // لتنسيق الواجهة بالكامل باللغة العربية
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // النص الرئيسي والفرعي
                const Text(
                  'إكمال ملفك الشخصي',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'ساعدنا في تخصيص تجربتك التسويقية بشكل أفضل',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),

                // البطاقة البيضاء التي تحتوي على الحقول
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black12.withOpacity(0.05)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.02),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // صف حقول الاسم (الاسم الأول واسم العائلة)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'اسم المتجر',
                            style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _firstNameController,
                            decoration: _inputDecoration(hint: 'مثال: فيولا', fillColor: inputFillColor),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      const SizedBox(height: 20),

                      // حقل المنطقة في قطاع غزة
                      const Text(
                        'المنطقة في قطاع غزة',
                        style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: _selectedRegion,
                        hint: Row(
                          children: const [
                            Icon(Icons.location_on_outlined, color: Colors.black45, size: 20),
                            SizedBox(width: 8),
                            Text('اختر منطقتك', style: TextStyle(color: Colors.black38, fontSize: 14)),
                          ],
                        ),
                        decoration: _inputDecoration(hint: '', fillColor: inputFillColor),
                        dropdownColor: Colors.white,
                        items: <String>['غزة', 'شمال غزة', 'الوسطى', 'خانيونس', 'رفح']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedRegion = newValue;
                          });
                        },
                      ),
                      const SizedBox(height: 20),

                      // حقل رقم الجوال
                      const Text(
                        'رقم الجوال',
                        style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          // رمز الدولة المستقل تلقائياً (يمين بالـ RTL)
                          Container(
                            width: 80,
                            height: 54,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xffe2ebff), // لون أفتح قليلاً لرمز الدولة مثل الصورة
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              '+970',
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              textDirection: TextDirection.ltr,
                            ),
                          ),
                          const SizedBox(width: 12),
                          // حقل إدخال رقم الجوال
                          Expanded(
                            child: TextFormField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              textDirection: TextDirection.ltr, // لكتابة الأرقام الإنجليزية بشكل صحيح
                              decoration: _inputDecoration(hint: '59XXXXXXX', fillColor: inputFillColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // 1. عنوان "اهتماماتك"
                const Padding(
                  padding: EdgeInsets.only(top: 24.0, bottom: 16.0),
                  child: Text(
                    'اهتماماتك',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0d1e3d),
                    ),
                  ),
                ),

            // 2. قسم شارات الاهتمامات (التاغات) باستخدام Wrap ليتوزع تلقائياً
                Wrap(
                  spacing: 8.0, // المسافة الأفقية بين الشارات
                  runSpacing: 10.0, // المسافة الرأسية بين السطور
                  children: [
                    _buildInterestTag('مطاعم', Icons.restaurant_menu),
                    _buildInterestTag('ملابس', Icons.checkroom),
                    _buildInterestTag('أحذية', Icons.roller_skating_outlined), // أو أيقونة حذاء مناسبة
                    _buildInterestTag('مساحات عمل', Icons.laptop_mac),
                    _buildInterestTag('إلكترونيات', Icons.devices),
                  ],
                ),
                const SizedBox(height: 24),


            // 4. زر حفظ ومتابعة (بتدرج لوني وبداخله أيقونة اتجاه السهم لليسار)
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      colors: [Color(0xff512da8), Color(0xff7c4dff)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff7c4dff).withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // منطق الحفظ والمتابعة هنا
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'حفظ ومتابعة',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_back_ios, color: Colors.white, size: 16), // سهم لليسار يناسب الـ RTL والتقدم للامام
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

            // 5. النص التوضيحي السفلي
                const Text(
                  'يمكنك تعديل هذه البيانات لاحقاً من إعدادات الملف الشخصي.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
// دالة بناء شارة الاهتمام (Tag)
  Widget _buildInterestTag(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.black12.withOpacity(0.08)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: const Color(0xff0d1e3d).withOpacity(0.7)),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff0d1e3d),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // تجميع ستايل الحقول لتقليل تكرار الكود وثبات المظهر
  InputDecoration _inputDecoration({required String hint, required Color fillColor}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
      filled: true,
      fillColor: fillColor,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xff623ce7), width: 1.5),
      ),
    );
  }
}