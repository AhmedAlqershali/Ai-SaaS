import 'dart:io';
import 'package:ai_saas/models/app_type.dart';
import 'package:ai_saas/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class CompleteProfileMerchantScreen extends StatefulWidget {
  final AppType type;

  const CompleteProfileMerchantScreen({super.key, required this.type});

  @override
  State<CompleteProfileMerchantScreen> createState() => _CompleteProfileMerchantScreenState();
}

class _CompleteProfileMerchantScreenState extends State<CompleteProfileMerchantScreen> {
  final _formKey = GlobalKey<FormState>();

  final _storeNameController = TextEditingController();
  final _addressDetailController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _whatsappController = TextEditingController();
  final _workHoursController = TextEditingController();

  String? _selectedRegion;
  String? _selectedCategory;
  File? _logoFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickLogo(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: 70,
      );

      if (pickedFile != null) {
        setState(() {
          _logoFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      debugPrint("خطأ أثناء التقاط شعار المتجر: $e");
    }
  }

  void _showLogoSourceBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'اختر مصدر شعار المتجر',
                  style: GoogleFonts.ibmPlexSans(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.h),
                _buildSourceTile(Icons.photo_library, 'المعرض (Gallery)', ImageSource.gallery),
                _buildSourceTile(Icons.camera_alt, 'الكاميرا (Camera)', ImageSource.camera),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSourceTile(IconData icon, String title, ImageSource source) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xff4D41DF)),
      title: Text(title, style: GoogleFonts.ibmPlexSans(fontSize: 14.sp)),
      onTap: () {
        Navigator.pop(context);
        _pickLogo(source);
      },
    );
  }

  void _showCategoryBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
            ),
            padding: EdgeInsets.all(20.r),
            child: Column(
              children: [
                Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(2.r)),
                ),
                SizedBox(height: 16.h),
                Text('اختر فئة المتجر', style: GoogleFonts.ibmPlexSans(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                const Divider(),
                Expanded(
                  child: GridView.builder(
                    itemCount: 15, // عدد العناصر
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 12.w,
                      childAspectRatio: 0.85,
                    ),
                    itemBuilder: (context, index) {
                      final categories = [
                        {'name': 'مطاعم', 'icon': Icons.restaurant},
                        {'name': 'كافيهات', 'icon': Icons.local_cafe_outlined},
                        {'name': 'ملابس', 'icon': Icons.checkroom_outlined},
                        {'name': 'مساحات عمل', 'icon': Icons.laptop_chromebook_outlined},
                        {'name': 'هدايا', 'icon': Icons.card_giftcard_outlined},
                        {'name': 'أحذية', 'icon': Icons.roller_skating_outlined},
                        {'name': 'سيارات', 'icon': Icons.directions_car_filled_outlined},
                        {'name': 'مجوهرات', 'icon': Icons.diamond_outlined},
                        {'name': 'كوزمتكس', 'icon': Icons.content_cut_outlined},
                        {'name': 'سوبرماركت', 'icon': Icons.shopping_cart_outlined},
                        {'name': 'مول', 'icon': Icons.business_outlined},
                        {'name': 'متجر', 'icon': Icons.storefront_outlined},
                        {'name': 'إلكترونيات', 'icon': Icons.devices_other_outlined},
                        {'name': 'مستلزمات طبية', 'icon': Icons.medical_services_outlined},
                        {'name': 'بصريات', 'icon': Icons.visibility_outlined},
                      ];
                      return _buildCategoryItem(categories[index]['name'] as String, categories[index]['icon'] as IconData);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategoryItem(String name, IconData icon) {
    return InkWell(
      onTap: () {
        setState(() => _selectedCategory = name);
        Navigator.pop(context);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(color: const Color(0xff4D41DF).withOpacity(0.08), shape: BoxShape.circle),
            child: Icon(icon, color: const Color(0xff4D41DF), size: 24.sp),
          ),
          SizedBox(height: 6.h),
          Text(name, style: GoogleFonts.ibmPlexSans(fontSize: 11.sp), textAlign: TextAlign.center),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xff4D41DF);
    const Color textColor = Color(0xff0d1e3d);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: textColor, size: 20.sp),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text('إكمال بروفايل التاجر', style: GoogleFonts.ibmPlexSans(color: Colors.grey, fontSize: 16.sp)),
          centerTitle: true,
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h),
                          Text('الخطوة الأخيرة: إكمال البيانات', style: GoogleFonts.ibmPlexSans(fontSize: 18.sp, fontWeight: FontWeight.bold, color: textColor)),
                          SizedBox(height: 10.h),
                          LinearProgressIndicator(
                            value: 1.0,
                            minHeight: 4.h,
                            backgroundColor: const Color(0xffeff3ff),
                            valueColor: const AlwaysStoppedAnimation<Color>(primaryColor),
                          ),
                          SizedBox(height: 24.h),

                          // رفع الشعار
                          Center(
                            child: GestureDetector(
                              onTap: _showLogoSourceBottomSheet,
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Container(
                                    width: 100.w,
                                    height: 100.w,
                                    decoration: BoxDecoration(
                                      color: primaryColor.withOpacity(0.05),
                                      shape: BoxShape.circle,
                                      border: Border.all(color: primaryColor.withOpacity(0.1), width: 1.5.w),
                                      image: _logoFile != null ? DecorationImage(image: FileImage(_logoFile!), fit: BoxFit.cover) : null,
                                    ),
                                    child: _logoFile == null ? Icon(Icons.storefront_rounded, size: 40.sp, color: primaryColor.withOpacity(0.5)) : null,
                                  ),
                                  CircleAvatar(
                                    radius: 16.r,
                                    backgroundColor: primaryColor,
                                    child: Icon(Icons.edit, size: 14.sp, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),

                          _buildFieldLabel('اسم المتجر'),
                          _buildTextField(_storeNameController, 'مثال: متجر التقنية الحديثة'),
                          SizedBox(height: 16.h),

                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildFieldLabel('فئة المتجر'),
                                    _buildPickerField(_selectedCategory ?? 'اختر الفئة', _showCategoryBottomSheet),
                                  ],
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildFieldLabel('المنطقة'),
                                    _buildDropdownField(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),

                          _buildFieldLabel('العنوان بالتفصيل'),
                          _buildTextField(_addressDetailController, 'الشارع، رقم المبنى...', maxLines: 2),
                          SizedBox(height: 20.h),

                          _buildAIHint(primaryColor),
                          SizedBox(height: 20.h),

                          _buildFieldLabel('وصف المتجر'),
                          _buildTextField(_descriptionController, 'تحدث عن ما يميز متجرك...', maxLines: 3),
                          SizedBox(height: 16.h),

                          _buildFieldLabel('رقم الواتساب'),
                          _buildWhatsAppField(),
                          SizedBox(height: 16.h),

                          _buildFieldLabel('مواعيد العمل'),
                          _buildTextField(_workHoursController, 'مثلاً: 10 صباحاً - 8 مساءً'),

                          const Spacer(), // يدفع الزر للأسفل في الشاشات الكبيرة
                          SizedBox(height: 32.h),

                          _buildSubmitButton(primaryColor),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildFieldLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h, top: 4.h),
      child: Text(label, style: GoogleFonts.ibmPlexSans(color: const Color(0xff0d1e3d), fontWeight: FontWeight.bold, fontSize: 14.sp)),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, {int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: GoogleFonts.ibmPlexSans(fontSize: 14.sp),
      decoration: _inputDecoration(hint),
    );
  }

  Widget _buildPickerField(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 52.h,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        decoration: BoxDecoration(color: const Color(0xffF8F9FD), borderRadius: BorderRadius.circular(12.r), border: Border.all(color: const Color(0xffEFEFEF))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(text, style: GoogleFonts.ibmPlexSans(fontSize: 14.sp, color: text.contains('اختر') ? Colors.black38 : const Color(0xff0d1e3d)), overflow: TextOverflow.ellipsis)),
            Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black45, size: 20.sp),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownField() {
    return DropdownButtonFormField<String>(
      value: _selectedRegion,
      dropdownColor: Colors.white,
      items: <String>['غزة', 'خانيونس', 'الوسطى', 'رفح'].map((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value, style: GoogleFonts.ibmPlexSans(fontSize: 14.sp)));
      }).toList(),
      onChanged: (newValue) => setState(() => _selectedRegion = newValue),
      decoration: _inputDecoration('اختر المنطقة'),
    );
  }

  Widget _buildWhatsAppField() {
    return Row(
      children: [
        Container(
          width: 70.w,
          height: 52.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: const Color(0xffeff3ff), borderRadius: BorderRadius.circular(12.r)),
          child: Text('+970', style: GoogleFonts.ibmPlexSans(fontWeight: FontWeight.bold, fontSize: 14.sp), textDirection: TextDirection.ltr),
        ),
        SizedBox(width: 10.w),
        Expanded(child: TextFormField(controller: _whatsappController, keyboardType: TextInputType.phone, textDirection: TextDirection.ltr, decoration: _inputDecoration('59XXXXXXX'))),
      ],
    );
  }

  Widget _buildAIHint(Color color) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(color: color.withOpacity(0.05), borderRadius: BorderRadius.circular(12.r), border: Border.all(color: color.withOpacity(0.1))),
      child: Row(
        children: [
          Icon(Icons.auto_awesome, color: color, size: 20.sp),
          SizedBox(width: 10.w),
          Expanded(child: Text('إضافة وصف دقيق يساعد الذكاء الاصطناعي في ترشيح متجرك للعملاء المناسبين.', style: GoogleFonts.ibmPlexSans(fontSize: 12.sp, color: color, height: 1.4))),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(Color primaryColor) {
    return Container(
      width: double.infinity,
      height: 54.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        gradient: LinearGradient(colors: [primaryColor, primaryColor.withBlue(200)]),
      ),
      child: ElevatedButton(
        onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(type: widget.type))),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('حفظ وإكمال التسجيل', style: GoogleFonts.ibmPlexSans(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(width: 10.w),
            Icon(Icons.rocket_launch_rounded, color: Colors.white, size: 18.sp),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.ibmPlexSans(color: Colors.black26, fontSize: 13.sp),
      filled: true,
      fillColor: const Color(0xffF8F9FD),
      contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: const BorderSide(color: Color(0xffEFEFEF))),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: const BorderSide(color: Color(0xffEFEFEF))),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: const BorderSide(color: Color(0xff4D41DF), width: 1.5)),
    );
  }
}