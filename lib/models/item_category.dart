import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemCategory {
  final String title;
  final IconData icon;

  const ItemCategory({
    required this.title,
    required this.icon,
  });
}

// 🔹 البيانات (List)
final List<ItemCategory> categories = [
  ItemCategory(title: "ملابس", icon: Icons.checkroom),
  ItemCategory(title: "احذية", icon: FontAwesomeIcons.shoePrints),
  ItemCategory(title: "كوزمتكس", icon: Icons.brush),
  ItemCategory(title: "مطاعم", icon: Icons.restaurant),
  ItemCategory(title: "سوبر ماركت", icon: Icons.shopping_bag_outlined),
  ItemCategory(title: "مساحات عمل", icon: Icons.laptop),
  ItemCategory(title: "الكترونيات", icon: Icons.devices),
  ItemCategory(title: "خدمات", icon: Icons.shopping_bag_outlined),
];