import 'package:qirb_garage/src/imports/core_imports.dart';
import 'package:qirb_garage/src/imports/packages_imports.dart';

/// Reusable manual card widget for different types of content
class ManualCardWidget extends StatelessWidget {
  const ManualCardWidget({
    super.key,
    required this.type,
    required this.title,
    required this.subtitle,
    this.image,
    this.duration,
    this.pages,
    this.steps,
    this.videoViews,
    this.badge,
    this.badgeColor,
    this.onTap,
    this.onActionTap,
    this.actionLabel,
  });

  final String type; // 'video', 'pdf', 'guide'
  final String title;
  final String subtitle;
  final String? image;
  final String? duration;
  final String? pages;
  final String? steps;
  final String? videoViews;
  final String? badge;
  final Color? badgeColor;
  final VoidCallback? onTap;
  final VoidCallback? onActionTap;
  final String? actionLabel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.theme.textTheme;

    if (type == 'video') {
      return _VideoCard(
        title: title,
        subtitle: subtitle,
        image: image!,
        duration: duration!,
        badge: badge,
        badgeColor: badgeColor,
        colorScheme: colorScheme,
        textTheme: textTheme,
        onTap: onTap,
      );
    } else if (type == 'pdf') {
      return _PDFCard(
        title: title,
        subtitle: subtitle,
        pages: pages!,
        badge: badge,
        badgeColor: badgeColor,
        colorScheme: colorScheme,
        textTheme: textTheme,
        onTap: onTap,
        onActionTap: onActionTap,
      );
    } else {
      return _GuideCard(
        title: title,
        subtitle: subtitle,
        steps: steps!,
        badge: badge,
        badgeColor: badgeColor,
        colorScheme: colorScheme,
        textTheme: textTheme,
        onTap: onTap,
        onActionTap: onActionTap,
        actionLabel: actionLabel,
      );
    }
  }
}

/// Video card with thumbnail and play button
class _VideoCard extends StatelessWidget {
  const _VideoCard({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.duration,
    this.badge,
    this.badgeColor,
    required this.colorScheme,
    required this.textTheme,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final String image;
  final String duration;
  final String? badge;
  final Color? badgeColor;
  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: AppSpacing.md.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video Thumbnail
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(8.r)),
                  child: Image.asset(
                    image,
                    width: double.infinity,
                    height: 160.h,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 160.h,
                        color: Colors.grey.shade200,
                        child: Icon(
                          Icons.play_circle_outline,
                          size: 48.sp,
                          color: Colors.grey.shade400,
                        ),
                      );
                    },
                  ),
                ),
                // Play Button
                Positioned.fill(
                  child: Center(
                    child: Container(
                      width: 48.w,
                      height: 48.w,
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 32.sp,
                      ),
                    ),
                  ),
                ),
                // Duration Badge
                Positioned(
                  bottom: AppSpacing.sm.h,
                  right: AppSpacing.sm.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      duration,
                      style: textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ),
                // Badge
                if (badge != null)
                  Positioned(
                    top: AppSpacing.sm.h,
                    left: AppSpacing.sm.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: badgeColor ?? colorScheme.primary,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        badge!,
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
            Padding(
              padding: EdgeInsets.all(AppSpacing.md.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 14.sp,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: textTheme.bodySmall?.copyWith(
                      color: Colors.black54,
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// PDF document card
class _PDFCard extends StatelessWidget {
  const _PDFCard({
    required this.title,
    required this.subtitle,
    required this.pages,
    this.badge,
    this.badgeColor,
    required this.colorScheme,
    required this.textTheme,
    this.onTap,
    this.onActionTap,
  });

  final String title;
  final String subtitle;
  final String pages;
  final String? badge;
  final Color? badgeColor;
  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final VoidCallback? onTap;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: AppSpacing.md.h),
        padding: EdgeInsets.all(AppSpacing.md.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            // PDF Icon
            Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                Icons.description_outlined,
                size: 28.sp,
                color: Colors.black54,
              ),
            ),
            SizedBox(width: AppSpacing.md.w),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (badge != null)
                    Container(
                      margin: EdgeInsets.only(bottom: 4.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: badgeColor ?? colorScheme.primary,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        badge!,
                        style: textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 9.sp,
                        ),
                      ),
                    ),
                  Text(
                    title,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 14.sp,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: textTheme.bodySmall?.copyWith(
                      color: Colors.black54,
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              ),
            ),
            // Download Button
            GestureDetector(
              onTap: onActionTap,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.md.w,
                  vertical: AppSpacing.sm.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.download_outlined,
                      size: 14.sp,
                      color: Colors.black87,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'DOWNLOAD',
                      style: textTheme.bodySmall?.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                      ),
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

/// Step-by-step guide card
class _GuideCard extends StatelessWidget {
  const _GuideCard({
    required this.title,
    required this.subtitle,
    required this.steps,
    this.badge,
    this.badgeColor,
    required this.colorScheme,
    required this.textTheme,
    this.onTap,
    this.onActionTap,
    this.actionLabel,
  });

  final String title;
  final String subtitle;
  final String steps;
  final String? badge;
  final Color? badgeColor;
  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final VoidCallback? onTap;
  final VoidCallback? onActionTap;
  final String? actionLabel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: AppSpacing.md.h),
        padding: EdgeInsets.all(AppSpacing.md.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            // Guide Icon
            Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                color: colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                Icons.list_alt,
                size: 28.sp,
                color: colorScheme.primary,
              ),
            ),
            SizedBox(width: AppSpacing.md.w),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (badge != null)
                    Container(
                      margin: EdgeInsets.only(bottom: 4.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: badgeColor ?? colorScheme.primary,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        badge!,
                        style: textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 9.sp,
                        ),
                      ),
                    ),
                  Text(
                    title,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 14.sp,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: textTheme.bodySmall?.copyWith(
                      color: Colors.black54,
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              ),
            ),
            // Action Button
            if (onActionTap != null)
              GestureDetector(
                onTap: onActionTap,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.md.w,
                    vertical: AppSpacing.sm.h,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text(
                    actionLabel ?? 'START GUIDE',
                    style: textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
