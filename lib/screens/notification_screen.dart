import 'package:ai_saas/screens/recently_arrived_screen.dart';
import 'package:flutter/material.dart';

// ==========================================
// 1. شاشة الإشعارات الأساسية (Notifications Screen)
// ==========================================
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8fafc), // خلفية الواجهة المائلة للبياض
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff3f2d56)),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text(
          'الاشعارات',
          style: TextStyle(
            color: Color(0xff1a1a1a),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Color(0xff3f2d56)),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        children: [
          // ------ قسم اليوم ------
          _buildSectionHeader('اليوم'),
          const SizedBox(height: 10),

          const NotificationCard(
            text: 'عرض 50% على كل القطع المتوفرة لدى محل حكاية .\nاستغل العرض الكمية محدودة',
            time: '10:30 am',
            icon: Icons.percent,
            iconColor: Colors.red,
            type: 'offer', // يوجه إلى شاشة العروض
          ),
          const SizedBox(height: 12),

          const NotificationCard(
            text: 'وصل حديثاً , كولشكن فساتين مناسبات لدى Lovista Store . متوفر بجميع المقاسات والألوان.',
            time: '9:30 am',
            icon: Icons.fiber_new,
            iconColor: Colors.orange,
            type: 'new_arrival', // يوجه إلى شاشة وصل حديثاً
          ),

          const SizedBox(height: 24),

          // ------ قسم الأمس ------
          _buildSectionHeader('الأمس'),
          const SizedBox(height: 10),

          const NotificationCard(
            text: 'عرض 50% على كل القطع المتوفرة لدى محل حكاية .\nاستغل العرض الكمية محدودة',
            time: '10:30 am',
            icon: Icons.percent,
            iconColor: Colors.red,
            type: 'offer',
          ),
          const SizedBox(height: 12),

          const NotificationCard(
            text: 'وصل حديثاً , كولشكن فساتين مناسبات لدى Lovista Store . متوفر بجميع المقاسات والألوان.',
            time: '9:30 am',
            icon: Icons.fiber_new,
            iconColor: Colors.orange,
            type: 'new_arrival',
          ),
        ],
      ),
    );
  }

  // ويدجت عنوان القسم (اليوم / الأمس)
  Widget _buildSectionHeader(String title) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xff1a1a1a),
        ),
      ),
    );
  }
}

// ==========================================
// 2. ويدجت كرت الإشعار الذكي والمنفصل (Notification Card)
// ==========================================
class NotificationCard extends StatelessWidget {
  final String text;
  final String time;
  final IconData icon;
  final Color iconColor;
  final String type; // الفحص عن طريق النوع: 'offer' أو 'new_arrival'

  const NotificationCard({
    Key? key,
    required this.text,
    required this.time,
    required this.icon,
    required this.iconColor,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // فحص نوع الإشعار والانتقال بناءً عليه
        if (type == 'new_arrival') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RecentlyArrivedScreen()),
          );
        } else if (type == 'offer') {

        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200, width: 1.5),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // نص الإشعار والوقت في عمود مرن
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // الأيقونة الدائرية الملونة جهة اليسار
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(color: iconColor.withOpacity(0.3), width: 1),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

