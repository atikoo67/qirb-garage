import 'package:qirb_garage/src/imports/core_imports.dart';
import 'package:qirb_garage/src/imports/packages_imports.dart';

/// Reusable app bar with AUTOCORE branding
class AutocoreAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AutocoreAppBar({
    super.key,
    this.showProfile = true,
  });

  final bool showProfile;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return AppBar(
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
          SizedBox(width: AppSpacing.xs.w),
          Text(
            'QirbGarage',
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
      actions: [
        if (showProfile)
          CircleAvatar(
            radius: 14.r,
            backgroundColor: Colors.grey.shade200,
            child: Icon(
              Icons.person,
              size: 16.sp,
              color: Colors.black54,
            ),
          ),
        SizedBox(width: AppSpacing.md.w),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(48.h);
}
