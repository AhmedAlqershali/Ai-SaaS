import 'package:ai_saas/screens/widgets/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeRegister extends StatefulWidget {
  const CodeRegister({Key? key}) : super(key: key);

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
    // TODO: implement initState
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
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Tradex',
            style: GoogleFonts.ibmPlexSans(
              fontSize: 32,
              color: Color(0xff8127CF),
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
          ],
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.all(18),
          child: Column(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Icon(Icons.security, size: 40, color: Color(0xff8127CF)),
              ),
              Text(
                'كود التحقق ',
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),

              Text(
                'لقد أرسلنا رمزاً مكوناً من 4 أرقام إلى هاتفك',
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 16,
                  height: 1.0,
                  color: Colors.black45,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                '+966 50 XXX XXXX',
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 16,
                  height: 1.0,
                  color: Colors.black45,
                  fontWeight: FontWeight.normal,
                ),
              ),

              const SizedBox(height: 25),
              Row(
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
                  const SizedBox(width: 10),
                  CodeTextField(
                    editingController: _secondCodeTextController,
                    focusNode: _secondFocusNode,
                    onChanged: (String value) {
                      value.isNotEmpty
                          ? _thirdFocusNode.requestFocus()
                          : _firstFocusNode.requestFocus();
                    },
                  ),
                  const SizedBox(width: 10),
                  CodeTextField(
                    editingController: _thirdCodeTextController,
                    focusNode: _thirdFocusNode,
                    onChanged: (String value) {
                      value.isNotEmpty
                          ? _fourthFocusNode.requestFocus()
                          : _secondFocusNode.requestFocus();
                    },
                  ),
                  const SizedBox(width: 10),
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
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'لم يصلك الكود',
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 16,
                      height: 1.0,
                      color: Colors.black45,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    '0:59',
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 16,
                      height: 1.0,
                      color: Color(0xff8127CF),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),

              TextButton(
                onPressed: () {},
                child: Text(
                  'اعادة ارسال الكود',
                  style: GoogleFonts.ibmPlexSans(
                    fontSize: 16,
                    height: 1.0,
                    color: Colors.black45,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('تأكيد الرمز', style: GoogleFonts.cairo()),
                style: ElevatedButton.styleFrom(minimumSize: const Size(0, 50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
