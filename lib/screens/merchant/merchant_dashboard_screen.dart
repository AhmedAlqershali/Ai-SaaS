import 'package:ai_saas/screens/merchant/add_product.dart';
import 'package:ai_saas/screens/merchant/ai_marketing_tools.dart';
import 'package:flutter/material.dart';


class MerchantDashboardPage extends StatelessWidget {
  const MerchantDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: SafeArea(
          child: Column(
            children: [
              _buildTopBar(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      _buildAddProductButton(context),
                      const SizedBox(height: 12),
                      _buildAIPostCard(context),
                      const SizedBox(height: 12),
                      _buildStoreViewCard(),
                      const SizedBox(height: 20),
                      _buildOverviewSection(),
                      const SizedBox(height: 20),
                      _buildRecentSalesSection(),
                      const SizedBox(height: 20),
                      _buildSmartInsightsCard(),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNav(),
      ),
    );
  }

  // ─── Top Bar ───────────────────────────────────────────────────────────────
  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          const Icon(Icons.menu, size: 24),
          const Spacer(),
          Row(
            children: [
              const Text(
                'النصيرات',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.location_on, color: Color(0xFF5B4FCF), size: 16),
            ],
          ),
          const Spacer(),
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xFF5B4FCF),
            child: const Icon(Icons.person, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }

  // ─── Add Product Button ────────────────────────────────────────────────────
  Widget _buildAddProductButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF5B4FCF), Color(0xFF7B6FEF)],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>  AddProduct()),
            );
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_circle, color: Colors.white, size: 28),
              SizedBox(width: 10),
              Text(
                'إضافة منتج',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ─── AI Post Card ──────────────────────────────────────────────────────────
  Widget _buildAIPostCard(BuildContext context) {
    return _buildWhiteCard(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AiMarketingTools()),
          );
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.auto_awesome, color: Color(0xFF5B4FCF), size: 26),
              SizedBox(width: 10),
              Text(
                'إنشاء بوست AI',
                style: TextStyle(
                  color: Color(0xFF5B4FCF),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ─── Store View Card ───────────────────────────────────────────────────────
  Widget _buildStoreViewCard() {
    return _buildWhiteCard(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Icon(Icons.storefront_outlined, size: 36, color: Colors.black87),
              SizedBox(height: 8),
              Text(
                'عرض المتجر',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ─── Overview Section ──────────────────────────────────────────────────────
  Widget _buildOverviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'نظرة  عامة',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        // Products Count
        _buildStatCard(
          icon: Icons.inventory_2_outlined,
          iconColor: const Color(0xFF5B4FCF),
          iconBg: const Color(0xFFEEEBFF),
          label: 'عدد المنتجات',
          value: '148',
          badge: '+12%',
          badgeColor: const Color(0xFFE8F5E9),
          badgeTextColor: const Color(0xFF388E3C),
          trailing: null,
        ),
        const SizedBox(height: 10),
        // New Orders
        _buildOrdersCard(),
        const SizedBox(height: 10),
        // Unread Messages
        _buildMessagesCard(),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String label,
    required String value,
    String? badge,
    Color? badgeColor,
    Color? badgeTextColor,
    Widget? trailing,
  }) {
    return _buildWhiteCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // trailing widget on left side
            if (trailing != null) trailing,
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    if (badge != null)
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: badgeColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          badge,
                          style: TextStyle(
                            color: badgeTextColor,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: iconBg,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(icon, color: iconColor, size: 22),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(label,
                    style: const TextStyle(color: Colors.grey, fontSize: 12)),
                Text(
                  value,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrdersCard() {
    return _buildWhiteCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Mini bar chart
            _buildMiniBarChart(),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('طلبات جديدة',
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                const Text(
                  '32',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildStatusChip('8 قيد الانتظار',
                        const Color(0xFFE3F2FD), const Color(0xFF1976D2)),
                    const SizedBox(width: 8),
                    _buildStatusChip('24 تم التوصيل',
                        const Color(0xFFF5F5F5), Colors.black54),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniBarChart() {
    final heights = [20.0, 30.0, 18.0, 35.0, 25.0, 40.0];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: heights
          .map((h) => Container(
        width: 8,
        height: h,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: const Color(0xFF5B4FCF).withOpacity(0.25),
          borderRadius: BorderRadius.circular(4),
        ),
      ))
          .toList(),
    );
  }

  Widget _buildStatusChip(String label, Color bg, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(label,
          style: TextStyle(
              color: textColor, fontSize: 11, fontWeight: FontWeight.w600)),
    );
  }

  Widget _buildMessagesCard() {
    return _buildWhiteCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Red dot indicator
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF3E0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.chat_bubble_outline,
                      color: Color(0xFFFF9800), size: 22),
                ),
                const SizedBox(height: 8),
                const Text('رسائل غير مقروءة',
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                const Text(
                  '7',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ─── Recent Sales Section ──────────────────────────────────────────────────
  Widget _buildRecentSalesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text('عرض الكل',
                  style: TextStyle(color: Color(0xFF5B4FCF), fontSize: 13)),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('المبيعات الاخيرة',
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('نظرة  سريعة  على  متجرك  اليوم',
                    style: TextStyle(color: Colors.grey, fontSize: 11)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        _buildWhiteCard(
          child: Column(
            children: [
              _buildSaleItem(
                icon: Icons.headphones,
                iconBg: const Color(0xFF2C2C2C),
                name: 'سماعات لاسلكية',
                orderNum: '9921#',
                time: 'منذ دقيقتين',
                price: '100.0 ش',
                status: 'COMPLETED',
                statusColor: const Color(0xFF388E3C),
                statusBg: const Color(0xFFE8F5E9),
                isLast: false,
              ),
              _buildDivider(),
              _buildSaleItem(
                icon: Icons.cases_outlined,
                iconBg: const Color(0xFF8B6914),
                name: 'حقيبة يد جلدية',
                orderNum: '9919#',
                time: 'منذ 15 دقيقة',
                price: '54.00 ش',
                status: 'قيد المعالجة',
                statusColor: const Color(0xFFE65100),
                statusBg: const Color(0xFFFFF3E0),
                isLast: false,
              ),
              _buildDivider(),
              _buildSaleItem(
                icon: Icons.coffee,
                iconBg: const Color(0xFF5B4FCF),
                name: 'أكواب سيراميك',
                orderNum: '9915#',
                time: 'منذ ساعة',
                price: '\$18.50',
                status: 'مكتمل',
                statusColor: const Color(0xFF388E3C),
                statusBg: const Color(0xFFE8F5E9),
                isLast: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSaleItem({
    required IconData icon,
    required Color iconBg,
    required String name,
    required String orderNum,
    required String time,
    required String price,
    required String status,
    required Color statusColor,
    required Color statusBg,
    required bool isLast,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Price + Status (left side)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                price,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(height: 4),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: statusBg,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                      color: statusColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const Spacer(),
          // Product info (right side)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14)),
              Text('طلب رقم $orderNum',
                  style: const TextStyle(color: Colors.grey, fontSize: 11)),
              Text('• $time',
                  style: const TextStyle(color: Colors.grey, fontSize: 11)),
            ],
          ),
          const SizedBox(width: 12),
          // Icon
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.white, size: 22),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, color: Color(0xFFF0F0F0), indent: 16, endIndent: 16);
  }

  // ─── Smart Insights Card ───────────────────────────────────────────────────
  Widget _buildSmartInsightsCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFEEEBFF),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'تحليلات  ذكية',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3D35A8),
                ),
              ),
              SizedBox(width: 6),
              Icon(Icons.location_on, color: Color(0xFF5B4FCF), size: 20),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'بناً على مبيعاتك هذا الصباح.',
            style: TextStyle(color: Color(0xFF4A3F9F), fontSize: 13),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 6),
          const Text(
            'طقم أكواب السيراميك هو الأكثر رواجًا في النصيرات.',
            style: TextStyle(color: Color(0xFF4A3F9F), fontSize: 13),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 6),
          const Text(
            'ننصح بتقديم خصم 10% للعملاء المتكررين',
            style: TextStyle(color: Color(0xFF4A3F9F), fontSize: 13),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5B4FCF),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'تطبيق الاقتراح',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Bottom Navigation ─────────────────────────────────────────────────────
  Widget _buildBottomNav() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: 2,
          selectedItemColor: const Color(0xFF5B4FCF),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'بحث',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_outlined),
              activeIcon: Icon(Icons.dashboard),
              label: 'لوحة التحكم',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'الحساب',
            ),
          ],
        ),
      ),
    );
  }

  // ─── Helper: White Card ────────────────────────────────────────────────────
  Widget _buildWhiteCard({required Widget child}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}