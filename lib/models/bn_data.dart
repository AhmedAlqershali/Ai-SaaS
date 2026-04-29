import 'package:ai_saas/models/app_type.dart';
import 'package:flutter/material.dart';
import 'package:ai_saas/models/bn_item.dart';
import 'package:ai_saas/screens/home_screen.dart';
import 'package:ai_saas/screens/search_screen.dart';

class NavConfig {
  static List<BnItem> getItems(AppType type) {
    switch (type) {
      case AppType.client:
        return [
          BnItem(
            widget: HomeScreen(),
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
        ];
      case AppType.guest:
        return [
          BnItem(
            widget: HomeScreen(),
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
        ];

      case AppType.merchant:
        return [
          BnItem(
            widget: HomeScreen(),
            title: "Dashboard",
            icon: Icons.dashboard_outlined,
            activeIcon: Icons.dashboard,
          ),
          BnItem(
            widget: SearchScreen(),
            title: "Orders",
            icon: Icons.shopping_cart_outlined,
            activeIcon: Icons.shopping_cart,
          ),
          BnItem(
            widget: Container(color: Colors.orange),
            title: "Products",
            icon: Icons.inventory_2_outlined,
            activeIcon: Icons.inventory_2,
          ),
        ];
    }
  }
}
