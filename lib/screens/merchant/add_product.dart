import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

// الحفاظ على استدعاءاتك كما هي
import 'package:ai_saas/screens/widgets/add_product_textfield.dart';
import 'package:ai_saas/screens/widgets/size_button.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  bool isEnabled1 = false;
  bool isEnabled2 = false;

  final List<File> _attachedImages = [];
  final int _maxImages = 3;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source, imageQuality: 70);
      if (pickedFile != null) {
        if (_attachedImages.length < _maxImages) {
          setState(() {
            _attachedImages.add(File(pickedFile.path));
          });
        } else {
          _showSnackBar('تم الوصول للحد الأقصى (3 صور)');
        }
      }
    } catch (e) {
      debugPrint("خطأ في التقاط الصورة: $e");
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.orange),
    );
  }

  void _removeAttachedImage(int index) {
    setState(() {
      _attachedImages.removeAt(index);
    });
  }

  void _showImageSourceBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            padding: EdgeInsets.all(20.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('إضافة صورة المنتج', style: GoogleFonts.ibmPlexSans(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                SizedBox(height: 20.h),
                _buildSourceTile(Icons.photo_library, 'معرض الصور', ImageSource.gallery),
                _buildSourceTile(Icons.camera_alt, 'الكاميرا', ImageSource.camera),
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
        _pickImage(source);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xff4D41DF);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffF8F9FA),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close, size: 22.sp, color: Colors.black),
          ),
          title: Text(
            'إضافة منتج جديد',
            style: GoogleFonts.ibmPlexSans(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () {},
              child: Text('مسودة', style: GoogleFonts.ibmPlexSans(color: primaryColor, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader(Icons.storefront, 'بيانات المنتج الأساسية', primaryColor),
              SizedBox(height: 20.h),

              _buildLabel('اسم المنتج'),
              const add_product_textfield(name: 'مثال: سماعات لاسلكي'),
              SizedBox(height: 16.h),

              _buildLabel('السعر (₪)'),
              const add_product_textfield(name: '0.00'),
              SizedBox(height: 16.h),

              _buildLabel('الفئة'),
              const add_product_textfield(name: 'اختر الفئة'),
              SizedBox(height: 24.h),

              // كرت الوصف بالذكاء الاصطناعي
              _buildAIContentCard(primaryColor),
              SizedBox(height: 24.h),

              // قسم الصور
              _buildImageUploadSection(primaryColor),
              SizedBox(height: 24.h),

              _buildLabel('الحالة والظهور'),
              SizedBox(height: 10.h),
              _buildSwitchTile(Icons.remove_red_eye, 'مرئي للجميع', isEnabled1, (v) => setState(() => isEnabled1 = v), const Color(0xff006B5C)),
              SizedBox(height: 12.h),
              _buildSwitchTile(Icons.local_fire_department_rounded, 'منتج مميز', isEnabled2, (v) => setState(() => isEnabled2 = v), const Color(0xff914800)),

              SizedBox(height: 32.h),
              // استخدام Size_Button كما هي في الكود الأصلي الخاص بك
              Size_Button(
                onPressed: () {},
                name: 'نشر المنتج الآن',
                color: primaryColor,
                size: Size(double.infinity, 54.h),
                colorname: Colors.white,
              ),
              SizedBox(height: 12.h),
              Size_Button(
                onPressed: () {},
                name: 'معاينة المتجر',
                color: const Color(0xffE8E7F5),
                size: Size(double.infinity, 54.h),
                colorname: primaryColor,
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(IconData icon, String title, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 22.sp),
        SizedBox(width: 8.w),
        Text(title, style: GoogleFonts.ibmPlexSans(fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xff464555))),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(text, style: GoogleFonts.ibmPlexSans(fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xff464555))),
    );
  }

  Widget _buildAIContentCard(Color primaryColor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10)],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('وصف المنتج', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                    _buildAIButton(),
                  ],
                ),
                SizedBox(height: 16.h),
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF2F3F6),
                    hintText: 'اكتب وصفاً جذاباً لمنتجك...',
                    hintStyle: TextStyle(fontSize: 12.sp),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide.none),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(color: primaryColor.withOpacity(0.05), borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.r))),
            child: Row(
              children: [
                Icon(Icons.lightbulb_outline, color: primaryColor, size: 18.sp),
                SizedBox(width: 8.w),
                Expanded(child: Text('نصيحة: الوصف الدقيق يزيد المبيعات بنسبة 40%', style: TextStyle(fontSize: 11.sp, color: primaryColor))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAIButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(color: const Color(0xff4D41DF), borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        mainAxisSize: MainAxisSize.min, // مهم جداً لمنع الـ Overflow
        children: [
          Icon(Icons.auto_awesome, color: Colors.white, size: 14.sp),
          SizedBox(width: 6.w),
          Text('توليد ذكي', style: TextStyle(color: Colors.white, fontSize: 11.sp, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildImageUploadSection(Color primaryColor) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        children: [
          GestureDetector(
            onTap: _showImageSourceBottomSheet,
            child: CircleAvatar(
              radius: 30.r,
              backgroundColor: const Color(0xffF2F3F6),
              child: Icon(Icons.add_a_photo_rounded, color: primaryColor, size: 26.sp),
            ),
          ),
          SizedBox(height: 10.h),
          Text('رفع صور المنتج (بحد أقصى 3)', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 16.h),
          // الـ Row محاط بـ SingleChildScrollView أوفقياً للحماية الإضافية
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) => _buildImageSlot(index, primaryColor)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSlot(int index, Color primaryColor) {
    bool hasImage = index < _attachedImages.length;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      width: 70.w,
      height: 70.w,
      decoration: BoxDecoration(
        color: const Color(0xffF2F3F6),
        borderRadius: BorderRadius.circular(12.r),
        image: hasImage ? DecorationImage(image: FileImage(_attachedImages[index]), fit: BoxFit.cover) : null,
        border: !hasImage && index == _attachedImages.length ? Border.all(color: primaryColor) : null,
      ),
      child: hasImage
          ? Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () => _removeAttachedImage(index),
          child: CircleAvatar(radius: 10.r, backgroundColor: Colors.red, child: const Icon(Icons.close, size: 12, color: Colors.white)),
        ),
      )
          : Icon(Icons.add, color: index == _attachedImages.length ? primaryColor : Colors.black12),
    );
  }

  Widget _buildSwitchTile(IconData icon, String title, bool value, Function(bool) onChanged, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20.sp),
          SizedBox(width: 12.w),
          Text(title, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
          const Spacer(),
          Switch(value: value, onChanged: onChanged, activeColor: color),
        ],
      ),
    );
  }
}
