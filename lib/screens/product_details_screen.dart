import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8fafc),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end, // محاذاة لليمين (اللغة العربية)
            children: [
              // ------ 1. الجزء العلوي: صورة المنتج والأزرار العائمة ------
              Stack(
                children: [
                  Container(
                    height: 350,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://images.unsplash.com/photo-1620916566398-39f1143ab7be?q=80&w=500'), // رابط تجريبي لصورة السيروم
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // زر العودة الخلفي
                  Positioned(
                    top: 16,
                    left: 16,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black87, size: 20),
                        onPressed: () => Navigator.maybePop(context),
                      ),
                    ),
                  ),
                  // زر المفضلة
                  Positioned(
                    top: 16,
                    right: 16,
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: Icon(Icons.favorite_border_outlined, color: Colors.black54, size: 20),
                    ),
                  ),
                ],
              ),

              // ------ 2. تفاصيل وبيانات المنتج الثابتة ------
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Anua',
                      style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'سيروم نياسيناميد 70%',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff1a1a1a)),
                    ),
                    const SizedBox(height: 16),

                    const Text(
                      'الوصف',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'منحي بشرتك الإشراقة التي تستحقها مع سيروم الخوخ من Anua. تم تصميم هذا السيروم خصيصاً ليمنحك بشرة زجاجية صافية وناعمة، حيث يعمل بتركيز عالٍ من مستخلص الخوخ والنياسيناميد على تفتيح البشرة، توحيد لونها، وتقليص مظهر المسام بشكل فعال.',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 13, color: Colors.black54, height: 1.6),
                    ),
                    const SizedBox(height: 16),

                    const Text(
                      'طريقة الاستخدام',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'ضعي 2-3 قطرات على بشرة نظيفة بعد استخدام التونر، ودلكيها بلطف حتى تمتصها البشرة تماماً. استخدميه صباحاً ومساءً للحصول على أفضل النتائج.',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 13, color: Colors.black54, height: 1.6),
                    ),
                    const SizedBox(height: 24),

                    // ------ 3. السعر والتحكم بالكمية ------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // عداد ثابت بقيمة 1
                        Container(
                          height: 38,
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200, width: 1.5),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove, size: 16, color: Colors.black54),
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () {},
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  '1',
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add, size: 16, color: Colors.black54),
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        // السعر الثابت 120 شيكل الموضح بالصورة
                        const Text(
                          '₪120',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // ------ 4. زر تواصل عبر واتساب ------
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff14db66),
                        minimumSize: const Size(double.infinity, 52),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'تواصل عبر واتساب',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.chat_bubble_outline_outlined, color: Colors.white, size: 20),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // ------ 5. قسم أخرى بالأسفل ------
                    const Text(
                      'أخرى',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    const SizedBox(height: 12),
                    _buildRelatedProductsHorizontalList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // قائمة المنتجات المقترحة الثابتة
  Widget _buildRelatedProductsHorizontalList() {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        reverse: true, // يبدأ التمرير من اليمين للياسر اتساقاً مع اتجاه التطبيق
        physics: const BouncingScrollPhysics(),
        children: const [
          RelatedProductCard(
            title: 'سيروم الكافيين للعيون',
            price: '200',
            imageUrl: 'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?q=80&w=300',
          ),
          SizedBox(width: 12),
          RelatedProductCard(
            title: 'سيروم نياسيناميد',
            price: '210',
            imageUrl: 'https://images.unsplash.com/photo-1608248597481-496100c8c836?q=80&w=300',
          ),
        ],
      ),
    );
  }
}

// ==========================================
// ويدجت كرت المنتج المقترح الثابت
// ==========================================
class RelatedProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const RelatedProductCard({
    Key? key,
    required this.title,
    required this.price,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: 6,
                  left: 6,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: const Icon(Icons.favorite_border_outlined, color: Colors.black54, size: 14),
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
    );
  }
}