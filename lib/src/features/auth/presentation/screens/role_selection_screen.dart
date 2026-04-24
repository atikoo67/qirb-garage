import 'package:qirb_garage/src/imports/core_imports.dart';
import 'package:qirb_garage/src/imports/packages_imports.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.xl.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSpacing.xxxl.h),

              // Back Button
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),

              SizedBox(height: AppSpacing.xl.h),

              // Title
              Text(
                'Choose Your Role',
                style: textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 32.sp,
                ),
              ),
              SizedBox(height: AppSpacing.sm.h),
              Text(
                'Select how you want to use Qirb Garage',
                style: textTheme.bodyLarge?.copyWith(
                  color: Colors.black54,
                  fontSize: 16.sp,
                ),
              ),

              SizedBox(height: AppSpacing.xxxl.h),

              // Role Options
              _RoleCard(
                icon: Icons.person_outline,
                title: 'Customer',
                description: 'Find garages, spare parts, and repair guides',
                color: colorScheme.primary,
                onTap: () => context.go(AppRoutes.signup),
              ),

              SizedBox(height: AppSpacing.lg.h),

              _RoleCard(
                icon: Icons.garage_outlined,
                title: 'Garage Owner',
                description: 'Manage your garage and receive service requests',
                color: const Color(0xFF2E7D32),
                onTap: () => context.go(AppRoutes.signup),
              ),

              SizedBox(height: AppSpacing.lg.h),

              _RoleCard(
                icon: Icons.build_outlined,
                title: 'Spare Part Seller',
                description: 'Sell spare parts to customers nationwide',
                color: const Color(0xFFED6C02),
                onTap: () => context.go(AppRoutes.signup),
              ),

              const Spacer(),

              // Sign In Link
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: textTheme.bodyMedium?.copyWith(color: Colors.black54),
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: AppSpacing.xl.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  const _RoleCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(AppSpacing.lg.w),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: color.withValues(alpha: 0.3),
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 56.w,
              height: 56.h,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                icon,
                color: color,
                size: 28.sp,
              ),
            ),
            SizedBox(width: AppSpacing.md.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    description,
                    style: textTheme.bodySmall?.copyWith(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: color,
              size: 18.sp,
            ),
          ],
        ),
      ),
    );
  }
}