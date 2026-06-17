import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController(text: 'أحمد القرشلي');
  final _emailController = TextEditingController(text: 'ahmadk2@gmail.com');
  String? _currentSelectedLocation = 'غزة';

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

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: scaffoldBgColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: textColor, size: 20.sp),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'المعلومات الشخصية',
            style: GoogleFonts.ibmPlexSans(
              color: textColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 1. قسم الصورة الشخصية
                        Center(
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Container(
                                width: 110.w,
                                height: 110.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: primaryColor.withOpacity(0.2), width: 3.w),
                                  image: const DecorationImage(
                                    image: NetworkImage('https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=300'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5.h,
                                left: 5.w,
                                child: Container(
                                  padding: EdgeInsets.all(8.r),
                                  decoration: const BoxDecoration(
                                    color: primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.camera_alt_rounded, size: 16.sp, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 32.h),

                        // 2. حقل الاسم
                        _buildFieldLabel('الاسم كامل'),
                        TextFormField(
                          controller: _nameController,
                          style: GoogleFonts.ibmPlexSans(color: textColor, fontSize: 14.sp, fontWeight: FontWeight.w500),
                          decoration: _inputDecoration(
                            hint: 'أدخل اسمك الكامل',
                            fillColor: inputFillColor,
                            prefixIcon: Icons.person_outline_rounded,
                          ),
                        ),
                        SizedBox(height: 20.h),

                        // 3. حقل البريد
                        _buildFieldLabel('البريد الالكتروني'),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          textDirection: TextDirection.ltr,
                          style: GoogleFonts.ibmPlexSans(color: textColor, fontSize: 14.sp, fontWeight: FontWeight.w500),
                          decoration: _inputDecoration(
                            hint: 'example@gmail.com',
                            fillColor: inputFillColor,
                            prefixIcon: Icons.email_outlined,
                          ),
                        ),
                        SizedBox(height: 20.h),

                        // 4. حقل الموقع
                        _buildFieldLabel('الموقع الحالي'),
                        DropdownButtonFormField<String>(
                          value: _currentSelectedLocation,
                          isExpanded: true,
                          icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey, size: 20.sp),
                          dropdownColor: Colors.white,
                          style: GoogleFonts.ibmPlexSans(color: textColor, fontSize: 14.sp, fontWeight: FontWeight.w500),
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
                          onChanged: (newValue) => setState(() => _currentSelectedLocation = newValue),
                        ),
                        SizedBox(height: 24.h),

                        // 5. زر جلب الموقع
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(12.r),
                          child: Container(
                            width: double.infinity,
                            height: 52.h,
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(color: primaryColor.withOpacity(0.1), width: 1.w),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.my_location_rounded, color: primaryColor, size: 18.sp),
                                SizedBox(width: 10.w),
                                Text(
                                  'استخدام موقعي الحالي',
                                  style: GoogleFonts.ibmPlexSans(color: primaryColor, fontSize: 14.sp, fontWeight: FontWeight.bold),
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

              // 6. زر حفظ التغييرات الثابت في الأسفل
              Padding(
                padding: EdgeInsets.all(24.r),
                child: SizedBox(
                  width: double.infinity,
                  height: 54.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
                      elevation: 0,
                    ),
                    child: Text(
                      'حفظ التغييرات',
                      style: GoogleFonts.ibmPlexSans(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h, right: 4.w),
      child: Text(
        label,
        style: GoogleFonts.ibmPlexSans(color: const Color(0xff0d1e3d), fontWeight: FontWeight.bold, fontSize: 14.sp),
      ),
    );
  }

  InputDecoration _inputDecoration({required String hint, required Color fillColor, required IconData prefixIcon}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.ibmPlexSans(color: Colors.black38, fontSize: 13.sp),
      filled: true,
      fillColor: fillColor,
      contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      prefixIcon: Icon(prefixIcon, color: Colors.black45, size: 20.sp),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: const BorderSide(color: Color(0xff623ce7), width: 1.5)),
    );
  }
}