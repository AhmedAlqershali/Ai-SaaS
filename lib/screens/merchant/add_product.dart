import 'package:ai_saas/screens/widgets/add_product_textfield.dart';
import 'package:ai_saas/screens/widgets/size_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  bool isEnabled1 = false;
  bool isEnabled2 = false;

  // الصورة الحالية الموجودة في الكاميرا العلوية (المعاينة)
  File? _currentCameraImage;

  // قائمة الصور التي تم تأكيدها وانضمت لخانات الزائد بالأسفل (الحد الأقصى 3)
  final List<File> _attachedImages = [];
  final int _maxImages = 3;

  final ImagePicker _picker = ImagePicker();

  // دالة التقاط الصورة عند الضغط على الكاميرا العلوية
  Future<void> _pickImageFromCamera(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source, imageQuality: 80);
      if (pickedFile != null) {
        setState(() {
          _currentCameraImage = File(pickedFile.path);
        });

        // بمجرد اختيار الصورة والموافقة، ننقلها تلقائياً إلى خانات الزائد بالأسفل
        _moveImageToGrid();
      }
    } catch (e) {
      debugPrint("خطأ في التقاط الصورة: $e");
    }
  }

  // الدالة المسؤول عن نقل الصورة من الكاميرا العلوية إلى مربعات الزائد بالأسفل
  void _moveImageToGrid() {
    if (_currentCameraImage != null) {
      if (_attachedImages.length < _maxImages) {
        setState(() {
          _attachedImages.add(_currentCameraImage!);
          _currentCameraImage = null; // تصفير الكاميرا العلوية لتصبح جاهزة للصورة التالية
        });
      } else {
        // تنبيه المستخدم في حال امتلأت الخانات الثلاثة
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم الوصول للحد الأقصى من الصور (3 صور فقط)'),
            backgroundColor: Colors.orange,
          ),
        );
        setState(() {
          _currentCameraImage = null;
        });
      }
    }
  }

  // حذف صورة معينة من الخانات السفلى وإعادتها كزر زائد
  void _removeAttachedImage(int index) {
    setState(() {
      _attachedImages.removeAt(index);
    });
  }

  // نافذة اختيار مصدر الصورة العلوية
  void _showImageSourceBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
      ),
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('اختر مصدر الصورة للكاميرا', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                SizedBox(height: 16.h),
                ListTile(
                  leading: const Icon(Icons.photo_library, color: Color(0xff3622CA)),
                  title: const Text('معرض الصور (Gallery)'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImageFromCamera(ImageSource.gallery);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.camera_alt, color: Color(0xff3622CA)),
                  title: const Text('الكاميرا (Camera)'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImageFromCamera(ImageSource.camera);
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(radius: 24.r, backgroundColor: Colors.red),
            TextButton(
              onPressed: () {},
              child: Text(
                'حفظ كمسودة',
                style: GoogleFonts.ibmPlexSans(fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xff4D41DF)),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'إضافة منتج جديد',
                style: GoogleFonts.ibmPlexSans(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ],
        ),
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.close, size: 24.sp))],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ... قسم الحقول الأساسية والوصف ...
              Padding(
                padding: EdgeInsets.all(18.0.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('بيانات المنتج الأساسية', style: GoogleFonts.ibmPlexSans(fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xff464555)), textAlign: TextAlign.right),
                    SizedBox(width: 8.w),
                    Icon(Icons.storefront, color: const Color(0xff4D41DF), size: 20.sp),
                  ],
                ),
              ),
              Text('اسم المنتج', style: GoogleFonts.ibmPlexSans(fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xff464555)), textAlign: TextAlign.right),
              SizedBox(height: 10.h),
              SizedBox(height: 56.h, width: 278.w, child: const add_product_textfield(name: 'مثال: سماعات لاسلكي')),
              SizedBox(height: 10.h),
              Text('(USD)', style: GoogleFonts.ibmPlexSans(fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xff464555)), textAlign: TextAlign.right),
              SizedBox(height: 10.h),
              SizedBox(height: 56.h, width: 278.w, child: const add_product_textfield(name: '0.00')),
              SizedBox(height: 10.h),
              Text('الفئة', style: GoogleFonts.ibmPlexSans(fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xff464555)), textAlign: TextAlign.right),
              SizedBox(height: 10.h),
              SizedBox(height: 56.h, width: 278.w, child: const add_product_textfield(name: 'الالكترونيات')),
              SizedBox(height: 10.h),

              Container(
                width: 320.w,
                height: 534.h,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topRight: Radius.circular(16.r))),
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 180.w,
                                height: 72.h,
                                decoration: BoxDecoration(color: const Color(0xff4D41DF), borderRadius: BorderRadius.circular(24.r)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Flexible(child: Text(textAlign: TextAlign.right, 'توليد وصف بالذكاء\n الاصطناعي', style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis)),
                                    SizedBox(width: 14.w),
                                    Icon(Icons.auto_awesome, color: Colors.white, size: 22.sp),
                                    SizedBox(width: 15.w),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Text('وصف\n المنتج', style: TextStyle(fontSize: 14.sp)),
                              SizedBox(width: 8.w),
                              Icon(Icons.insert_drive_file, color: const Color(0xff4D41DF), size: 24.sp),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          SizedBox(
                            height: 300.h,
                            width: 278.w,
                            child: TextField(
                              maxLines: null,
                              expands: true,
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 14.sp),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xffF2F3F6),
                                hintText: 'ابدأ بكتابة وصف المنتج أو استخدم الذكاء\nالاصطناعي لتوليد وصف احترافي تلقائياً...',
                                hintStyle: GoogleFonts.ibmPlexSans(fontSize: 14.sp),
                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24.r)),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('نصحية الذكاء الاصطناعي', style: GoogleFonts.ibmPlexSans(fontSize: 14.sp, color: const Color(0xff3622CA))),
                              SizedBox(width: 4.w),
                              Icon(Icons.lightbulb, color: const Color(0xff3622CA), size: 20.sp),
                            ],
                          ),
                          Text(textAlign: TextAlign.right, 'بالكلمات المفتاحية يزيد من ظهور منتجك في نتائج البحث بنسبة تصل إلى40%.الوصف الغني', style: GoogleFonts.ibmPlexSans(fontSize: 14.sp, color: const Color(0xff3622CA))),
                        ],
                      ),
                    ),
                    Positioned(left: 0, top: 0, bottom: 0, child: Container(width: 6.w, decoration: BoxDecoration(color: Colors.deepPurple, borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r), bottomLeft: Radius.circular(16.r))))),
                  ],
                ),
              ),
              SizedBox(height: 30.h),

              // ======= قسم رفع ومعاينة وتأكيد الصور الديناميكي بالكامل =======
              Container(
                height: 294.h,
                width: 294.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // زر الكاميرا العلوي (المُحرك الأساسي لرفع الصور)
                    GestureDetector(
                      onTap: _showImageSourceBottomSheet,
                      child: CircleAvatar(
                        radius: 30.r,
                        backgroundColor: const Color(0xffC7C4D8),
                        // يعرض المعاينة المؤقتة إذا التقطت صورة ولم تنزل بعد للاسفل، وإلا يعرض أيقونة الكاميرا الافتراضية
                        backgroundImage: _currentCameraImage != null ? FileImage(_currentCameraImage!) : null,
                        child: _currentCameraImage == null
                            ? Icon(Icons.add_a_photo, color: const Color(0xff3622CA), size: 28.sp)
                            : null,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'اضغط على الكاميرا لرفع الصورة',
                      style: GoogleFonts.ibmPlexSans(fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'الصور المرفوعة ستنتقل مباشرة إلى خانات الزائد بالأسفل.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ibmPlexSans(fontSize: 11.sp, color: Colors.black54),
                    ),
                    SizedBox(height: 15.h),

                    // سطر المربعات الثلاثة: يستقبل الصور بالتتابع ويحذف علامة الزائد منها
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(3, (index) {
                        // 1. إذا كان هذا المربع يحتوي على صورة منقولة من الكاميرا
                        if (index < _attachedImages.length) {
                          return Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                width: 80.w,
                                height: 80.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24.r),
                                  image: DecorationImage(
                                    image: FileImage(_attachedImages[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // زر لحذف هذه الصورة وإرجاعها كعلامة زائد (+) مجدداً
                              GestureDetector(
                                onTap: () => _removeAttachedImage(index),
                                child: CircleAvatar(
                                  radius: 10.r,
                                  backgroundColor: Colors.red,
                                  child: Icon(Icons.close, size: 12.sp, color: Colors.white),
                                ),
                              ),
                            ],
                          );
                        }
                        // 2. إذا كانت هذه الخانة فارغة وجاهزة لاستقبال الصورة القادمة من الكاميرا، تظهر كعلامة زائد (+)
                        else {
                          return Container(
                            width: 80.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.r),
                              color: const Color(0xffC7C4D8),
                              border: index == _attachedImages.length
                                  ? Border.all(color: const Color(0xff3622CA), width: 1.w) // تمييز المربع النشط التالي
                                  : null,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                size: 24.sp,
                                color: index == _attachedImages.length ? const Color(0xff3622CA) : Colors.black26,
                              ),
                            ),
                          );
                        }
                      }),
                    ),
                  ],
                ),
              ),
              // ==========================================

              SizedBox(height: 30.h),
              Column(
                children: [
                  Text('الحالة والظهور', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10.h),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: const Color(0xffC7C4D8)),
                    height: 44.h,
                    width: 294.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Switch(activeThumbColor: const Color(0xff006B5C), value: isEnabled1, onChanged: (value) { setState(() { isEnabled1 = value; }); }),
                        const Spacer(),
                        Text('مرئي للجميع', style: GoogleFonts.ibmPlexSans(fontSize: 16.sp, color: Colors.black54)),
                        SizedBox(width: 15.w),
                        Icon(Icons.remove_red_eye, color: const Color(0xff006B5C), size: 24.sp),
                        SizedBox(width: 15.w),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: const Color(0xffC7C4D8)),
                    height: 44.h,
                    width: 294.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Switch(activeThumbColor: const Color(0xff006B5C), value: isEnabled2, onChanged: (value) { setState(() { isEnabled2 = value; }); }),
                        const Spacer(),
                        Text('منتج مميز', style: GoogleFonts.ibmPlexSans(fontSize: 16.sp, color: Colors.black54)),
                        SizedBox(width: 15.w),
                        Icon(Icons.local_fire_department_outlined, color: const Color(0xff914800), size: 24.sp),
                        SizedBox(width: 15.w),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Size_Button(
                    onPressed: () {
                      // عند ضغط نشر المنتج، تجد الصور المرفوعة كلها مخزنة داخل القائمة جاهزة للإرسال للسيرفر
                      debugPrint("عدد الصور المرفوعة الإجمالي: ${_attachedImages.length}");
                    },
                    name: 'نشر المنتج الآن',
                    color: const Color(0xff3622CA),
                    size: Size(294.w, 60.h),
                    colorname: Colors.white,
                  ),
                  SizedBox(height: 20.h),
                  Size_Button(onPressed: () {}, name: 'معاينة المتجر', color: const Color(0xffC7C4D8), size: Size(294.w, 60.h), colorname: const Color(0xff191C1E)),
                  SizedBox(height: 20.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}