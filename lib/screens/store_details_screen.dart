import 'package:ai_saas/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

// نفترض أنك قمت بإنشاء شاشة تفاصيل المنتج المذكورة سابقاً في ملف مستقل، أو يمكنك تركها في نفس الملف
// import 'product_details_screen.dart';

// ==========================================
// 1. شاشة تفاصيل المتجر (Store Details Screen)
// ==========================================
class StoreDetailsScreen extends StatelessWidget {
  const StoreDetailsScreen({Key? key}) : super(key: key);

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
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end, // محاذاة العناصر للغة العربية
          children: [
            // صورة المتجر الرئيسية
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: const DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1596462502278-27bfdc403348?q=80&w=600'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // اسم المتجر والتقييم
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.star, color: Colors.amber, size: 18),
                    SizedBox(width: 4),
                    Text(
                      '4.7',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
                const Text(
                  'الرئيسي كوزمتكس',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1a1a1a),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // قسم عن المتجر
            const Text(
              'عن المتجر',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 6),
            const Text(
              'نحن في (الرئيسي كوزمتكس) نؤمن أن الجمال هو انعكاس للعناية بالتفاصيل. متخصصون في توفير أرقى منتجات التجميل والعناية بالبشرة من أشهر العلامات التجارية العالمية، لنضمن لك تجربة تسوق تلبي احتياجاتك وتبرز جمالك بلمسة احترافية.',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 13, color: Colors.black54, height: 1.6),
            ),
            const SizedBox(height: 20),

            // تفاصيل العنوان ومواعيد العمل
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: const [
                        Text('مواعيد العمل :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                        SizedBox(width: 4),
                        Icon(Icons.access_time, size: 16, color: Colors.black54),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text('10 صباحاً - 8 مساءً', style: TextStyle(fontSize: 12, color: Colors.black54)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: const [
                        Text('العنوان :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                        SizedBox(width: 4),
                        Icon(Icons.location_on_outlined, size: 16, color: Colors.black54),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text('النصيرات , مقابل هايبر مول', style: TextStyle(fontSize: 12, color: Colors.black54)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'مفتوح الآن',
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(),
            ),

            // ------ قسم جديدنا ------
            _buildSectionHeader('جديدنا'),
            const SizedBox(height: 10),
            _buildHorizontalProductList(),

            const SizedBox(height: 20),

            // ------ قسم الأكثر مبيعاً ------
            _buildSectionHeader('الأكثر مبيعاً'),
            const SizedBox(height: 10),
            _buildHorizontalProductList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xff1a1a1a),
      ),
    );
  }

  Widget _buildHorizontalProductList() {
    return SizedBox(
      height: 175,
      child: ListView(
        scrollDirection: Axis.horizontal,
        reverse: true, // يبدأ التمرير من اليمين لليسام ليناسب اللغة العربية
        physics: const BouncingScrollPhysics(),
        children: const [
          ProductItemCard(
            title: 'سيروم الكافيين للعيون',
            price: '200',
            imageUrl: 'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?q=80&w=300',
          ),
          SizedBox(width: 12),
          ProductItemCard(
            title: 'سيروم نياسيناميد',
            price: '210',
            imageUrl: 'https://images.unsplash.com/photo-1608248597481-496100c8c836?q=80&w=300',
          ),
          SizedBox(width: 12),
          ProductItemCard(
            title: 'تونر البشرة النقي',
            price: '180',
            imageUrl: 'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?q=80&w=300',
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 2. كرت المنتج المحدث مع خاصية الضغط والانتقال (Product Item Card)
// ==========================================
class ProductItemCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductItemCard({
    Key? key,
    required this.title,
    required this.price,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // الانتقال لشاشة تفاصيل المنتج وتمرير البيانات الحالية له تلقائياً
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(),
          ),
        );
      },
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // صورة المنتج المصغرة وزر القلب
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6,
                    left: 6,
                    child: Container(
                      width: 26,
                      height: 26,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.black54,
                        size: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '₪$price',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
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
