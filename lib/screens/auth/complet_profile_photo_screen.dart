import 'package:ai_saas/models/app_type.dart';
import 'package:ai_saas/screens/auth/code_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // ضرورية للتعامل مع ملف الصورة (File)


class CompleteProfilePhotoScreen extends StatefulWidget {
  const CompleteProfilePhotoScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfilePhotoScreen> createState() => _CompleteProfilePhotoScreenState();
}

class _CompleteProfilePhotoScreenState extends State<CompleteProfilePhotoScreen> {
  final TextEditingController _aiController = TextEditingController();

  // متغير لحفظ الصورة المختارة
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  // دالة لفتح واجهة اختيار الصورة (من المعرض أو الكاميرا)
  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: 80, // لتقليل حجم الصورة والحفاظ على الأداء
      );

      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      // يمكنك عرض رسالة خطأ هنا للمستخدم إذا رفض الصلاحيات
      debugPrint("خطأ أثناء التقاط الصورة: $e");
    }
  }

  // نافذة خيارات تظهر للمستخدم من الأسفل (BottomSheet)
  void _showImageSourceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
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
                  'اختر مصدر الصورة',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.h),
                ListTile(
                  leading: const Icon(Icons.photo_library, color: Color(0xFF5342E6)),
                  title: const Text('معرض الصور (Gallery)'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.camera_alt, color: Color(0xFF5342E6)),
                  title: const Text('الكاميرا (Camera)'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
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
    _aiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF5342E6);
    const Color backgroundColor = Color(0xFFF9FAFF);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'رفع صورة شخصية',
            style: GoogleFonts.ibmPlexSans(color: Colors.grey, fontSize: 14.sp),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),

                // دائرة رفع الصورة الشخصية التفاعلية
                GestureDetector(
                  onTap: () => _showImageSourceBottomSheet(context), // استدعاء القائمة عند الضغط
                  child: Container(
                    width: 140.r,
                    height: 140.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade100,
                      border: Border.all(
                        color: primaryColor.withOpacity(0.4),
                        width: 1.5,
                      ),
                      // إذا كانت هناك صورة مختارة يتم عرضها كخلفية للدائرة بشكل دائري مثالي
                      image: _imageFile != null
                          ? DecorationImage(
                        image: FileImage(_imageFile!),
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                    // إذا لم تكن هناك صورة، نعرض أيقونة الزائد الافتراضية
                    child: _imageFile == null
                        ? Center(
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        size: 36.r,
                        color: primaryColor,
                      ),
                    )
                        : null,
                  ),
                ),
                SizedBox(height: 24.h),

                Text(
                  'أضف صورتك الشخصية لتكتمل هويتك',
                  style: GoogleFonts.ibmPlexSans(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
                Text(
                  'يمكنك تغيير الصورة لاحقاً من إعدادات الحساب.',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey.shade500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.h),

                // أزرار التحكم (رفع صورة / تخطي)
// أزرار التحكم (رفع صورة / تخطي) المحدثة مع الـ Navigation
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        // يكون الزر غير مفعل (disabled) إذا لم يقم المستخدم باختيار صورة بعد
                        onPressed: _imageFile == null
                            ? null
                            : () async {
                          // 1. هنا نضع منطق رفع الملف المختار
                          debugPrint("جاري رفع الملف من المسار: ${_imageFile!.path}");

                          // يمكنك هنا استدعاء دالة الـ API الخاصة بك لرفع الصورة، مثلاً:
                          // await uploadProfileImage(_imageFile!);

                          // 2. الذهاب مباشرة إلى صفحة كود التسجيل وتمرير النوع كـ client
                          if (mounted) { // للتأكد من أن الـ Widget ما زال موجوداً في الـ شجرة قبل الـ Navigation
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CodeRegister(type: AppType.client),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          minimumSize: Size(double.infinity, 48.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'رفع صورة',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          // في حال الضغط على "تخطي" ينتقل أيضاً لصفحة الـ CodeRegister بدون رفع صورة
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CodeRegister(type: AppType.client),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: Size(double.infinity, 48.h),
                          side: const BorderSide(color: Color(0xFFE5E7EB)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          'تخطي',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),                SizedBox(height: 40.h),

                // بطاقة الذكاء الاصطناعي الملونة
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFB1BFFF), Color(0xFF86FAFF)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.auto_awesome, color: primaryColor, size: 20.r),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              'لا تملك صورة؟ اصنع واحدة تشبهك',
                              style: GoogleFonts.ibmPlexSans(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Padding(
                        padding: EdgeInsets.only(right: 28.w),
                        child: Text(
                          'كيف تودين أن تبدو صورتك ؟',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: primaryColor.withOpacity(0.8),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: TextFormField(
                          controller: _aiController,
                          style: TextStyle(fontSize: 13.sp),
                          decoration: InputDecoration(
                            hintText: 'وصف تفصيلي للصورة...',
                            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 12.sp),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(6.r),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor.withOpacity(0.15),
                                  elevation: 0,
                                  minimumSize: Size(64.w, 36.h),
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                                child: Text(
                                  'إنشاء',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}