import 'package:qirb_garage/src/imports/core_imports.dart';
import 'package:qirb_garage/src/imports/packages_imports.dart';
import 'package:qirb_garage/src/shared/widgets/app_bar_widget.dart';
import 'package:qirb_garage/src/shared/widgets/search_bar_widget.dart';
import 'package:qirb_garage/src/shared/widgets/category_tabs_widget.dart';
import 'package:qirb_garage/src/shared/widgets/secondary_tabs_widget.dart';
import 'package:qirb_garage/src/shared/widgets/manual_card_widget.dart';

class RepairGuidesScreen extends HookConsumerWidget {
  const RepairGuidesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;

    final searchController = useTextEditingController();
    final selectedCategory = useState('ENGINE');
    final selectedType = useState('ALL');

    final categories = ['ENGINE', 'ELECTRICAL', 'BODY'];
    final types = ['ALL', 'VIDEO', 'PDF', 'GUIDE'];

    // Mock manual data based on the design
    final manuals = [
      {
        'type': 'video',
        'title': 'Complete Engine Overhaul',
        'subtitle': 'DAVID MILLER • MECHANICAL',
        'image': 'assets/images/manual/download (2).jpg',
        'duration': '12:45',
        'badge': 'VIDEO TUTORIAL',
        'badgeColor': colorScheme.primary,
      },
      {
        'type': 'pdf',
        'title': '2024 Wiring Diagram Specs',
        'subtitle': '87 Pages • Official OEM',
        'pages': '87 Pages',
        'badge': 'PDF DOCUMENT',
        'badgeColor': Colors.black87,
      },
      {
        'type': 'guide',
        'title': 'Brake Pad Replacement Guide',
        'subtitle': 'Main Includes • 8 Steps',
        'steps': '8 Steps',
        'badge': 'STEP-BY-STEP',
        'badgeColor': colorScheme.primary,
      },
      {
        'type': 'pdf',
        'title': 'Torque Settings Master Sheet',
        'subtitle': '4 Pages • Reference',
        'pages': '4 Pages',
        'badge': 'PDF DOCUMENT',
        'badgeColor': Colors.black87,
      },
      {
        'type': 'video',
        'title': 'Transmission Fluid Flush',
        'subtitle': 'SARAH JENKINS • MAINTENANCE',
        'image': 'assets/images/manual/download (3).jpg',
        'duration': '08:34',
        'badge': 'MAINTENANCE',
        'badgeColor': colorScheme.primary,
      },
    ];

    // Filter manuals based on selected type
    final filteredManuals = selectedType.value == 'ALL'
        ? manuals
        : manuals
            .where((m) => m['type'] == selectedType.value.toLowerCase())
            .toList();

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
                  'Manuals Hub',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 22.sp,
                  ),
                ),
                Text(
                  'EXPERT SERVICE GUIDES & DOCUMENTATION',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.black45,
                    fontSize: 10.sp,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: AppSpacing.md.h),
                // Search Bar
                SearchBarWidget(
                  hintText: 'Search manuals...',
                  controller: searchController,
                ),
              ],
            ),
          ),

          // Type Tabs (ALL, VIDEO, PDF, GUIDE)
          SecondaryTabsWidget(
            tabs: types,
            selectedTab: selectedType.value,
            onTabSelected: (type) => selectedType.value = type,
          ),

          // Category Tabs (ENGINE, ELECTRICAL, BODY)
          CategoryTabsWidget(
            categories: categories,
            selectedCategory: selectedCategory.value,
            onCategorySelected: (category) => selectedCategory.value = category,
          ),

          // Manuals List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(AppSpacing.lg.w),
              itemCount: filteredManuals.length,
              itemBuilder: (context, index) {
                final manual = filteredManuals[index];
                return ManualCardWidget(
                  type: manual['type'] as String,
                  title: manual['title'] as String,
                  subtitle: manual['subtitle'] as String,
                  image: manual['image'] as String?,
                  duration: manual['duration'] as String?,
                  pages: manual['pages'] as String?,
                  steps: manual['steps'] as String?,
                  badge: manual['badge'] as String?,
                  badgeColor: manual['badgeColor'] as Color?,
                  onTap: () {
                    context.push('/repair-guides/${index + 1}');
                  },
                  onActionTap: () {
                    // Handle download or start guide
                  },
                  actionLabel: manual['type'] == 'guide' ? 'START GUIDE' : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
