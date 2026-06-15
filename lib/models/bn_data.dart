import 'package:ai_saas/models/app_type.dart';
import 'package:ai_saas/screens/client/categories_screen.dart';
import 'package:ai_saas/screens/merchant/ai_marketing_tools.dart';
import 'package:ai_saas/screens/profile_screen.dart';
import 'package:ai_saas/screens/search_screen.dart';
import 'package:ai_saas/screens/shopper_home.dart';
import 'package:flutter/material.dart';
import 'package:ai_saas/models/bn_item.dart';


class NavConfig {
  static List<BnItem> getItems(AppType type) {
    switch (type) {

    // 👇 العميل
      case AppType.client:
        return [
          BnItem(
            widget: ShopperHomePage(),
            title: "Home",
            icon: Icons.home_outlined,
            activeIcon: Icons.home,
          ),
          BnItem(
            widget: SearchScreen(),
            title: "Search",
            icon: Icons.search_outlined,
            activeIcon: Icons.search,
          ),BnItem(
            widget: CategoriesScreen(),
            title: "Categories",
            icon: Icons.category_rounded,
            activeIcon: Icons.category_rounded,
          ),BnItem(
            widget: ProfileScreen(),
            title: "Profile",
            icon: Icons.person,
            activeIcon: Icons.person,
          ),
        ];

    // 👇 التاجر
      case AppType.merchant:
        return [
          BnItem(
            widget: ShopperHomePage(),
            title: "Home",
            icon: Icons.home_outlined,
            activeIcon: Icons.home,
          ),
          BnItem(
            widget: SearchScreen(),
            title: "Search",
            icon: Icons.search_outlined,
            activeIcon: Icons.search,
          ),

          BnItem(
            widget: ProfileScreen(),
            title: "Profile",
            icon: Icons.person,
            activeIcon: Icons.person,
          ),
        ];
      case AppType.guest:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}