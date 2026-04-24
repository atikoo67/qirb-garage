import 'package:qirb_garage/src/imports/core_imports.dart';
import 'package:qirb_garage/src/imports/packages_imports.dart';

class OnboardingPage extends HookWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final pageController = usePageController();
    final currentIndex = useState(0);

    final List<Map<String, String>> onboardingData = useMemoized(() => [
          {
            'title': 'Find Nearby\nGarages',
            'subtitle':
                'Discover trusted garages near you with verified specialists and real-time availability',
            'image': "assets/onboarding/repair_garage.svg",
          },
          {
            'title': 'View Repair\nGuides',
            'subtitle':
                'Learn how to fix common vehicle issues with step-by-step guides and expert tips',
            'image': 'assets/onboarding/guides.svg',
          },
          {
            'title': 'Quality Spare\nParts',
            'subtitle':
                'Find genuine and quality spare parts for your vehicle from trusted sellers',
            'image': "assets/onboarding/spare_part.svg",
          },
        ]);

    void onGetStarted() {
      context.go(AppRoutes.home);
    }

    void onSkip() {
      context.go(AppRoutes.home);
    }

    void onSignUp() {
      context.go(AppRoutes.roleSelection);
    }

    return _OnboardingView(
      theme: theme,
      colorScheme: colorScheme,
      textTheme: textTheme,
      pageController: pageController,
      currentIndex: currentIndex.value,
      onboardingData: onboardingData,
      onPageChanged: (index) => currentIndex.value = index,
      onGetStarted: onGetStarted,
      onSkip: onSkip,
      onSignUp: onSignUp,
    );
  }
}

class _OnboardingView extends StatelessWidget {
  const _OnboardingView({
    required this.theme,
    required this.colorScheme,
    required this.textTheme,
    required this.pageController,
    required this.currentIndex,
    required this.onboardingData,
    required this.onPageChanged,
    required this.onGetStarted,
    required this.onSkip,
  });

  final ThemeData theme;
  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final PageController pageController;
  final int currentIndex;
  final List<Map<String, String>> onboardingData;
  final ValueChanged<int> onPageChanged;
  final VoidCallback onGetStarted;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final isLastPage = currentIndex == onboardingData.length - 1;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Skip Button
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.lg.w,
                vertical: AppSpacing.md.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo
                  Row(
                    children: [
                      Container(
                        width: 32.w,
                        height: 32.w,
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          Icons.garage_outlined,
                          size: 18.sp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: AppSpacing.sm.w),
                      Text(
                        'Qirb',
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                  // Skip Button

                  TextButton(
                    onPressed: onSkip,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black54,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.md.w,
                        vertical: AppSpacing.sm.h,
                      ),
                    ),
                    child: Text(
                      'Skip',
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: onboardingData.length,
                onPageChanged: onPageChanged,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSpacing.xl.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon Illustration
                        Container(
                          width: 180.w,
                          height: 180.w,
                          decoration: BoxDecoration(
                            color: colorScheme.primary.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(70.r),
                          ),
                          child: SvgPicture.asset(
                            onboardingData[index]['image']!,
                            width: 130.w,
                            height: 130.w,
                          ),
                        ),
                        SizedBox(height: 70),

                        // Title
                        Text(
                          onboardingData[index]['title'] as String,
                          textAlign: TextAlign.center,
                          style: textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            height: 1.2,
                            fontSize: 26.sp,
                          ),
                        ),
                        SizedBox(height: AppSpacing.md.h),

                        // Subtitle
                        Text(
                          onboardingData[index]['subtitle'] as String,
                          textAlign: TextAlign.center,
                          style: textTheme.bodyLarge?.copyWith(
                            color: Colors.black54,
                            height: 1.5,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Bottom Section: Dots and Button
            Padding(
              padding: EdgeInsets.all(AppSpacing.xl.w),
              child: Column(
                children: [
                  // Page Indicator Dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingData.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        width: currentIndex == index ? 32.w : 8.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? colorScheme.primary
                              : Colors.black12,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSpacing.xl.h),

                  // Get Started / Next Button
                  SizedBox(
                    width: double.infinity,
                    height: 45.h,
                    child: ElevatedButton(
                      onPressed: isLastPage
                          ? onGetStarted
                          : () {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                      child: Text(
                        'Next',
                        style: textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
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
