import 'package:ai_saas/models/city_model.dart';
import 'package:ai_saas/models/search_model.dart';
import 'package:ai_saas/screens/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SrearchScreenState();
}

class _SrearchScreenState extends State<SearchScreen> {
  int selectedIndex = 0;
  final List<StoreModel> stores = [
    StoreModel(
      title: "TechHub Gaza",
      subTitle: "إلكترونيات ومنتجات صيانة مميزة في قلب المدينة",
      imageUrl: 'assets/images/shoes.png',
      badge: "الأكثر مبيعاً",
      rating: 5.0,
    ),
    StoreModel(
      title: "Fresh Mart",
      subTitle: "بقالة عالية الجودة ومنتجات غذائية طازجة",
      imageUrl: 'assets/images/shoes.png',
      tag: "توصيل",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        actionsPadding: EdgeInsets.only(right: 20),

        title: Text(
          'Tradex',
          style: GoogleFonts.ibmPlexSans(
            fontSize: 24,

            fontWeight: FontWeight.bold,
            color: const Color(0xff4D41DF),
          ),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.shopping_bag_outlined,
          color: const Color(0xff4D41DF),
          size: 25,
        ),
        actions: [
          Icon(
            Icons.location_on_outlined,
            color: const Color(0xff4D41DF),
            size: 25,
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: SizedBox(
                  width: 370,
                  height: 56,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'ابحث هنا...',
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[150],
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 20),
                  Icon(
                    Icons.near_me_outlined,
                    color: Color(0xff4D41DF),
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Location',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 16,

                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cities.length,
                  itemBuilder: (context, index) {
                    bool isSelected = index == selectedIndex;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Color(0xFF49C5B6)
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          cities[index].name,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 20),
                  Icon(
                    Icons.category_rounded,
                    color: Color(0xff4D41DF),
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Category',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 16,

                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cate.length,
                  itemBuilder: (context, index) {
                    bool isSelected = index == selectedIndex;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Color(0xFF49C5B6)
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          cate[index].name,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 24, top: 24),
                child: Text(
                  'أفضل الخيارات القريبة منك',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.ibmPlexSans(
                    fontSize: 20,

                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'تم العثور على 12 نتيجة حسب بحثك',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'عرض الخريطة',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.ibmPlexSans(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff4D41DF),
                            ),
                          ),
                          Icon(
                            Icons.map_outlined,
                            color: Color(0xff4D41DF),
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  itemCount: stores.length,
                  itemBuilder: (context, index) {
                    return StoreCardWidget(store: stores[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
