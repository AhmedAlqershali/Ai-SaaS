import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  // المتحكمات بالمدخلات بناءً على الصورة
  final _nameController = TextEditingController(text: 'أحمد القرشلي');
  final _emailController = TextEditingController(text: 'ahmadk2@gmail.com');
  String? _currentSelectedLocation = 'غزة'; // القيمة الافتراضية للموقع الحالي

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xff623ce7);
    const Color textColor = Color(0xff0d1e3d);
    const Color inputFillColor = Color(0xfff4f6fa);
    const Color scaffoldBgColor = Color(0xfffafdff);

    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        // زر العودة للخلف (السهم) جهة اليسار/اليمين حسب اتجاه لغة الجهاز
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'المعلومات الشخصية',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl, // لضبط محاذاة اللغتين العربية والإنجليزية بدقة
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),

                  // 1. قسم الصورة الشخصية الدائرية مع زر التعديل (أيقونة القلم) الأزرق
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: primaryColor.withOpacity(0.4), width: 2),
                            image: const DecorationImage(
                              image: NetworkImage('https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&q=80&w=300'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // أيقونة القلم الأزرق العائمة لتعديل الصورة
                        Positioned(
                          bottom: 2,
                          left: 2,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // 2. حقل الاسم كامل
                  _buildFieldLabel('الاسم كامل'),
                  TextFormField(
                    controller: _nameController,
                    style: const TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w500),
                    decoration: _inputDecoration(
                      hint: 'أدخل اسمك الكامل',
                      fillColor: inputFillColor,
                      prefixIcon: Icons.person_outline,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 3. حقل البريد الالكتروني
                  _buildFieldLabel('البريد الالكتروني'),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textDirection: TextDirection.ltr, // ليبقى البريد الإلكتروني من اليسار لليمين
                    style: const TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w500),
                    decoration: _inputDecoration(
                      hint: 'example@gmail.com',
                      fillColor: inputFillColor,
                      prefixIcon: Icons.email_outlined,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 4. حقل الموقع الحالي المنسدل (Dropdown)
                  _buildFieldLabel('الموقع الحالي'),
                  DropdownButtonFormField<String>(
                    value: _currentSelectedLocation,
                    dropdownColor: Colors.white,
                    style: const TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w500),
                    decoration: _inputDecoration(
                      hint: 'اختر موقعك الحالي',
                      fillColor: inputFillColor,
                      prefixIcon: Icons.location_on_outlined,
                    ),
                    items: <String>['غزة', 'شمال غزة', 'الوسطى', 'خانيونس', 'رفح'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _currentSelectedLocation = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 24),

                  // 5. زر "استخدام موقعي الحالي" الشفاف المطابق لأسفل الصورة
                  InkWell(
                    onTap: () {
                      // هنا يمكنك إضافة منطق جلب الـ GPS الفعلي للمستخدم لاحقاً
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: double.infinity,
                      height: 54,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.06), // لون بنفسجي شفاف وخفيف جداً
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: primaryColor.withOpacity(0.15), width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.my_location, // أيقونة الـ GPS
                            color: primaryColor,
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'استخدام موقعي الحالي',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
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
        ),
      ),
    );
  }

  // دالة مساعدة لبناء النصوص الثابتة (Labels) أعلى الحقول
  Widget _buildFieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      // style: const TextStyle(
      //   color: Color(0xff0d1e3d),
      //   fontWeight: FontWeight.bold,
      //   fontSize: 14,
      // ),
      child: Text(label),
    );
  }

  // تصميم الحقول المخصص والمطابق لأبعاد وألوان الصورة
  InputDecoration _inputDecoration({
    required String hint,
    required Color fillColor,
    required IconData prefixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
      filled: true,
      fillColor: fillColor,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      // جعل الأيقونة في طرف الحقل المناسب للـ RTL
      suffixIcon: Icon(prefixIcon, color: Colors.black38, size: 20),
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