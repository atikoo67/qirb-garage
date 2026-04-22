import 'package:qirb_garage/src/imports/core_imports.dart';
import 'package:qirb_garage/src/imports/packages_imports.dart';
import 'package:qirb_garage/src/features/auth/presentation/providers/session_provider.dart';
import 'package:qirb_garage/src/shared/widgets/app_bar_widget.dart';
import 'package:qirb_garage/src/shared/widgets/search_bar_widget.dart';
import 'package:qirb_garage/src/shared/widgets/category_tabs_widget.dart';

class GarageListScreen extends HookConsumerWidget {
  const GarageListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final session = ref.watch(sessionProvider);
    final isLoggedIn = session.status == SessionStatus.authenticated;

    final searchController = useTextEditingController();
    final selectedCategory = useState('ALL');
    final categories = ['ALL', 'ELECTRICAL', 'MECHANICAL', 'BODY SHOP'];

    // Mock garage data with ratings and badges
    final garages = [
      {
        'name': 'POUL GARAGE',
        'distance': '2.5 KM',
        'location': 'Summit, Hawassa',
        'rating': 4.8,
        'reviews': 124,
        'services': ['Oil Change', 'Brake Service', 'Engine Repair'],
        'badge': 'VERIFIED',
        'image': 'assets/images/garage/images.jpg',
      },
      {
        'name': 'ABEL BURO GARAGE',
        'distance': '3.2 KM',
        'location': 'Bole, Addis Ababa',
        'rating': 4.9,
        'reviews': 256,
        'services': ['Transmission', 'AC Service', 'Diagnostics'],
        'badge': 'PREMIUM',
        'image': 'assets/images/garage/images (1).jpg',
      },
      {
        'name': 'ALEM PREMIUM',
        'distance': '4.1 KM',
        'location': 'Ayat, Addis Ababa',
        'rating': 5.0,
        'reviews': 89,
        'services': ['Body Work', 'Paint', 'Detailing'],
        'badge': '5 STAR',
        'image': 'assets/images/garage/images.jpg',
      },
      {
        'name': 'FIRA PURPLE',
        'distance': '5.7 KM',
        'location': 'Megenagna, Addis Ababa',
        'rating': 4.7,
        'reviews': 178,
        'services': ['Electrical', 'Battery', 'Lighting'],
        'badge': 'VERIFIED',
        'image': 'assets/images/garage/images (1).jpg',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
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
                  'Find a Garage',
                  style: textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 28.sp,
                  ),
                ),
                Text(
                  'EXPERT SERVICE NEAR YOU',
                  style: textTheme.bodySmall?.copyWith(
                    color: Colors.black45,
                    fontSize: 12.sp,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: AppSpacing.lg.h),
                // Search Bar
                SearchBarWidget(
                  hintText: 'Search service, name or location',
                  controller: searchController,
                ),
              ],
            ),
          ),

          // Category Tabs
          CategoryTabsWidget(
            categories: categories,
            selectedCategory: selectedCategory.value,
            onCategorySelected: (category) => selectedCategory.value = category,
          ),

          // Garage List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(AppSpacing.lg.w),
              itemCount: garages.length,
              itemBuilder: (context, index) {
                final garage = garages[index];
                return _GarageCard(
                  name: garage['name'] as String,
                  distance: garage['distance'] as String,
                  location: garage['location'] as String,
                  rating: garage['rating'] as double,
                  reviews: garage['reviews'] as int,
                  services: garage['services'] as List<String>,
                  badge: garage['badge'] as String,
                  image: garage['image'] as String,
                  colorScheme: colorScheme,
                  textTheme: textTheme,
                  isLoggedIn: isLoggedIn,
                  onTap: () {
                    context.push('/garages/${index + 1}');
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

/// Horizontal garage card with rating and badges
class _GarageCard extends StatelessWidget {
  const _GarageCard({
    required this.name,
    required this.distance,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.services,
    required this.badge,
    required this.image,
    required this.colorScheme,
    required this.textTheme,
    required this.isLoggedIn,
    required this.onTap,
  });

  final String name;
  final String distance;
  final String location;
  final double rating;
  final int reviews;
  final List<String> services;
  final String badge;
  final String image;
  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final bool isLoggedIn;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with Badge
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(12.r)),
                  child: Image.asset(
                    image,
                    width: 120.w,
                    height: 140.h,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 120.w,
                        height: 140.h,
                        color: Colors.grey.shade200,
                        child: Icon(
                          Icons.garage,
                          size: 40.sp,
                          color: Colors.grey.shade400,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: AppSpacing.sm.h,
                  left: AppSpacing.sm.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: badge == 'PREMIUM'
                          ? Colors.amber
                          : badge == '5 STAR'
                              ? colorScheme.primary
                              : Colors.blue,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      badge,
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
                    // Name
                    Text(
                      name,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    // Rating
                    Row(
                      children: [
                        ...List.generate(5, (index) {
                          return Icon(
                            index < rating.floor()
                                ? Icons.star
                                : Icons.star_border,
                            size: 14.sp,
                            color: Colors.amber,
                          );
                        }),
                        SizedBox(width: AppSpacing.xs.w),
                        Text(
                          '$rating ($reviews)',
                          style: textTheme.bodySmall?.copyWith(
                            color: Colors.black54,
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.xs.h),
                    // Location with distance
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 12.sp,
                          color: colorScheme.primary,
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            '$location • $distance',
                            style: textTheme.bodySmall?.copyWith(
                              color: Colors.black54,
                              fontSize: 11.sp,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.sm.h),
                    // Services
                    Wrap(
                      spacing: 4.w,
                      runSpacing: 4.h,
                      children: services.take(2).map((service) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.xs.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            service,
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 9.sp,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
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
