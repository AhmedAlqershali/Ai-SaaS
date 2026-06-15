import 'package:ai_saas/screens/store_details_screen.dart';
import 'package:flutter/material.dart';
// تأكد من استيراد كلاس تفاصيل المتجر هنا إذا كان في ملف منفصل
// import 'store_details_screen.dart';

class NearbyStoresScreen extends StatelessWidget {
  const NearbyStoresScreen({Key? key}) : super(key: key);

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
          'المتاجر القريبة',
          style: TextStyle(
            color: Color(0xff1a1a1a),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        children: const [
          // المتجر الأول: الرئيسي كوزمتكس
          StoreCard(
            storeName: 'الرئيسي كوزمتكس',
            location: 'النصيرات , مقابل هايبر مول',
            rating: '4.7',
            imageUrl: 'https://images.unsplash.com/photo-1441986300917-64674bd600d8?q=80&w=600',
            targetScreen: StoreDetailsScreen(), // نمرر كلاس واجهة تفاصيل المتجر هنا
          ),
          SizedBox(height: 16),

          // المتجر الثاني: معرض حكاية
          StoreCard(
            storeName: 'معرض حكاية للملابس',
            location: 'النصيرات , وسط شارع القسام',
            rating: '4.1',
            imageUrl: 'https://images.unsplash.com/photo-1596462502278-27bfdc403348?q=80&w=600',
            targetScreen: StoreDetailsScreen(), // يمكنك تمرير كلاس آخر مستقبلاً لكل متجر
          ),
          SizedBox(height: 16),

          // المتجر الثالث: wow Fashion
          StoreCard(
            storeName: 'wow Fashion',
            location: 'النصيرات , مقابل هايبر مول',
            rating: '4.5',
            imageUrl: 'https://images.unsplash.com/photo-1525507119028-ed4c629a60a3?q=80&w=600',
            targetScreen: StoreDetailsScreen(),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// التعديل هنا: كلاس كرت المتجر المحدث ليستقبل الهدف
// ==========================================
class StoreCard extends StatelessWidget {
  final String storeName;
  final String location;
  final String rating;
  final String imageUrl;
  final Widget targetScreen; // 1. أضفنا متغير لاستقبال الواجهة المستهدفة

  const StoreCard({
    Key? key,
    required this.storeName,
    required this.location,
    required this.rating,
    required this.imageUrl,
    required this.targetScreen, // 2. أصبح مطلوباً عند الاستدعاء
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 3. عند الضغط ينتقل تلقائياً للواجهة الممررة
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetScreen),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          rating,
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    storeName,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff1a1a1a)),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        location,
                        style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.location_on_outlined, size: 16, color: Colors.grey.shade700),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}