import 'package:qirb_garage/src/imports/core_imports.dart';
import 'package:qirb_garage/src/imports/packages_imports.dart';
import 'package:qirb_garage/src/features/auth/presentation/providers/session_provider.dart';

class GarageDetailScreen extends HookConsumerWidget {
  final String garageId;

  const GarageDetailScreen({super.key, required this.garageId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final session = ref.watch(sessionProvider);
    final isLoggedIn = session.status == SessionStatus.authenticated;

    final selectedTab = useState(0);

    // Mock garage data
    final garage = {
      'name': 'Abel Buro Garage',
      'verified': true,
      'rating': 0,
      'location': 'Local, Summit, Addis Ababa, Ethiopia',
      'phone': '0954197597',
      'activeWindows': 'General: 08:00 - 18:00 (Mon - Sat)',
      'tools': 'High',
      'experience': '12+ Yrs',
      'tech': 'Verified',
      'parts': 'Official',
      'background': 'Garage operated by Abel Yilma',
      'services': [
        {'name': 'General Maintenance', 'price': '\$45+', 'time': '45M'},
        {'name': 'Transmission Expert', 'price': '\$45+', 'time': '45M'},
        {'name': 'Tire Center', 'price': '\$45+', 'time': '45M'},
      ],
    };

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            pinned: true,
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back, color: Colors.black),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share, color: Colors.black),
              ),
            ],
          ),

          // Content
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Profile Section
                Container(
                  padding: EdgeInsets.all(AppSpacing.xl.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black.withValues(alpha: 0.06),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Avatar
                      Stack(
                        children: [
                          Container(
                            width: 80.w,
                            height: 80.w,
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Center(
                              child: Text(
                                'A',
                                style: textTheme.headlineLarge?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          if (garage['verified'] as bool)
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 24.w,
                                height: 24.w,
                                decoration: BoxDecoration(
                                  color: colorScheme.primary,
                                  borderRadius: BorderRadius.circular(12.r),
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                ),
                                child: Icon(
                                  Icons.check,
                                  size: 14.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: AppSpacing.md.h),
                      // Name
                      Text(
                        garage['name'] as String,
                        style: textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: AppSpacing.xs.h),
                      Text(
                        'Verified specialist',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: AppSpacing.md.h),
                      // Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 20.sp),
                          SizedBox(width: AppSpacing.xs.w),
                          Text(
                            '${garage['rating']}',
                            style: textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSpacing.lg.h),
                      // Contact Info
                      _InfoRow(
                        icon: Icons.location_on_outlined,
                        text: garage['location'] as String,
                        textTheme: textTheme,
                      ),
                      SizedBox(height: AppSpacing.sm.h),
                      _InfoRow(
                        icon: Icons.phone_outlined,
                        text: garage['phone'] as String,
                        textTheme: textTheme,
                      ),
                      SizedBox(height: AppSpacing.sm.h),
                      _InfoRow(
                        icon: Icons.access_time,
                        text: garage['activeWindows'] as String,
                        textTheme: textTheme,
                      ),
                    ],
                  ),
                ),

                // Intel Specs
                Container(
                  padding: EdgeInsets.all(AppSpacing.xl.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black.withValues(alpha: 0.06),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.stars_outlined,
                            size: 20.sp,
                            color: colorScheme.primary,
                          ),
                          SizedBox(width: AppSpacing.sm.w),
                          Text(
                            'INTEL SPECS',
                            style: textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSpacing.lg.h),
                      Row(
                        children: [
                          Expanded(
                            child: _SpecCard(
                              label: 'TOOLS',
                              value: garage['tools'] as String,
                              textTheme: textTheme,
                            ),
                          ),
                          SizedBox(width: AppSpacing.md.w),
                          Expanded(
                            child: _SpecCard(
                              label: 'EXP.',
                              value: garage['experience'] as String,
                              textTheme: textTheme,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSpacing.md.h),
                      Row(
                        children: [
                          Expanded(
                            child: _SpecCard(
                              label: 'TECH',
                              value: garage['tech'] as String,
                              textTheme: textTheme,
                            ),
                          ),
                          SizedBox(width: AppSpacing.md.w),
                          Expanded(
                            child: _SpecCard(
                              label: 'PARTS',
                              value: garage['parts'] as String,
                              textTheme: textTheme,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Enterprise Guarantee
                Container(
                  margin: EdgeInsets.all(AppSpacing.xl.w),
                  padding: EdgeInsets.all(AppSpacing.lg.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1a1a2e),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.verified_user_outlined,
                        color: colorScheme.primary,
                        size: 24.sp,
                      ),
                      SizedBox(width: AppSpacing.md.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Enterprise guarantee',
                              style: textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Insurance-backed repair protocols.',
                              style: textTheme.bodySmall?.copyWith(
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Tabs
                Container(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.xl.w),
                  child: Row(
                    children: [
                      _TabButton(
                        label: 'ABOUT',
                        isSelected: selectedTab.value == 0,
                        onTap: () => selectedTab.value = 0,
                        colorScheme: colorScheme,
                        textTheme: textTheme,
                      ),
                      SizedBox(width: AppSpacing.md.w),
                      _TabButton(
                        label: 'SERVICES',
                        isSelected: selectedTab.value == 1,
                        onTap: () => selectedTab.value = 1,
                        colorScheme: colorScheme,
                        textTheme: textTheme,
                      ),
                      SizedBox(width: AppSpacing.md.w),
                      _TabButton(
                        label: 'REVIEWS',
                        isSelected: selectedTab.value == 2,
                        onTap: () => selectedTab.value = 2,
                        colorScheme: colorScheme,
                        textTheme: textTheme,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSpacing.lg.h),

                // Tab Content
                if (selectedTab.value == 0)
                  _AboutTab(
                    background: garage['background'] as String,
                    textTheme: textTheme,
                  )
                else if (selectedTab.value == 1)
                  _ServicesTab(
                    services: garage['services'] as List<Map<String, String>>,
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                  )
                else
                  _ReviewsTab(textTheme: textTheme),

                SizedBox(height: 100.h),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(AppSpacing.xl.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.black.withValues(alpha: 0.06),
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  if (isLoggedIn) {
                    // Open message
                  } else {
                    context.push(AppRoutes.login);
                  }
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black87,
                  side: BorderSide(color: Colors.black.withValues(alpha: 0.2)),
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.lg.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: Text(
                  'Protocol inquiry',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: AppSpacing.md.w),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (isLoggedIn) {
                    context.push('/garages/$garageId/request');
                  } else {
                    context.push(AppRoutes.login);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.lg.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Request Mechanic',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: AppSpacing.xs.w),
                    Icon(Icons.build, size: 18.sp),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.text,
    required this.textTheme,
  });

  final IconData icon;
  final String text;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18.sp, color: Colors.black54),
        SizedBox(width: AppSpacing.sm.w),
        Expanded(
          child: Text(
            text,
            style: textTheme.bodyMedium?.copyWith(color: Colors.black87),
          ),
        ),
      ],
    );
  }
}

class _SpecCard extends StatelessWidget {
  const _SpecCard({
    required this.label,
    required this.value,
    required this.textTheme,
  });

  final String label;
  final String value;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: textTheme.bodySmall?.copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
              fontSize: 10.sp,
            ),
          ),
          SizedBox(height: AppSpacing.xs.h),
          Text(
            value,
            style: textTheme.titleMedium?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.colorScheme,
    required this.textTheme,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.lg.w,
          vertical: AppSpacing.sm.h,
        ),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          label,
          style: textTheme.bodyMedium?.copyWith(
            color: isSelected ? Colors.white : Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
          ),
        ),
      ),
    );
  }
}

class _AboutTab extends StatelessWidget {
  const _AboutTab({
    required this.background,
    required this.textTheme,
  });

  final String background;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.xl.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BACKGROUND & INTEL',
            style: textTheme.titleSmall?.copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: AppSpacing.md.h),
          Text(
            background,
            style: textTheme.bodyMedium?.copyWith(
              color: Colors.black87,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

class _ServicesTab extends StatelessWidget {
  const _ServicesTab({
    required this.services,
    required this.colorScheme,
    required this.textTheme,
  });

  final List<Map<String, String>> services;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.xl.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AVAILABLE PROTOCOLS',
            style: textTheme.titleSmall?.copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: AppSpacing.md.h),
          Text(
            'SERVICE CATALOG',
            style: textTheme.bodySmall?.copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: AppSpacing.lg.h),
          ...services.map((service) {
            return Container(
              margin: EdgeInsets.only(bottom: AppSpacing.md.h),
              padding: EdgeInsets.all(AppSpacing.lg.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: Colors.black.withValues(alpha: 0.06),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.build_circle_outlined,
                    color: colorScheme.primary,
                    size: 32.sp,
                  ),
                  SizedBox(width: AppSpacing.md.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          service['name']!,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Auto-generated service type',
                          style: textTheme.bodySmall?.copyWith(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        service['price']!,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'EST: ${service['time']}',
                        style: textTheme.bodySmall?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _ReviewsTab extends StatelessWidget {
  const _ReviewsTab({required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.xl.w),
      child: Column(
        children: [
          Icon(
            Icons.rate_review_outlined,
            size: 60.sp,
            color: Colors.black12,
          ),
          SizedBox(height: AppSpacing.md.h),
          Text(
            'NO TESTIMONIALS VERIFIED YET',
            style: textTheme.bodyMedium?.copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
