import 'package:flutter/material.dart';

import 'package:ai_saas/screens/widgets/bn_screen.dart';
import 'package:ai_saas/screens/user_selection.dart';
import 'package:ai_saas/models/app_type.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  AppType? appType;

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: appType == null
          ? const UserSelection()
          : BnScreen(type: appType!),
    );
  }
}