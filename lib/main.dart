import 'package:ai_saas/screens/auth/forget_password_screen.dart';
import 'package:ai_saas/screens/auth/complete_registration_screen.dart';
import 'package:ai_saas/screens/notification_screen.dart';
import 'package:ai_saas/screens/onboarding2.dart';
import 'package:ai_saas/screens/search_screen.dart';
import 'package:ai_saas/screens/shop_page.dart';
import 'package:ai_saas/screens/shopper_home.dart';
import 'package:ai_saas/screens/widgets/bn_screen.dart';
import 'package:flutter/material.dart';

import 'package:ai_saas/models/app_type.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppType? appType;

  // Note: logic here might need adjustment based on how appType is retrieved
  if (appType == 'merchant') {
    appType = AppType.merchant;
  } else if (appType == 'client') {
    appType = AppType.client;
  }

  runApp(MyApp(appType: appType));
}

class MyApp extends StatelessWidget {
  final AppType? appType;

  const MyApp({super.key, required this.appType});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xffF2F3F6),
          ),
          // home: appType == null
          //     ? const UserSelection()
          //     : BnScreen(type: appType!),
          home: const OnboardingAIPage(),
          // home: BnScreen(type: AppType.merchant),
          //   home: CompleteProfileScreen(),
        );
      },
    );
  }
}
