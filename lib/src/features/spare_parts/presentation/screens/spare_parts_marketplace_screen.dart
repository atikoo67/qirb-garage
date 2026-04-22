import 'package:qirb_garage/src/imports/core_imports.dart';
import 'package:qirb_garage/src/imports/packages_imports.dart';
import 'package:qirb_garage/src/shared/widgets/app_bar_widget.dart';
import 'package:qirb_garage/src/shared/widgets/search_bar_widget.dart';
import 'package:qirb_garage/src/shared/widgets/category_tabs_widget.dart';

class SparePartsMarketplaceScreen extends HookConsumerWidget {
  const SparePartsMarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final selectedCategory = useState('ALL');
    final categories = ['ALL', 'NEW', 'USED', 'BY VEHICLE'];

    // Mock spare parts data
    final parts = [
      {
        'id': '1',
        'name': 'Brake Pads',
        'category': 'BRAKES',
        'price': '18,000 ETB',
        'seller': 'Abrish Geremew',
        'posted': '1 day ago',
        'image': 'assets/images/sparepart/download (4).jpg',
        'forSale': true,
      },
      {
        'id': '2',
        'name': 'Brake Pads',
        'category': 'WHEELS',
        'price': '18,000 ETB',
        'seller': 'Abrish Geremew',
        'posted': '1 day ago',
        'image': 'assets/images/sparepart/download (4).jpg',
        'forSale': true,
      },
      {
        'id': '3',
        'name': 'Brake Pads',
        'category': 'LIGHTING',
        'price': '18,000 ETB',
        'seller': 'Abrish Geremew',
        'posted': '1 day ago',
        'image': 'assets/images/sparepart/download (4).jpg',
        'forSale': true,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: const AutocoreAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(AppSpacing.lg.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Marketplace',
                  style: textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 28.sp,
                  ),
                ),
                Text(
                  'PREMIUM VEHICLE COMPONENTS',
                  style: textTheme.bodySmall?.copyWith(
                    color: Colors.black45,
                    fontSize: 12.sp,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: AppSpacing.lg.h),
                // Search Bar
                const SearchBarWidget(
                  hintText: 'Search spare parts...',
                ),
              ],
            ),
          ),

          // Category Filter
          CategoryTabsWidget(
            categories: categories,
            selectedCategory: selectedCategory.value,
            onCategorySelected: (category) => selectedCategory.value = category,
          ),

          // Parts List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(AppSpacing.lg.w),
              itemCount: parts.length,
              itemBuilder: (context, index) {
                final part = parts[index];
                return _MarketplaceCard(
                  part: part,
                  colorScheme: colorScheme,
                  textTheme: textTheme,
                  onTap: () {
                    context.push('/spare-parts/${part['id']}');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MarketplaceCard extends StatelessWidget {
  const _MarketplaceCard({
    required this.part,
    required this.colorScheme,
    required this.textTheme,
    required this.onTap,
  });

  final Map<String, dynamic> part;
  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: AppSpacing.md.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            // Image with Badge
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(12.r)),
                  child: Image.asset(
                    part['image'] as String,
                    width: 120.w,
                    height: 120.h,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 120.w,
                        height: 120.h,
                        color: Colors.grey.shade200,
                        child: Icon(
                          Icons.build_circle_outlined,
                          size: 40.sp,
                          color: Colors.grey.shade400,
                        ),
                      );
                    },
                  ),
                ),
                if (part['forSale'] as bool)
                  Positioned(
                    top: AppSpacing.sm.h,
                    left: AppSpacing.sm.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        'FOR SALE',
                        style: textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 9.sp,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            // Content
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(AppSpacing.md.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category
                    Text(
                      part['category'] as String,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 11.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    // Name
                    Text(
                      part['name'] as String,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    // Seller
                    Text(
                      'Seller: ${part['seller']}',
                      style: textTheme.bodySmall?.copyWith(
                        color: Colors.black54,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: AppSpacing.sm.h),
                    // Price
                    Text(
                      part['price'] as String,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Posted Time
            Padding(
              padding: EdgeInsets.all(AppSpacing.md.w),
              child: Text(
                part['posted'] as String,
                style: textTheme.bodySmall?.copyWith(
                  color: Colors.black38,
                  fontSize: 10.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
