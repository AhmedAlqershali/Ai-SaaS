import 'package:ai_saas/models/app_type.dart';
import 'package:ai_saas/models/bn_data.dart';
import 'package:flutter/material.dart';

class BnScreen extends StatefulWidget {
  final AppType type;

  const BnScreen({super.key, required this.type});

  @override
  State<BnScreen> createState() => _BnScreenState();
}

class _BnScreenState extends State<BnScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print("CURRENT TYPE: ${widget.type}");
    final items = NavConfig.getItems(widget.type);

    return Scaffold(

      body: items[_currentIndex].widget,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        items: List.generate(items.length, (index) {
          final item = items[index];
          return BottomNavigationBarItem(
            icon: Icon(item.icon),
            activeIcon: Icon(item.activeIcon),
            label: item.title,
          );
        }),
      ),
    );
  }
}