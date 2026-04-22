import 'package:qirb_garage/src/imports/core_imports.dart';
import 'package:qirb_garage/src/imports/packages_imports.dart';

/// Secondary tabs widget for sub-categories (smaller, different style)
class SecondaryTabsWidget extends StatelessWidget {
  const SecondaryTabsWidget({
    super.key,
    required this.tabs,
    required this.selectedTab,
    required this.onTabSelected,
  });

  final List<String> tabs;
  final String selectedTab;
  final ValueChanged<String> onTabSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.theme.textTheme;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.lg.w,
        vertical: AppSpacing.sm.h,
      ),
      child: Row(
        children: tabs.map((tab) {
          final isSelected = selectedTab == tab;
          return Padding(
            padding: EdgeInsets.only(right: AppSpacing.sm.w),
            child: GestureDetector(
              onTap: () => onTabSelected(tab),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.md.w,
                  vertical: AppSpacing.xs.h,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? colorScheme.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(
                    color: isSelected
                        ? colorScheme.primary
                        : Colors.black.withValues(alpha: 0.1),
                    width: 1,
                  ),
                ),
                child: Text(
                  tab,
                  style: textTheme.bodySmall?.copyWith(
                    color: isSelected ? Colors.white : Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: 11.sp,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
