import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                decoration: BoxDecoration(
                  color: const Color(0xfffcfdff),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                // تحديد الحد الأقصى للارتفاع ليتطابق مع مظهر الـ BottomSheet المرفوع
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.75,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // شريط السحب العلوي الرمادي الصغير
                    Container(
                      width: 40.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    // رأس النافذة: زر الإغلاق وعنوان "اختر فئة المتجر"
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.close, size: 20.sp, color: Colors.black54),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Expanded(
                          child: Text(
                            'اختر فئة المتجر',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff0d1e3d),
                            ),
                          ),
                        ),
                        SizedBox(width: 40.w),
                      ],
                    ),
                    const Divider(),
                    SizedBox(height: 10.h),

                    // شبكة الفئات المكونة من 3 أعمدة متناسقة بداخلها الأيقونة الدائرية والنص
                    Expanded(
                      child: GridView.builder(
                        itemCount: filterCategories.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 16.h,
                          crossAxisSpacing: 12.w,
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
                                  width: 48.w,
                                  height: 48.h,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? const Color(0xff4D41DF).withOpacity(0.2)
                                        : const Color(0xff4D41DF).withOpacity(0.08),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    category.icon,
                                    color: const Color(0xff4D41DF),
                                    size: 20.sp,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  category.name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12.sp,
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
                decoration: BoxDecoration(
                  color: const Color(0xfffcfdff),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(width: 40.w, height: 4.h, decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(2.r))),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        IconButton(icon: Icon(Icons.close, size: 20.sp, color: Colors.black54), onPressed: () => Navigator.pop(context)),
                        Expanded(child: Text('المنطقة', textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xff0d1e3d)))),
                        SizedBox(width: 40.w),
                      ],
                    ),
                    const Divider(),
                    ...['غزة', 'شمال غزة', 'خانيونس', 'رفح', 'دير البلح', 'المغازي', 'النصيرات'].map((region) {
                      return RadioListTile<String>(
                        title: Text(region, style: TextStyle(fontSize: 14.sp, color: const Color(0xff0d1e3d))),
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
                    SizedBox(height: 10.h),
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
                decoration: BoxDecoration(
                  color: const Color(0xfffcfdff),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(width: 40.w, height: 4.h, decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(2.r))),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        IconButton(icon: Icon(Icons.close, size: 20.sp, color: Colors.black54), onPressed: () => Navigator.pop(context)),
                        Expanded(child: Text('السعر', textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xff0d1e3d)))),
                        SizedBox(width: 40.w),
                      ],
                    ),
                    const Divider(),
                    RadioListTile<String>(
                      title: Text('الأعلى سعراً إلى الأقل سعراً', style: TextStyle(fontSize: 14.sp)),
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
                      title: Text('الأقل سعراً إلى الأعلى سعراً', style: TextStyle(fontSize: 14.sp)),
                      value: 'الأقل سعراً',
                      groupValue: _selectedPriceFilter == 'السعر' ? null : _selectedPriceFilter,
                      activeColor: const Color(0xff4D41DF),
                      onChanged: (value) {
                        setModalState(() => _selectedPriceFilter = value!);
                        setState(() => _selectedPriceFilter = value!);
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(height: 16.h),
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
          padding: EdgeInsets.only(right: 8.0.w),
          child: Row(
            children: [
              Icon(Icons.storefront_outlined, color: primaryColor, size: 24.sp),
              SizedBox(width: 8.w),
              Text(
                'Tradex',
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 22.sp,
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
                padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: const Color(0xfff1f3f9),
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'البحث عن منتجات أو متاجر...',
                            hintStyle: TextStyle(color: Colors.black38, fontSize: 14.sp),
                            prefixIcon: Icon(Icons.search, color: Colors.black45, size: 22.sp),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    // هنا تفعيل واجهة فئات المتجر عند الضغط على زر التصفية البنفسجي
                    GestureDetector(
                      onTap: _showMainFilterBottomSheet,
                      child: Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: Icon(Icons.tune, color: primaryColor, size: 22.sp),
                      ),
                    ),
                  ],
                ),
              ),

              // كبسولات فلاتر المنطقة والسعر السريعة
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 6.0.h),
                child: Row(
                  children: [
                    _buildFilterBadge(
                      label: _selectedRegion,
                      icon: Icons.location_on_outlined,
                      onTap: _showRegionBottomSheet,
                    ),
                    SizedBox(width: 10.w),
                    _buildFilterBadge(
                      label: _selectedPriceFilter,
                      icon: Icons.payments_outlined,
                      onTap: _showPriceBottomSheet,
                    ),
                    // لإظهار الفئة المختارة من الفلتر الرئيسي كإشارة مرئية إذا وُجدت
                    if (_selectedStoreCategory.isNotEmpty) ...[
                      SizedBox(width: 10.w),
                      Chip(
                        label: Text(_selectedStoreCategory, style: TextStyle(fontSize: 12.sp, color: Colors.white)),
                        backgroundColor: primaryColor,
                        deleteIcon: Icon(Icons.close, size: 14.sp, color: Colors.white),
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
              SizedBox(height: 10.h),

              // شبكة المنتجات
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14.h,
                    crossAxisSpacing: 14.w,
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
    );
  }

  Widget _buildFilterBadge({required String label, required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Colors.black12, width: 1.w),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16.sp, color: Colors.black87),
            SizedBox(width: 6.w),
            Text(
              label,
              style: TextStyle(fontSize: 13.sp, color: Colors.black87, fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 4.w),
            Icon(Icons.keyboard_arrow_down, size: 16.sp, color: Colors.black54),
          ],
        ),
      ),
    );
  }

  Widget _buildProductGridCard({required ProductModel product, required Color primaryColor, required Color whatsappColor}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.015), blurRadius: 8.r, offset: Offset(0, 4.h))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                    image: DecorationImage(image: NetworkImage(product.imageUrl), fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: Container(
                    padding: EdgeInsets.all(6.r),
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), shape: BoxShape.circle),
                    child: Icon(
                      product.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: product.isFavorite ? Colors.red : Colors.black45,
                      size: 18.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xff0d1e3d)), maxLines: 1, overflow: TextOverflow.ellipsis),
                SizedBox(height: 2.h),
                Text(product.storeName, style: TextStyle(fontSize: 12.sp, color: Colors.black45), maxLines: 1, overflow: TextOverflow.ellipsis),
                SizedBox(height: 6.h),
                Text('${product.price.toInt()} ₪', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                SizedBox(height: 8.h),
                Container(
                  width: double.infinity,
                  height: 36.h,
                  decoration: BoxDecoration(color: whatsappColor, borderRadius: BorderRadius.circular(8.r)),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.chat_bubble_outline, color: Colors.white, size: 14.sp),
                        SizedBox(width: 6.w),
                        Text('واتساب', style: TextStyle(color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.bold)),
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
