import 'package:ai_saas/screens/widgets/add_product_textfield.dart';
import 'package:ai_saas/screens/widgets/size_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  bool isEnabled1 = false;
  bool isEnabled2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(radius: 24, backgroundColor: Colors.red),
            TextButton(
              onPressed: () {},
              child: Text(
                'حفظ كمسودة',
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff4D41DF),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'إضافة منتج جديد',
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),

        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.close))],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'بيانات المنتج الأساسية',
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 16,

                        fontWeight: FontWeight.bold,
                        color: const Color(0xff464555),
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const Icon(
                      Icons.storefront,
                      color: Color(0xff4D41DF),
                      size: 20,
                    ),
                  ],
                ),
              ),
              Text(
                'اسم المنتج',
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 16,

                  fontWeight: FontWeight.bold,
                  color: const Color(0xff464555),
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 10),
              const SizedBox(
                height: 56,
                width: 278,
                child: add_product_textfield(name: 'مثال: سماعات لاسلكي'),
              ),
              const SizedBox(height: 10),
              Text(
                '(USD)',
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 16,

                  fontWeight: FontWeight.bold,
                  color: const Color(0xff464555),
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 10),
              const SizedBox(
                height: 56,
                width: 278,
                child: add_product_textfield(name: '0.00'),
              ),
              const SizedBox(height: 10),
              Text(
                'الفئة',
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 16,

                  fontWeight: FontWeight.bold,
                  color: const Color(0xff464555),
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 10),
              const SizedBox(
                height: 56,
                width: 278,
                child: add_product_textfield(name: 'الالكترونيات'),
              ),
              const SizedBox(height: 10),

              Container(
                width: 320,
                height: 534,
                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 180,
                                height: 72,
                                decoration: BoxDecoration(
                                  color: const Color(0xff4D41DF),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        textAlign: TextAlign.right,
                                        'توليد وصف بالذكاء\n الاصطناعي',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(width: 14),
                                    Icon(
                                      Icons.auto_awesome,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                    SizedBox(width: 15),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),

                              const Text(
                                'وصف\n المنتج',
                                style: TextStyle(fontSize: 14),
                              ),
                              const SizedBox(width: 8),

                              const Icon(
                                Icons.insert_drive_file,
                                color: Color(0xff4D41DF),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Container(
                            height: 300,
                            width: 278,
                            child: TextField(
                              maxLines: null,
                              expands: true,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xffF2F3F6),
                                hintText:
                                    'ابدأ بكتابة وصف المنتج أو استخدم الذكاء\nالاصطناعي لتوليد وصف احترافي تلقائياً...',
                                hintStyle: GoogleFonts.ibmPlexSans(
                                  fontSize: 14,
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'نصحية الذكاء الاصطناعي',
                                  style: GoogleFonts.ibmPlexSans(
                                    fontSize: 14,
                                    color: Color(0xff3622CA),
                                  ),
                                ),
                                const Icon(
                                  Icons.lightbulb,
                                  color: Color(0xff3622CA),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.right,
                            'بالكلمات المفتاحية يزيد من ظهور منتجك في نتائج البحث بنسبة تصل إلى40%.الوصف الغني',
                            style: GoogleFonts.ibmPlexSans(
                              fontSize: 14,
                              color: Color(0xff3622CA),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        width: 6,
                        decoration: const BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 294,
                width: 294,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xffC7C4D8),
                      child: Icon(
                        Icons.add_a_photo,
                        color: Color(0xff3622CA),
                        size: 28,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'رفع صورة المنتج',
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'يدعم JPG, PNG. الحجم الأقصى 5 ميجابايت.',
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Color(0xffC7C4D8),
                          ),

                          child: Center(child: Icon(Icons.add)),
                        ),
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Color(0xffC7C4D8),
                          ),

                          child: Center(child: Icon(Icons.add)),
                        ),
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Color(0xffC7C4D8),
                          ),

                          child: Center(child: Icon(Icons.add)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                child: Column(
                  children: [
                    Text('الحالة والظهور'),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffC7C4D8),
                      ),
                      height: 44,
                      width: 294,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Switch(
                            activeThumbColor: Color(0xff006B5C),
                            value: isEnabled1,
                            onChanged: (value) {
                              setState(() {
                                isEnabled1 = value;
                              });
                            },
                          ),
                          SizedBox(width: 100),
                          Text(
                            'مرئي للجميع',
                            style: GoogleFonts.ibmPlexSans(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(width: 15),
                          Icon(Icons.remove_red_eye, color: Color(0xff006B5C)),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffC7C4D8),
                      ),
                      height: 44,
                      width: 294,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Switch(
                            activeThumbColor: Color(0xff006B5C),
                            value: isEnabled2,
                            onChanged: (value) {
                              setState(() {
                                isEnabled2 = value;
                              });
                            },
                          ),
                          SizedBox(width: 115),
                          Text(
                            'منتج مميز',
                            style: GoogleFonts.ibmPlexSans(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(width: 15),
                          Icon(
                            Icons.local_fire_department_outlined,
                            color: Color(0xff914800),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Size_Button(
                      name: 'نشر المنتج الآن',
                      color: Color(0xff3622CA),
                      size: Size(294, 60),
                      colorname: Colors.white,
                    ),
                    SizedBox(height: 20,),
                    Size_Button(
                      name: 'معاينة المتجر',
                      color: Color(0xffC7C4D8),
                      size: Size(294, 60),
                      colorname:Color(0xff191C1E) ,
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
