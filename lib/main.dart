import 'package:ai_saas/screens/add_product.dart';
import 'package:ai_saas/screens/splash_screen.dart';
import 'package:ai_saas/screens/user_selection.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffF2F3F6)
      ),

      // home: UserSelection(),
      // home:SplashScreen(),
      home: AddProduct(),
    );
  }
}

