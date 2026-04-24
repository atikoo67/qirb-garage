/// Centralized route path constants for GoRouter.
///
/// Use these variables instead of raw strings throughout the app.
/// Example: `context.go(AppRoutes.onboarding)` instead of `context.go('/')`.
abstract final class AppRoutes {
  AppRoutes._();

  static const String splash = '/splash';
  static const String home = '/';
  static const String main = '/main';
  static const String onboarding = '/onboarding';
  static const String roleSelection = '/role-selection';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';

  // Garage routes
  static const String garages = '/garages';
  static String garageDetail(String id) => '/garages/$id';
  static String garageRequest(String id) => '/garages/$id/request';

  // Spare parts routes
  static const String spareParts = '/spare-parts';
  static String sparePartDetail(String id) => '/spare-parts/$id';

  // Repair guides routes
  static const String repairGuides = '/repair-guides';
  static String repairGuideDetail(String id) => '/repair-guides/$id';

  // Other routes
  static const String favorites = '/favorites';
}
