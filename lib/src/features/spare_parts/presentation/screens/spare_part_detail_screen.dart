import 'package:qirb_garage/src/imports/core_imports.dart';
import 'package:qirb_garage/src/imports/packages_imports.dart';
import 'package:qirb_garage/src/features/auth/presentation/providers/session_provider.dart';

class SparePartDetailScreen extends HookConsumerWidget {
  final String partId;

  const SparePartDetailScreen({super.key, required this.partId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final session = ref.watch(sessionProvider);
    final isLoggedIn = session.status == SessionStatus.authenticated;

    final currentImageIndex = useState(0);

    // Mock part data
    final part = {
      'id': partId,
      'name': 'BRAKE PADS',
      'price': '\$18000',
      'condition': 'NEW',
      'model': 'TOYOTA RAV4',
      'description': 'brake pads for toyota',
      'seller': {
        'name': 'ABRISH GEREMEW',
        'type': 'INDIVIDUAL SELLER',
        'phone': '0987764554',
      },
      'images': [
        'assets/images/sparepart/download (4).jpg',
        'assets/images/sparepart/download (4).jpg',
        'assets/images/sparepart/download (4).jpg',
      ],
      'reference': 'REF: SP-0007',
    };

    return Scaffold(
      backgroundColor: const Color(0xFF1a1a2e),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1a1a2e),
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Row(
          children: [
            Icon(Icons.inventory_2_outlined, color: Colors.white, size: 20.sp),
            SizedBox(width: AppSpacing.sm.w),
            Text(
              'PART DETAILS',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: AppSpacing.md.w),
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.md.w,
              vertical: AppSpacing.xs.h,
            ),
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              part['reference'] as String,
              style: textTheme.bodySmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Gallery
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  // Main Image
                  SizedBox(
                    height: 300.h,
                    child: PageView.builder(
                      itemCount: (part['images'] as List).length,
                      onPageChanged: (index) {
                        currentImageIndex.value = index;
                      },
                      itemBuilder: (context, index) {
                        return Image.asset(
                          (part['images'] as List)[index] as String,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey.shade200,
                              child: Icon(
                                Icons.build_circle_outlined,
                                size: 80.sp,
                                color: Colors.grey.shade400,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  // Image Counter
                  Container(
                    padding: EdgeInsets.all(AppSpacing.sm.w),
                    child: Text(
                      '${currentImageIndex.value + 1}/${(part['images'] as List).length}',
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // Thumbnail Images
                  SizedBox(
                    height: 80.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding:
                          EdgeInsets.symmetric(horizontal: AppSpacing.md.w),
                      itemCount: (part['images'] as List).length,
                      itemBuilder: (context, index) {
                        final isSelected = currentImageIndex.value == index;
                        return GestureDetector(
                          onTap: () {
                            currentImageIndex.value = index;
                          },
                          child: Container(
                            width: 60.w,
                            height: 60.w,
                            margin: EdgeInsets.only(right: AppSpacing.sm.w),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: isSelected
                                    ? colorScheme.primary
                                    : Colors.black.withValues(alpha: 0.1),
                                width: isSelected ? 2 : 1,
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(7.r),
                              child: Image.asset(
                                (part['images'] as List)[index] as String,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: AppSpacing.md.h),
                ],
              ),
            ),

            // Part Info Section
            Container(
              padding: EdgeInsets.all(AppSpacing.xl.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category Badge
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.md.w,
                      vertical: AppSpacing.xs.h,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      'SPARE PART',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: AppSpacing.md.h),

                  // Part Name
                  Text(
                    part['name'] as String,
                    style: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: AppSpacing.sm.h),

                  // Price
                  Text(
                    part['price'] as String,
                    style: textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                      fontSize: 36.sp,
                    ),
                  ),
                  SizedBox(height: AppSpacing.xl.h),

                  // Specs Grid
                  Row(
                    children: [
                      Expanded(
                        child: _SpecItem(
                          label: 'CONDITION',
                          value: part['condition'] as String,
                          textTheme: textTheme,
                        ),
                      ),
                      SizedBox(width: AppSpacing.lg.w),
                      Expanded(
                        child: _SpecItem(
                          label: 'MODEL',
                          value: part['model'] as String,
                          textTheme: textTheme,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.xxxl.h),

                  // Description Section
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: colorScheme.primary,
                        size: 20.sp,
                      ),
                      SizedBox(width: AppSpacing.sm.w),
                      Text(
                        'DESCRIPTION',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.md.h),
                  Text(
                    part['description'] as String,
                    style: textTheme.bodyLarge?.copyWith(
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                      height: 1.6,
                    ),
                  ),
                  SizedBox(height: AppSpacing.xxxl.h),

                  // Seller Info Section
                  Row(
                    children: [
                      Icon(
                        Icons.person_outline,
                        color: colorScheme.primary,
                        size: 20.sp,
                      ),
                      SizedBox(width: AppSpacing.sm.w),
                      Text(
                        'SELLER INFO',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.lg.h),

                  // Seller Details
                  _SellerInfoRow(
                    icon: Icons.badge_outlined,
                    label: 'FULL NAME',
                    value: (part['seller'] as Map)['name'] as String,
                    textTheme: textTheme,
                  ),
                  SizedBox(height: AppSpacing.md.h),
                  _SellerInfoRow(
                    icon: Icons.people_outline,
                    label: 'SELLER TYPE',
                    value: (part['seller'] as Map)['type'] as String,
                    textTheme: textTheme,
                  ),
                  SizedBox(height: AppSpacing.md.h),
                  _SellerInfoRow(
                    icon: Icons.phone_outlined,
                    label: 'PHONE NUMBER',
                    value: (part['seller'] as Map)['phone'] as String,
                    textTheme: textTheme,
                  ),
                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(AppSpacing.xl.w),
        decoration: BoxDecoration(
          color: const Color(0xFF1a1a2e),
          border: Border(
            top: BorderSide(
              color: Colors.white.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            // Message Button
            Container(
              width: 56.w,
              height: 56.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: IconButton(
                onPressed: () {
                  if (isLoggedIn) {
                    // Open message
                  } else {
                    context.push(AppRoutes.login);
                  }
                },
                icon: Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ),
            ),
            SizedBox(width: AppSpacing.md.w),
            // Direct Request Button
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (isLoggedIn) {
                    // Make request
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
                      'DIRECT REQUEST',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(width: AppSpacing.sm.w),
                    Icon(Icons.arrow_forward, size: 20.sp),
                  ],
                ),
              ),
            ),
            SizedBox(width: AppSpacing.md.w),
            // Favorite Button
            Container(
              width: 56.w,
              height: 56.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: IconButton(
                onPressed: () {
                  // Toggle favorite
                },
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SpecItem extends StatelessWidget {
  const _SpecItem({
    required this.label,
    required this.value,
    required this.textTheme,
  });

  final String label;
  final String value;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme.bodySmall?.copyWith(
            color: Colors.white54,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: AppSpacing.xs.h),
        Text(
          value,
          style: textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _SellerInfoRow extends StatelessWidget {
  const _SellerInfoRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.textTheme,
  });

  final IconData icon;
  final String label;
  final String value;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white54, size: 20.sp),
        SizedBox(width: AppSpacing.md.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: textTheme.bodySmall?.copyWith(
                  color: Colors.white54,
                  fontWeight: FontWeight.w600,
                  fontSize: 10.sp,
                ),
              ),
              Text(
                value,
                style: textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
