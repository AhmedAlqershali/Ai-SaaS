import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductModel {
  final String title;
  final String storeName;
  final String imageUrl;
  final double price;
  bool isFavorite;

  ProductModel({
    required this.title,
    required this.storeName,
    required this.imageUrl,
    required this.price,
    this.isFavorite = false,
  });
}

// نموذج بيانات مخصص لفئات المتاجر داخل الفلتر
class CategoryFilterModel {
  final String name;
  final IconData icon;
  CategoryFilterModel({required this.name, required this.icon});
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _currentNavigationIndex = 2;
  String _selectedRegion = 'المنطقة';
  String _selectedPriceFilter = 'السعر';
  String _selectedStoreCategory = ''; // لتخزين الفئة المختارة من الفلتر الرئيسي

  // قائمة فئات المتاجر المطابقة تماماً للأيقونات والنصوص في الصورة (5.PNG)
  final List<CategoryFilterModel> filterCategories = [
    CategoryFilterModel(name: 'مطاعم', icon: Icons.restaurant),
    CategoryFilterModel(name: 'كافيهات', icon: Icons.local_cafe_outlined),
    CategoryFilterModel(name: 'ملابس', icon: Icons.checkroom),
    CategoryFilterModel(name: 'مساحات عمل', icon: Icons.business_center_outlined),
    CategoryFilterModel(name: 'هدايا', icon: Icons.card_giftcard),
    CategoryFilterModel(name: 'أحذية', icon: Icons.shopping_bag_outlined), // تمثيل لأيقونة الأحذية/الحقائب
    CategoryFilterModel(name: 'سيارات', icon: Icons.time_to_leave_outlined),
    CategoryFilterModel(name: 'مجوهرات', icon: Icons.diamond_outlined),
    CategoryFilterModel(name: 'كوزمتكس', icon: Icons.content_cut_outlined),
    CategoryFilterModel(name: 'سوبرماركت', icon: Icons.shopping_cart_outlined),
    CategoryFilterModel(name: 'مول', icon: Icons.corporate_fare_outlined),
    CategoryFilterModel(name: 'متاجر', icon: Icons.storefront),
    CategoryFilterModel(name: 'إلكترونيات', icon: Icons.devices_other_outlined),
    CategoryFilterModel(name: 'مستلزمات طبية', icon: Icons.medical_services_outlined),
    CategoryFilterModel(name: 'بصريات', icon: Icons.remove_red_eye_outlined),
  ];

  final List<ProductModel> products = [
    ProductModel(
      title: "حذاء رياضي الترا",
      storeName: "متجر الأناقة سبورت",
      imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&q=80&w=300',
      price: 299,
    ),
    ProductModel(
      title: "ساعة كلاسيك بيضاء",
      storeName: "عالم الساعات",
      imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&q=80&w=300',
      price: 450,
    ),
    ProductModel(
      title: "سماعات لاسلكية برو",
      storeName: "متجر التقنية",
      imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&q=80&w=300',
      price: 890,
      isFavorite: true,
    ),
    ProductModel(
      title: "نظارات شمسية فاخرة",
      storeName: "بوتيك النظارات",
      imageUrl: 'https://images.unsplash.com/photo-1572635196237-14b3f281503f?auto=format&fit=crop&q=80&w=300',
      price: 1200,
    ),
  ];

  // الواجهة المفقودة: نافذة الفلتر الرئيسي واختيار فئة المتجر (Action Sheet الفلتر)
  void _showMainFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                // أبعاد وتصميم الحواف الدائرية العلوية المطابقة للصورة
                decoration: const BoxDecoration(
                  color: Color(0xfffcfdff),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                // تحديد الحد الأقصى للارتفاع ليتطابق مع مظهر الـ BottomSheet المرفوع
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.75,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // شريط السحب العلوي الرمادي الصغير
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // رأس النافذة: زر الإغلاق وعنوان "اختر فئة المتجر"
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.close, size: 20, color: Colors.black54),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Expanded(
                          child: Text(
                            'اختر فئة المتجر',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0d1e3d),
                            ),
                          ),
                        ),
                        const SizedBox(width: 40),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 10),

                    // شبكة الفئات المكونة من 3 أعمدة متناسقة بداخلها الأيقونة الدائرية والنص
                    Expanded(
                      child: GridView.builder(
                        itemCount: filterCategories.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.95,
                        ),
                        itemBuilder: (context, index) {
                          final category = filterCategories[index];
                          final bool isSelected = _selectedStoreCategory == category.name;

                          return InkWell(
                            onTap: () {
                              setModalState(() => _selectedStoreCategory = category.name);
                              setState(() => _selectedStoreCategory = category.name);
                              Navigator.pop(context); // إغلاق الفلتر بعد الاختيار
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // الدائرة المحيطة بالأيقونة (تتغير خلفيتها للبنفسجي الشفاف عند الاختيار)
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? const Color(0xff4D41DF).withOpacity(0.2)
                                        : const Color(0xff4D41DF).withOpacity(0.08),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    category.icon,
                                    color: const Color(0xff4D41DF),
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  category.name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                                    color: isSelected ? const Color(0xff4D41DF) : const Color(0xff0d1e3d),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // نافذة فلتر المنطقة
  void _showRegionBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xfffcfdff),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(2))),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        IconButton(icon: const Icon(Icons.close, size: 20, color: Colors.black54), onPressed: () => Navigator.pop(context)),
                        const Expanded(child: Text('المنطقة', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff0d1e3d)))),
                        const SizedBox(width: 40),
                      ],
                    ),
                    const Divider(),
                    ...['غزة', 'شمال غزة', 'خانيونس', 'رفح', 'دير البلح', 'المغازي', 'النصيرات'].map((region) {
                      return RadioListTile<String>(
                        title: Text(region, style: const TextStyle(fontSize: 14, color: Color(0xff0d1e3d))),
                        value: region,
                        groupValue: _selectedRegion == 'المنطقة' ? null : _selectedRegion,
                        activeColor: const Color(0xff4D41DF),
                        onChanged: (value) {
                          setModalState(() => _selectedRegion = value!);
                          setState(() => _selectedRegion = value!);
                          Navigator.pop(context);
                        },
                      );
                    }).toList(),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // نافذة فلتر السعر
  void _showPriceBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xfffcfdff),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(2))),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        IconButton(icon: const Icon(Icons.close, size: 20, color: Colors.black54), onPressed: () => Navigator.pop(context)),
                        const Expanded(child: Text('السعر', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff0d1e3d)))),
                        const SizedBox(width: 40),
                      ],
                    ),
                    const Divider(),
                    RadioListTile<String>(
                      title: const Text('الأعلى سعراً إلى الأقل سعراً', style: TextStyle(fontSize: 14)),
                      value: 'الأعلى سعراً',
                      groupValue: _selectedPriceFilter == 'السعر' ? null : _selectedPriceFilter,
                      activeColor: const Color(0xff4D41DF),
                      onChanged: (value) {
                        setModalState(() => _selectedPriceFilter = value!);
                        setState(() => _selectedPriceFilter = value!);
                        Navigator.pop(context);
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('الأقل سعراً إلى الأعلى سعراً', style: TextStyle(fontSize: 14)),
                      value: 'الأقل سعراً',
                      groupValue: _selectedPriceFilter == 'السعر' ? null : _selectedPriceFilter,
                      activeColor: const Color(0xff4D41DF),
                      onChanged: (value) {
                        setModalState(() => _selectedPriceFilter = value!);
                        setState(() => _selectedPriceFilter = value!);
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xff4D41DF);
    const Color whatsappColor = Color(0xff00E676);
    const Color scaffoldBgColor = Color(0xfffafdff);

    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: scaffoldBgColor,
        elevation: 0,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            children: [
              const Icon(Icons.storefront_outlined, color: primaryColor, size: 24),
              const SizedBox(width: 8),
              Text(
                'Tradex',
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              // شريط البحث العلوي مع ربط الزر الجانبي بواجهة الفلتر المفقودة
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xfff1f3f9),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'البحث عن منتجات أو متاجر...',
                            hintStyle: TextStyle(color: Colors.black38, fontSize: 14),
                            prefixIcon: Icon(Icons.search, color: Colors.black45, size: 22),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // هنا تفعيل واجهة فئات المتجر عند الضغط على زر التصفية البنفسجي
                    GestureDetector(
                      onTap: _showMainFilterBottomSheet,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(Icons.tune, color: primaryColor, size: 22),
                      ),
                    ),
                  ],
                ),
              ),

              // كبسولات فلاتر المنطقة والسعر السريعة
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                child: Row(
                  children: [
                    _buildFilterBadge(
                      label: _selectedRegion,
                      icon: Icons.location_on_outlined,
                      onTap: _showRegionBottomSheet,
                    ),
                    const SizedBox(width: 10),
                    _buildFilterBadge(
                      label: _selectedPriceFilter,
                      icon: Icons.payments_outlined,
                      onTap: _showPriceBottomSheet,
                    ),
                    // لإظهار الفئة المختارة من الفلتر الرئيسي كإشارة مرئية إذا وُجدت
                    if (_selectedStoreCategory.isNotEmpty) ...[
                      const SizedBox(width: 10),
                      Chip(
                        label: Text(_selectedStoreCategory, style: const TextStyle(fontSize: 12, color: Colors.white)),
                        backgroundColor: primaryColor,
                        deleteIcon: const Icon(Icons.close, size: 14, color: Colors.white),
                        onDeleted: () {
                          setState(() {
                            _selectedStoreCategory = '';
                          });
                        },
                      ),
                    ]
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // شبكة المنتجات
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    childAspectRatio: 0.64,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return _buildProductGridCard(
                      product: product,
                      primaryColor: primaryColor,
                      whatsappColor: whatsappColor,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: BottomNavigationBar(
          currentIndex: _currentNavigationIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              _currentNavigationIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.grid_view_outlined), label: 'الفئات'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'بحث'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'حسابي'),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterBadge({required String label, required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black12, width: 1),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: Colors.black87),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(fontSize: 13, color: Colors.black87, fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.black54),
          ],
        ),
      ),
    );
  }

  Widget _buildProductGridCard({required ProductModel product, required Color primaryColor, required Color whatsappColor}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.015), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    image: DecorationImage(image: NetworkImage(product.imageUrl), fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), shape: BoxShape.circle),
                    child: Icon(
                      product.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: product.isFavorite ? Colors.red : Colors.black45,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff0d1e3d)), maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 2),
                Text(product.storeName, style: const TextStyle(fontSize: 12, color: Colors.black45), maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 6),
                Text('${product.price.toInt()} ₪', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 36,
                  decoration: BoxDecoration(color: whatsappColor, borderRadius: BorderRadius.circular(8)),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.chat_bubble_outline, color: Colors.white, size: 14),
                        SizedBox(width: 6),
                        Text('واتساب', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}