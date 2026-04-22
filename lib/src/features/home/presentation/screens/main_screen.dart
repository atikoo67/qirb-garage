import 'package:qirb_garage/src/features/spare_parts/presentation/screens/spare_parts_marketplace_screen.dart';
import 'package:qirb_garage/src/imports/core_imports.dart';
import 'package:qirb_garage/src/imports/packages_imports.dart';
import 'package:qirb_garage/src/features/garage/presentation/screens/garage_list_screen.dart';
import 'package:qirb_garage/src/features/repair_guides/presentation/screens/repair_guides_screen.dart';
import 'package:qirb_garage/src/shared/widgets/bottom_nav_bar_widget.dart';
import 'package:qirb_garage/src/shared/widgets/ai_fab_widget.dart';

/// Main screen with bottom navigation: GARAGE, SPARE, MANUAL, PROFILE
class MainScreen extends HookConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);

    final screens = [
      const GarageListScreen(),
      const SparePartsMarketplaceScreen(),
      const RepairGuidesScreen(),
      const _ProfileTab(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: currentIndex.value,
        children: screens,
      ),
      bottomNavigationBar: BottomNavBarWidget(
        currentIndex: currentIndex.value,
        onTap: (index) => currentIndex.value = index,
      ),
      floatingActionButton: const AIFabWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

/// Profile tab placeholder
class _ProfileTab extends HookConsumerWidget {
  const _ProfileTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Icon(
              Icons.garage,
              color: colorScheme.primary,
              size: 20.sp,
            ),
            SizedBox(width: AppSpacing.sm.w),
            Text(
              'AUTOCORE',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.lg.w),
        child: Column(
          children: [
            // Profile Header
            CircleAvatar(
              radius: 40.r,
              backgroundColor: colorScheme.primary.withValues(alpha: 0.1),
              child: Icon(
                Icons.person,
                size: 40.sp,
                color: colorScheme.primary,
              ),
            ),
            SizedBox(height: AppSpacing.md.h),
            Text(
              'Guest User',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'guest@autocore.com',
              style: textTheme.bodyMedium?.copyWith(
                color: Colors.black54,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: AppSpacing.xl.h),

            // Profile Options
            _ProfileOption(
              icon: Icons.person_outline,
              title: 'Edit Profile',
              onTap: () {},
            ),
            _ProfileOption(
              icon: Icons.favorite_outline,
              title: 'Favorites',
              onTap: () => context.push('/favorites'),
            ),
            _ProfileOption(
              icon: Icons.history,
              title: 'Service History',
              onTap: () {},
            ),
            _ProfileOption(
              icon: Icons.notifications_none,
              title: 'Notifications',
              onTap: () {},
            ),
            _ProfileOption(
              icon: Icons.settings_outlined,
              title: 'Settings',
              onTap: () {},
            ),
            _ProfileOption(
              icon: Icons.help_outline,
              title: 'Help & Support',
              onTap: () {},
            ),
            _ProfileOption(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () => context.push(AppRoutes.login),
              isDestructive: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileOption extends StatelessWidget {
  const _ProfileOption({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isDestructive = false,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.md.w,
          vertical: AppSpacing.md.h,
        ),
        margin: EdgeInsets.only(bottom: AppSpacing.xs.h),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.black.withValues(alpha: 0.06),
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20.sp,
              color: isDestructive ? Colors.red : Colors.black87,
            ),
            SizedBox(width: AppSpacing.md.w),
            Expanded(
              child: Text(
                title,
                style: textTheme.bodyMedium?.copyWith(
                  color: isDestructive ? Colors.red : Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 14.sp,
              color: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }
}
