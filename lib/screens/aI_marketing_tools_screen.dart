import 'package:flutter/material.dart';

import '../helper/colors.dart';


// ─── Dashboard SCREEN ──────────────────────────────────────────────────────────────
class AlMarketingToolsScreen extends StatefulWidget {
  const AlMarketingToolsScreen({super.key});

  @override
  State<AlMarketingToolsScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<AlMarketingToolsScreen> {
  int _selectedIndex = 1; // Dashboard selected by default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              _buildTopBar(),
              _buildHeroBanner(),
              const SizedBox(height: 24),
              _buildToolCard(
                tag: 'الأكثر استخداماً',
                icon: Icons.description_outlined,
                iconColor: AppColors.purple,
                title: 'كتابة وصف منتج',
                subtitle: 'حوّل مواصفات منتجك إلى نصوص بيعية جذابة تقنع العميل بالشراء فوراً.',
                buttonText: 'ابدأ الوصف ←',
                buttonColor: AppColors.purple,
              ),
              _buildToolCard(
                icon: Icons.camera_alt_outlined,
                iconColor: AppColors.orange,
                title: 'إنشاء بوست انستغرام',
                subtitle: 'احصل على أفكار لمحتوى الصور والتعليقات المناسبة لكل منصة اجتماعية.',
                buttonText: 'صمم المنشور ←',
                buttonColor: AppColors.orange,
              ),
              _buildToolCard(
                icon: Icons.tag,
                iconColor: AppColors.teal,
                title: 'توليد هاشتاقات',
                subtitle: 'ارفع نسبة الوصول لمنشوراتك باستخدام هاشتاقات ذكية ومخصصة.',
                buttonText: 'توليد الآن',
                buttonColor: AppColors.teal,
              ),
              _buildToolCard(
                icon: Icons.chat_bubble_outline,
                iconColor: AppColors.pink,
                title: 'كتابة ردود للعملاء',
                subtitle: 'ردود سريعة واحترافية على استفسارات العملاء وشكاواهم بكل لباقة.',
                buttonText: 'رد ذكي',
                buttonColor: AppColors.pink,
              ),
              const SizedBox(height: 16),
              _buildAccuracyCard(),
              const SizedBox(height: 24),
              _buildRecentOperations(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // ── TOP BAR ─────────────────────────────────────────────────────────────────
  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          // Avatar
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.purple.withOpacity(0.15),
            ),
            child: const Icon(Icons.person, color: AppColors.purple, size: 22),
          ),
          const SizedBox(width: 10),
          const Text(
            'Oasis AI',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const Spacer(),
          // Notifications
          Stack(
            children: [
              const Icon(Icons.notifications_none, size: 26, color: AppColors.textDark),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.orange,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 14),
          const Icon(Icons.menu, size: 26, color: AppColors.textDark),
        ],
      ),
    );
  }

  // ── HERO BANNER ─────────────────────────────────────────────────────────────
  Widget _buildHeroBanner() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF7B6FFF), Color(0xFF5A4FDF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'مساعدك الذكي\nلإدارة متجرك\nباحترافية',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'استخدم أدوات الذكاء الاصطناعي لتوفير وزيادة مبيعاتك بضغطة زر واحدة.',
              style: TextStyle(
                color: AppColors.white.withOpacity(0.85),
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                _heroButton('ابدأ الآن', AppColors.white, AppColors.purple),
                const SizedBox(width: 12),
                _heroButton(
                  'شاهد الشرح',
                  Colors.transparent,
                  AppColors.white,
                  isOutlined: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _heroButton(String text, Color bg, Color textColor,
      {bool isOutlined = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 11),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        border: isOutlined ? Border.all(color: AppColors.white, width: 1.5) : null,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  // ── TOOL CARD ────────────────────────────────────────────────────────────────
  Widget _buildToolCard({
    String? tag,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String buttonText,
    required Color buttonColor,
  }) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.cardWhite,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: iconColor, size: 22),
                ),
                if (tag != null) ...[
                  const Spacer(),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.green.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        color: AppColors.green,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 14),
            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textGray,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
                decoration: BoxDecoration(
                  color: buttonColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: buttonColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── ACCURACY CARD ─────────────────────────────────────────────────────────
  Widget _buildAccuracyCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.darkBg,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          const Text(
            '98%',
            style: TextStyle(
              color: AppColors.green,
              fontSize: 52,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'دقة المحتوى المولود بواسطة AI',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'بناءً على أكثر من 10,000 محتوى تم إنشاؤه',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white.withOpacity(0.45),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // ── RECENT OPERATIONS ────────────────────────────────────────────────────
  Widget _buildRecentOperations() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'آخر العمليات',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'عرض السجل',
                    style: TextStyle(color: AppColors.purple, fontSize: 13),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _recentItem(
              icon: Icons.description_outlined,
              iconColor: AppColors.purple,
              title: 'وصف منتج: عطر "واحة النخيل"',
              time: 'قبل ١٥ دقيقة',
            ),
            const SizedBox(height: 10),
            _recentItem(
              icon: Icons.share_outlined,
              iconColor: AppColors.orange,
              title: 'منشور انستغرام: تخفيضات الشتاء',
              time: 'قبل ٤٥ دقيقة',
            ),
          ],
        ),
      ),
    );
  }

  Widget _recentItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String time,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textGray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── BOTTOM NAV ───────────────────────────────────────────────────────────
  Widget _buildBottomNav() {
    final items = [
      _NavItem(icon: Icons.person_outline, label: 'الحساب', index: 0),
      _NavItem(icon: Icons.grid_view_rounded, label: 'لوحة التحكم', index: 1),
      _NavItem(icon: Icons.search, label: 'بحث', index: 2),
      _NavItem(icon: Icons.home_outlined, label: 'الرئيسية', index: 3),
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.cardWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            final isSelected = _selectedIndex == item.index;
            return GestureDetector(
              onTap: () => setState(() => _selectedIndex = item.index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.purple.withOpacity(0.12)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      item.icon,
                      color: isSelected ? AppColors.purple : AppColors.textGray,
                      size: 24,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      item.label,
                      style: TextStyle(
                        fontSize: 11,
                        color:
                        isSelected ? AppColors.purple : AppColors.textGray,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  final int index;
  const _NavItem({required this.icon, required this.label, required this.index});
}