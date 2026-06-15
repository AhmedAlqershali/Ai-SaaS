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
            type: 'offer', // يوجه إلى OfferScreen
          ),
          const SizedBox(height: 12),

          const NotificationCard(
            text: 'وصل حديثاً , كولشكن فساتين مناسبات لدى Lovista Store . متوفر بجميع المقاسات والألوان.',
            time: '9:30 am',
            icon: Icons.fiber_new,
            iconColor: Colors.orange,
            type: 'new_arrival', // يوجه إلى RecentlyArrivedScreen
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
            type: 'offer', // يوجه إلى OfferScreen
          ),
          const SizedBox(height: 12),

          const NotificationCard(
            text: 'وصل حديثاً , كولشكن فساتين مناسبات لدى Lovista Store . متوفر بجميع المقاسات والألوان.',
            time: '9:30 am',
            icon: Icons.fiber_new,
            iconColor: Colors.orange,
            type: 'new_arrival', // يوجه إلى RecentlyArrivedScreen
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
// 2. ويدجت كرت الإشعار (Notification Card) مع الفحص الذكي
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
        // فحص نوع الإشعار والانتقال بناءً على طلبك الدقيق للكلاسات
        if (type == 'new_arrival') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RecentlyArrivedScreen()),
          );
        } else if (type == 'offer') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OfferScreen()),
          );
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

// ==========================================
// 3. شاشة "وصل حديثاً" (RecentlyArrivedScreen)
// ==========================================
class RecentlyArrivedScreen extends StatelessWidget {
  const RecentlyArrivedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8fafc),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff1a1a1a)),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text(
          'وصل حديثاً',
          style: TextStyle(
            color: Color(0xff1a1a1a),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.72,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return _buildProductCard();
        },
      ),
    );
  }

  Widget _buildProductCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: const DecorationImage(
                      image: NetworkImage('https://images.unsplash.com/photo-1595777457583-95e059d581b8?q=80&w=500'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.black54,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'فستان سهرة قصير',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1a1a1a),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _buildColorDot(const Color(0xff912b39)),
                        const SizedBox(width: 4),
                        _buildColorDot(Colors.black),
                        const SizedBox(width: 4),
                        _buildColorDot(const Color(0xff0f4c81)),
                      ],
                    ),
                    const Text(
                      '₪220',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorDot(Color color) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

// ==========================================
// 4. شاشة العروض المحدثة (OfferScreen)
// ==========================================
class OfferScreen extends StatelessWidget {
  const OfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8fafc),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff1a1a1a)),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text(
          'العروض والتخفيضات',
          style: TextStyle(
            color: Color(0xff1a1a1a),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'مرحباً بك في واجهة العروض (OfferScreen)',
          style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}