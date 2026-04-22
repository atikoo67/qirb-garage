import 'package:qirb_garage/src/imports/core_imports.dart';
import 'package:qirb_garage/src/imports/packages_imports.dart';
import 'package:qirb_garage/src/features/auth/presentation/providers/session_provider.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.theme.textTheme;

    useEffect(() {
      Future<void>.delayed(const Duration(seconds: 3), () async {
        if (!context.mounted) return;

        // Check if first time user
        final prefs = await SharedPreferences.getInstance();
        final isFirstTime = prefs.getBool('isFirstTime') ?? true;

        if (isFirstTime) {
          // First time user - show onboarding
          await prefs.setBool('isFirstTime', false);
          context.go(AppRoutes.onboarding);
        } else {
          // Returning user - go to home
          context.go(AppRoutes.home);
        }
      });
      return null;
    }, []);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Text
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Qirb',
                    style: textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 36.sp,
                      letterSpacing: -0.5,
                    ),
                  ),
                  TextSpan(
                    text: 'Garage',
                    style: textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                      fontSize: 36.sp,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.xs.h),
            // Tagline
            Text(
              'Your garage. Anywhere.',
              style: textTheme.bodyMedium?.copyWith(
                color: Colors.black38,
                fontSize: 13.sp,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: AppSpacing.xxl.h),
            // Animated Loading Dots
            const _LoadingDots(),
          ],
        ),
      ),
    );
  }
}

class _LoadingDots extends HookWidget {
  const _LoadingDots();

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 1400),
    );

    useEffect(() {
      animationController.repeat();
      return null;
    }, []);

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (index) {
            // Calculate delay for each dot
            final delay = index * 0.2;
            final animValue =
                (animationController.value - delay).clamp(0.0, 1.0);

            // Create a bounce effect
            final scale = animValue < 0.5
                ? 1.0 + (animValue * 2) * 0.5
                : 1.5 - ((animValue - 0.5) * 2) * 0.5;

            final opacity = animValue < 0.5
                ? 0.3 + (animValue * 2) * 0.7
                : 1.0 - ((animValue - 0.5) * 2) * 0.7;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Transform.scale(
                scale: scale,
                child: Container(
                  width: 8.w,
                  height: 8.w,
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: opacity),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
