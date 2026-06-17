import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// نموذج البيانات
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
  String _selectedRegion = 'الالمنطقة';
  String _selectedPriceFilter = 'السعر';
  String _selectedStoreCategory = '';

  final List<CategoryFilterModel> filterCategories = [
    CategoryFilterModel(name: 'مطاعم', icon: Icons.restaurant),
    CategoryFilterModel(name: 'كافيهات', icon: Icons.local_cafe_outlined),
    CategoryFilterModel(name: 'ملابس', icon: Icons.checkroom),
    CategoryFilterModel(name: 'مساحات عمل', icon: Icons.business_center_outlined),
    CategoryFilterModel(name: 'هدايا', icon: Icons.card_giftcard),
    CategoryFilterModel(name: 'أحذية', icon: Icons.shopping_bag_outlined),
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

  void _showMainFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              color: const Color(0xfffcfdff),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              children: [
                Container(width: 40.w, height: 4.h, decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(2.r))),
                SizedBox(height: 12.h),
                Text('اختر فئة المتجر', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xff0d1e3d))),
                SizedBox(height: 10.h),
                const Divider(),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.only(top: 10.h),
                    itemCount: filterCategories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 20.h,
                      crossAxisSpacing: 10.w,
                      childAspectRatio: 0.85,
                    ),
                    itemBuilder: (context, index) {
                      final category = filterCategories[index];
                      final bool isSelected = _selectedStoreCategory == category.name;
                      return InkWell(
                        onTap: () {
                          setState(() => _selectedStoreCategory = category.name);
                          Navigator.pop(context);
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 50.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                color: isSelected ? const Color(0xff4D41DF).withOpacity(0.2) : const Color(0xff4D41DF).withOpacity(0.08),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(category.icon, color: const Color(0xff4D41DF), size: 22.sp),
                            ),
                            SizedBox(height: 8.h),
                            Text(category.name, textAlign: TextAlign.center, style: TextStyle(fontSize: 11.sp, fontWeight: isSelected ? FontWeight.bold : FontWeight.w500, color: const Color(0xff0d1e3d))),
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
  }

  void _showRegionBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(24.r))),
            padding: EdgeInsets.all(20.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: ['غزة', 'خانيونس', 'النصيرات', 'رفح'].map((region) {
                return ListTile(
                  title: Text(region, style: TextStyle(fontSize: 14.sp)),
                  onTap: () {
                    setState(() => _selectedRegion = region);
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xff4D41DF);
    const Color whatsappColor = Color(0xff00E676);

    return Scaffold(
      backgroundColor: const Color(0xfffafdff),
      appBar: AppBar(
        backgroundColor: const Color(0xfffafdff),
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.storefront_outlined, color: primaryColor, size: 24.sp),
            SizedBox(width: 8.w),
            Text('Tradex', style: GoogleFonts.ibmPlexSans(fontSize: 22.sp, fontWeight: FontWeight.bold, color: primaryColor)),
          ],
        ),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(color: const Color(0xfff1f3f9), borderRadius: BorderRadius.circular(14.r)),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'ابحث عن منتجات...',
                            hintStyle: TextStyle(color: Colors.black38, fontSize: 13.sp),
                            prefixIcon: Icon(Icons.search, color: Colors.black45, size: 20.sp),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    GestureDetector(
                      onTap: _showMainFilterBottomSheet,
                      child: Container(
                        width: 50.h,
                        height: 50.h,
                        decoration: BoxDecoration(color: primaryColor.withOpacity(0.12), borderRadius: BorderRadius.circular(14.r)),
                        child: Icon(Icons.tune, color: primaryColor, size: 22.sp),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Row(
                  children: [
                    _buildFilterBadge(label: _selectedRegion, icon: Icons.location_on_outlined, onTap: _showRegionBottomSheet),
                    if (_selectedStoreCategory.isNotEmpty) ...[
                      SizedBox(width: 10.w),
                      InputChip(
                        label: Text(_selectedStoreCategory, style: TextStyle(fontSize: 11.sp, color: Colors.white)),
                        backgroundColor: primaryColor,
                        deleteIcon: Icon(Icons.close, size: 14.sp, color: Colors.white),
                        onDeleted: () => setState(() => _selectedStoreCategory = ''),
                      ),
                    ],
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(16.r),
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 16.w,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, index) => _buildProductCard(products[index], primaryColor, whatsappColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterBadge({required String label, required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.r), border: Border.all(color: Colors.black12)),
        child: Row(
          children: [
            Icon(icon, size: 16.sp, color: Colors.black87),
            SizedBox(width: 6.w),
            Text(label, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500)),
            Icon(Icons.keyboard_arrow_down, size: 16.sp),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(ProductModel product, Color primaryColor, Color whatsappColor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
              child: Image.network(product.imageUrl, fit: BoxFit.cover, width: double.infinity),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                Text(product.storeName, style: TextStyle(fontSize: 11.sp, color: Colors.black45), maxLines: 1),
                SizedBox(height: 4.h),
                Text('${product.price.toInt()} ₪', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: primaryColor)),
                SizedBox(height: 8.h),
                Container(
                  height: 35.h,
                  decoration: BoxDecoration(color: whatsappColor, borderRadius: BorderRadius.circular(8.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.chat_bubble_outline, color: Colors.white, size: 14.sp),
                      SizedBox(width: 4.w),
                      Text('واتساب', style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold)),
                    ],
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
