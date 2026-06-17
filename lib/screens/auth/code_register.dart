import 'package:ai_saas/models/app_type.dart';
import 'package:ai_saas/screens/auth/login_screen.dart';
import 'package:ai_saas/screens/widgets/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeRegister extends StatefulWidget {
  final AppType type;
  const CodeRegister({super.key, required this.type});
  @override
  State<CodeRegister> createState() => _CodeRegisterState();
}

class _CodeRegisterState extends State<CodeRegister> {
  late TextEditingController _firstCodeTextController;
  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;
  late TextEditingController _fourthCodeTextController;

  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;

  late TextEditingController _passwordTextController;
  late TextEditingController _passwordConfirmationTextController;

  @override
  void initState() {
    super.initState();
    _firstCodeTextController = TextEditingController();
    _secondCodeTextController = TextEditingController();
    _thirdCodeTextController = TextEditingController();
    _fourthCodeTextController = TextEditingController();

    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _fourthFocusNode = FocusNode();

    _passwordTextController = TextEditingController();
    _passwordConfirmationTextController = TextEditingController();
  }

  @override
  void dispose() {
    _firstCodeTextController.dispose();
    _secondCodeTextController.dispose();
    _thirdCodeTextController.dispose();
    _fourthCodeTextController.dispose();

    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();

    _passwordTextController.dispose();
    _passwordConfirmationTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffF8F9FD), // الخلفية الهادئة الموحدة لـ Tradex
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87)
          ),
          title: Text(
            'Tradex',
            style: GoogleFonts.ibmPlexSans(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xff4D41DF),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),

                  // ======= أيقونة الحماية والأمان العلوية =======
                  CircleAvatar(
                    radius: 40.r,
                    backgroundColor: const Color(0xff4D41DF).withOpacity(0.1),
                    child: Icon(
                        Icons.security_rounded,
                        size: 36.sp,
                        color: const Color(0xff4D41DF)
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // ======= العنوان الرئيسي =======
                  Text(
                    'كود التحقق',
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff1A1A1A),
                    ),
                  ),
                  SizedBox(height: 12.h),

                  // ======= نصوص التوجيه ورقم الهاتف =======
                  Text(
                    'لقد أرسلنا رمزاً مكوناً من 4 أرقام إلى هاتفك',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 14.sp,
                      color: const Color(0xff707070),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '+966 50 XXX XXXX',
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff1A1A1A),
                    ),
                  ),
                  SizedBox(height: 32.h),

                  // ======= حقول إدخال الرمز الـ 4 أرقام =======
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CodeTextField(
                        editingController: _firstCodeTextController,
                        focusNode: _firstFocusNode,
                        onChanged: (String value) {
                          if (value.isNotEmpty) {
                            _secondFocusNode.requestFocus();
                          }
                        },
                      ),
                      SizedBox(width: 12.w),
                      CodeTextField(
                        editingController: _secondCodeTextController,
                        focusNode: _secondFocusNode,
                        onChanged: (String value) {
                          value.isNotEmpty
                              ? _thirdFocusNode.requestFocus()
                              : _firstFocusNode.requestFocus();
                        },
                      ),
                      SizedBox(width: 12.w),
                      CodeTextField(
                        editingController: _thirdCodeTextController,
                        focusNode: _thirdFocusNode,
                        onChanged: (String value) {
                          value.isNotEmpty
                              ? _fourthFocusNode.requestFocus()
                              : _secondFocusNode.requestFocus();
                        },
                      ),
                      SizedBox(width: 12.w),
                      CodeTextField(
                        editingController: _fourthCodeTextController,
                        focusNode: _fourthFocusNode,
                        onChanged: (String value) {
                          if (value.isEmpty) {
                            _thirdFocusNode.requestFocus();
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),

                  // ======= قسم العداد المؤقتي للرمز =======
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'لم يصلك الكود؟ ',
                        style: GoogleFonts.ibmPlexSans(
                          fontSize: 14.sp,
                          color: const Color(0xff707070),
                        ),
                      ),
                      Text(
                        '0:59',
                        style: GoogleFonts.ibmPlexSans(
                          fontSize: 14.sp,
                          color: const Color(0xff4D41DF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),

                  // ======= زر إعادة الإرسال التفاعلي =======
                  TextButton(
                    onPressed: () {
                      // أكشن إعادة إرسال الكود
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                    ),
                    child: Text(
                      'إعادة ارسال الكود',
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 14.sp,
                        color: const Color(0xff4D41DF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),

                  // ======= زر المتابعة وتأكيد الرمز الرئيسي =======
                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(
                              type: widget.type == AppType.merchant ? AppType.merchant : AppType.client,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff4D41DF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'تأكيد الرمز',
                        style: GoogleFonts.ibmPlexSans(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
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
}