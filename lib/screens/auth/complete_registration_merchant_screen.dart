import 'package:ai_saas/models/app_type.dart';
import 'package:ai_saas/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart'; // 1. استيراد الحزمة
import 'dart:io'; // 2. استيراد مكتبة التعامل مع الملفات

class CompleteProfileMerchantScreen extends StatefulWidget {
  final AppType type;

  const CompleteProfileMerchantScreen({super.key, required this.type});

  @override
  State<CompleteProfileMerchantScreen> createState() => _CompleteProfileMerchantScreenState();
}

class _CompleteProfileMerchantScreenState extends State<CompleteProfileMerchantScreen> {
  final _formKey = GlobalKey<FormState>();

  // المتحكمات والمتغيرات لبيانات الواجهة
  final _storeNameController = TextEditingController();
  final _addressDetailController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _whatsappController = TextEditingController();
  final _workHoursController = TextEditingController();

  String? _selectedRegion;
  String? _selectedCategory;

  // 3. متغيرات حفظ الصورة المحددة
  File? _logoFile;
  final ImagePicker _picker = ImagePicker();

  // 4. دالة التقاط الصورة من الكاميرا أو المعرض
  Future<void> _pickLogo(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: 75, // ضغط جودة الصورة للحفاظ على سرعة الرفع والأداء
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

  // 5. نافذة اختيار مصدر الصورة (كاميرا / استوديو)
  void _showLogoSourceBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'اختر مصدر شعار المتجر',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xff0d1e3d)),
                ),
                SizedBox(height: 16.h),
                ListTile(
                  leading: const Icon(Icons.photo_library, color: Color(0xff623ce7)),
                  title: const Text('اختيار من المعرض (Gallery)'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickLogo(ImageSource.gallery);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.camera_alt, color: Color(0xff623ce7)),
                  title: const Text('التقاط بواسطة الكاميرا (Camera)'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickLogo(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _storeNameController.dispose();
    _addressDetailController.dispose();
    _descriptionController.dispose();
    _whatsappController.dispose();
    _workHoursController.dispose();
    super.dispose();
  }

  // الدالة المحدثة لإظهار نافذة الفئات لتطابق الصورة الثانية تماماً
  void _showCategoryBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            margin: EdgeInsets.only(top: 80.h),
            decoration: BoxDecoration(
              color: const Color(0xfffcfdff),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                SizedBox(height: 14.h),

                Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black12, width: 1.w),
                        ),
                        child: Icon(Icons.close, size: 16.sp, color: Colors.black54),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'اختر فئة المتجر',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff0d1e3d),
                        ),
                      ),
                    ),
                    SizedBox(width: 28.w),
                  ],
                ),
                Divider(color: const Color(0xfff0f4f8), height: 32.h),

                Flexible(
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 16.w,
                    childAspectRatio: 0.9,
                    children: [
                      _buildCategoryItem('مطاعم', Icons.restaurant, const Color(0xff623ce7)),
                      _buildCategoryItem('كافيهات', Icons.local_cafe_outlined, const Color(0xff623ce7)),
                      _buildCategoryItem('ملابس', Icons.checkroom_outlined, const Color(0xff623ce7)),
                      _buildCategoryItem('مساحات عمل', Icons.laptop_chromebook_outlined, const Color(0xff623ce7)),
                      _buildCategoryItem('هدايا', Icons.card_giftcard_outlined, const Color(0xff623ce7)),
                      _buildCategoryItem('أحذية', Icons.roller_skating_outlined, const Color(0xff623ce7)),
                      _buildCategoryItem('سيارات', Icons.directions_car_filled_outlined, const Color(0xff623ce7)),
                      _buildCategoryItem('مجوهرات', Icons.diamond_outlined, const Color(0xff623ce7)),
                      _buildCategoryItem('كوزمتكس', Icons.content_cut_outlined, const Color(0xff623ce7)),
                      _buildCategoryItem('سوبرماركت', Icons.shopping_cart_outlined, const Color(0xff623ce7)),
                      _buildCategoryItem('مول', Icons.business_outlined, const Color(0xff623ce7)),
                      _buildCategoryItem('متجر', Icons.storefront_outlined, const Color(0xff623ce7)),
                      _buildCategoryItem('إلكترونيات', Icons.devices_other_outlined, const Color(0xff623ce7)),
                      _buildCategoryItem('مستلزمات طبية', Icons.medical_services_outlined, const Color(0xff623ce7)),
                      _buildCategoryItem('بصريات', Icons.visibility_outlined, const Color(0xff623ce7)),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategoryItem(String name, IconData icon, Color primaryColor) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedCategory = name;
        });
        Navigator.pop(context);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 52.w,
            height: 52.h,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: primaryColor, size: 22.sp),
          ),
          SizedBox(height: 8.h),
          Text(
            name,
            style: TextStyle(
                fontSize: 12.sp,
                color: const Color(0xff4a5568),
                fontWeight: FontWeight.w500
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xff623ce7);
    const Color textColor = Color(0xff0d1e3d);
    const Color inputFillColor = Color(0xfff8faff);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor, size: 24.sp),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'اكمال بروفايل التاجر',
          style: TextStyle(color: Colors.grey, fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'الخطوة الأخيرة: إكمال بيانات المتجر',
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: textColor),
                  ),
                  SizedBox(height: 6.h),
                  LinearProgressIndicator(
                    value: 1.0,
                    minHeight: 4.h,
                    backgroundColor: const Color(0xffeff3ff),
                    valueColor: const AlwaysStoppedAnimation<Color>(primaryColor),
                  ),
                  SizedBox(height: 24.h),

                  // زر رفع شعار المتجر الدائري المفعّل بالكامل
                  Center(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: _showLogoSourceBottomSheet, // تفعيل الفتح عند اللمس
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                width: 90.w,
                                height: 90.h,
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.05),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: primaryColor.withOpacity(0.2), width: 1.5.w),
                                  // تحديث الخلفية لعرض الصورة فور اختيارها بنجاح
                                  image: _logoFile != null
                                      ? DecorationImage(
                                    image: FileImage(_logoFile!),
                                    fit: BoxFit.cover,
                                  )
                                      : null,
                                ),
                                // إذا تم اختيار صورة نقوم بإخفاء أيقونة الكاميرا الافتراضية
                                child: _logoFile == null
                                    ? Icon(Icons.add_a_photo_outlined, size: 32.sp, color: primaryColor)
                                    : null,
                              ),
                              Container(
                                padding: EdgeInsets.all(4.r),
                                decoration: const BoxDecoration(color: primaryColor, shape: BoxShape.circle),
                                child: Icon(Icons.edit, size: 14.sp, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'رفع شعار المتجر',
                          style: TextStyle(fontSize: 13.sp, color: Colors.grey, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // حقل اسم المتجر
                  _buildFieldLabel('اسم المتجر'),
                  TextFormField(
                    controller: _storeNameController,
                    style: TextStyle(fontSize: 14.sp),
                    decoration: _inputDecoration(hint: 'مثال: متجر التقنية الحديثة', fillColor: inputFillColor),
                  ),
                  SizedBox(height: 16.h),

                  // حقول (فئة المتجر والمنطقة) المتجاورة
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildFieldLabel('فئة المتجر'),
                            InkWell(
                              onTap: _showCategoryBottomSheet,
                              child: Container(
                                height: 54.h,
                                padding: EdgeInsets.symmetric(horizontal: 14.w),
                                decoration: BoxDecoration(
                                  color: inputFillColor,
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(color: Colors.black12.withOpacity(0.05)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        _selectedCategory ?? 'اختر الفئة',
                                        style: TextStyle(
                                          color: _selectedCategory != null ? textColor : Colors.black38,
                                          fontSize: 14.sp,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Icon(Icons.keyboard_arrow_down, color: Colors.black45, size: 20.sp),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildFieldLabel('المنطقة'),
                            DropdownButtonFormField<String>(
                              value: _selectedRegion,
                              hint: Text('اختر المنطقة', style: TextStyle(color: Colors.black38, fontSize: 14.sp)),
                              decoration: _inputDecoration(hint: '', fillColor: inputFillColor),
                              dropdownColor: Colors.white,
                              items: <String>['غزة', 'شمال غزة', 'الوسطى', 'خانيونس', 'رفح'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value, style: TextStyle(fontSize: 14.sp)),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedRegion = newValue;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // حقل العنوان بالتفصيل
                  _buildFieldLabel('العنوان بالتفصيل'),
                  TextFormField(
                    controller: _addressDetailController,
                    maxLines: 2,
                    style: TextStyle(fontSize: 14.sp),
                    decoration: _inputDecoration(hint: 'الشارع، رقم المبنى، المعلم القريب...', fillColor: inputFillColor),
                  ),
                  SizedBox(height: 16.h),

                  // صندوق تلميح الذكاء الاصطناعي التجميلي
                  Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [const Color(0xff623ce7).withOpacity(0.4), const Color(0xff00d4ff).withOpacity(0.3)],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.auto_awesome_outlined, color: primaryColor, size: 20.sp),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'تلميح الذكاء الاصطناعي',
                                style: TextStyle(fontWeight: FontWeight.bold, color: textColor, fontSize: 14.sp),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                'إضافة وصف دقيق يزيد من نسبة ظهور متجرك في نتائج البحث بنسبة 40%.',
                                style: TextStyle(color: textColor, fontSize: 12.sp, height: 1.4),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // حقل وصف المتجر
                  _buildFieldLabel('وصف المتجر'),
                  TextFormField(
                    controller: _descriptionController,
                    maxLines: 3,
                    style: TextStyle(fontSize: 14.sp),
                    decoration: _inputDecoration(hint: 'تحدث عن منتجاتك وما يميز متجرك...', fillColor: inputFillColor),
                  ),
                  SizedBox(height: 16.h),

                  // حقل رقم الواتساب
                  _buildFieldLabel('رقم الواتساب'),
                  Row(
                    children: [
                      Container(
                        width: 75.w,
                        height: 54.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xffeff3ff),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          '+970',
                          style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 15.sp),
                          textDirection: TextDirection.ltr,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: TextFormField(
                          controller: _whatsappController,
                          keyboardType: TextInputType.phone,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(fontSize: 14.sp),
                          decoration: _inputDecoration(hint: '59XXXXXXX', fillColor: inputFillColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // حقل مواعيد العمل
                  _buildFieldLabel('مواعيد العمل'),
                  TextFormField(
                    controller: _workHoursController,
                    style: TextStyle(fontSize: 14.sp),
                    decoration: _inputDecoration(hint: '10 صباحاً - 8 مساءً', fillColor: inputFillColor),
                  ),
                  SizedBox(height: 32.h),

                  // زر الحفظ والدخول للرئيسية
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.r),
                      gradient: const LinearGradient(
                        colors: [Color(0xff4a148c), Color(0xff623ce7)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // يمكنك هنا التحقق من رفع الصورة أيضاً، مثلاً: if (_logoFile != null)
                        if (widget.type == AppType.merchant) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen(type: AppType.merchant)),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen(type: AppType.client)),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'حفظ والدخول للرئيسية',
                            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          SizedBox(width: 8.w),
                          Icon(Icons.rocket_launch_outlined, color: Colors.white, size: 18.sp),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0.h, top: 4.0.h),
      child: Text(
        label,
        style: TextStyle(color: const Color(0xff0d1e3d), fontWeight: FontWeight.w500, fontSize: 14.sp),
      ),
    );
  }

  InputDecoration _inputDecoration({required String hint, required Color fillColor}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.black38, fontSize: 14.sp),
      filled: true,
      fillColor: fillColor,
      contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: Colors.black12.withOpacity(0.05)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: Colors.black12.withOpacity(0.05)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: Color(0xff623ce7), width: 1.5),
      ),
    );
  }
}