import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          icon: Icon(Icons.arrow_back, color: textColor, size: 24.sp),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'المعلومات الشخصية',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl, // لضبط محاذاة اللغتين العربية والإنجليزية بدقة
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 16.0.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),

                  // 1. قسم الصورة الشخصية الدائرية مع زر التعديل (أيقونة القلم) الأزرق
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          width: 100.w,
                          height: 100.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: primaryColor.withOpacity(0.4), width: 2.w),
                            image: const DecorationImage(
                              image: NetworkImage('https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&q=80&w=300'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // أيقونة القلم الأزرق العائمة لتعديل الصورة
                        Positioned(
                          bottom: 2.h,
                          left: 2.w,
                          child: Container(
                            padding: EdgeInsets.all(6.r),
                            decoration: const BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.edit,
                              size: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),

                  // 2. حقل الاسم كامل
                  _buildFieldLabel('الاسم كامل'),
                  TextFormField(
                    controller: _nameController,
                    style: TextStyle(color: textColor, fontSize: 14.sp, fontWeight: FontWeight.w500),
                    decoration: _inputDecoration(
                      hint: 'أدخل اسمك الكامل',
                      fillColor: inputFillColor,
                      prefixIcon: Icons.person_outline,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // 3. حقل البريد الالكتروني
                  _buildFieldLabel('البريد الالكتروني'),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textDirection: TextDirection.ltr, // ليبقى البريد الإلكتروني من اليسار لليمين
                    style: TextStyle(color: textColor, fontSize: 14.sp, fontWeight: FontWeight.w500),
                    decoration: _inputDecoration(
                      hint: 'example@gmail.com',
                      fillColor: inputFillColor,
                      prefixIcon: Icons.email_outlined,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // 4. حقل الموقع الحالي المنسدل (Dropdown)
                  _buildFieldLabel('الموقع الحالي'),
                  DropdownButtonFormField<String>(
                    value: _currentSelectedLocation,
                    dropdownColor: Colors.white,
                    style: TextStyle(color: textColor, fontSize: 14.sp, fontWeight: FontWeight.w500),
                    decoration: _inputDecoration(
                      hint: 'اختر موقعك الحالي',
                      fillColor: inputFillColor,
                      prefixIcon: Icons.location_on_outlined,
                    ),
                    items: <String>['غزة', 'شمال غزة', 'الوسطى', 'خانيونس', 'رفح'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: TextStyle(fontSize: 14.sp)),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _currentSelectedLocation = newValue;
                      });
                    },
                  ),
                  SizedBox(height: 24.h),

                  // 5. زر "استخدام موقعي الحالي" الشفاف المطابق لأسفل الصورة
                  InkWell(
                    onTap: () {
                      // هنا يمكنك إضافة منطق جلب الـ GPS الفعلي للمستخدم لاحقاً
                    },
                    borderRadius: BorderRadius.circular(12.r),
                    child: Container(
                      width: double.infinity,
                      height: 54.h,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.06), // لون بنفسجي شفاف وخفيف جداً
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: primaryColor.withOpacity(0.15), width: 1.w),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.my_location, // أيقونة الـ GPS
                            color: primaryColor,
                            size: 18.sp,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'استخدام موقعي الحالي',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 14.sp,
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
      padding: EdgeInsets.only(bottom: 8.0.h),
      child: Text(
        label,
        style: TextStyle(
          color: const Color(0xff0d1e3d),
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
        ),
      ),
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
      hintStyle: TextStyle(color: Colors.black38, fontSize: 14.sp),
      filled: true,
      fillColor: fillColor,
      contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      // جعل الأيقونة في طرف الحقل المناسب للـ RTL
      suffixIcon: Icon(prefixIcon, color: Colors.black38, size: 20.sp),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: Color(0xff623ce7), width: 1.5),
      ),
    );
  }
}
