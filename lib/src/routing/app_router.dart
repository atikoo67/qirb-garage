import 'package:go_router/go_router.dart';
import 'package:qirb_garage/src/features/spare_parts/presentation/screens/spare_parts_marketplace_screen.dart';
import 'package:qirb_garage/src/routing/global_navigator.dart';
import 'package:qirb_garage/src/routing/app_routes.dart';

import 'package:qirb_garage/src/features/splash/presentation/screens/splash_screen.dart';
import 'package:qirb_garage/src/features/auth/presentation/screens/login_screen.dart';
import 'package:qirb_garage/src/features/auth/presentation/screens/signup_screen.dart';
import 'package:qirb_garage/src/features/auth/presentation/screens/role_selection_screen.dart';
import 'package:qirb_garage/src/features/auth/presentation/screens/forgot_password_screen.dart';

import 'package:qirb_garage/src/features/home/presentation/screens/home_page.dart';
import 'package:qirb_garage/src/features/home/presentation/screens/main_screen.dart';
import 'package:qirb_garage/src/features/onboarding/presentation/screens/onboarding_page.dart';

import 'package:qirb_garage/src/features/garage/presentation/screens/garage_list_screen.dart';
import 'package:qirb_garage/src/features/garage/presentation/screens/garage_detail_screen.dart';

import 'package:qirb_garage/src/features/spare_parts/presentation/screens/spare_part_detail_screen.dart';

import 'package:qirb_garage/src/features/repair_guides/presentation/screens/repair_guides_screen.dart';

import 'package:qirb_garage/src/features/favorites/presentation/screens/favorites_screen.dart';

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.splash,
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.splash,
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      name: 'onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: AppRoutes.roleSelection,
      name: 'roleSelection',
      builder: (context, state) => const RoleSelectionScreen(),
    ),
    GoRoute(
      path: AppRoutes.login,
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.signup,
      name: 'signup',
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: AppRoutes.forgotPassword,
      name: 'forgotPassword',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: AppRoutes.home,
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppRoutes.main,
      name: 'main',
      builder: (context, state) => const MainScreen(),
    ),
    // Garage routes
    GoRoute(
      path: AppRoutes.garages,
      name: 'garages',
      builder: (context, state) => const GarageListScreen(),
    ),
    GoRoute(
      path: '/garages/:id',
      name: 'garageDetail',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return GarageDetailScreen(garageId: id);
      },
    ),
    // Spare parts routes
    GoRoute(
      path: AppRoutes.spareParts,
      name: 'spareParts',
      builder: (context, state) => const SparePartsMarketplaceScreen(),
    ),
    GoRoute(
      path: '/spare-parts/:id',
      name: 'sparePartDetail',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return SparePartDetailScreen(partId: id);
      },
    ),
    // Repair guides routes
    GoRoute(
      path: AppRoutes.repairGuides,
      name: 'repairGuides',
      builder: (context, state) => const RepairGuidesScreen(),
    ),
    // Favorites route
    GoRoute(
      path: AppRoutes.favorites,
      name: 'favorites',
      builder: (context, state) => const FavoritesScreen(),
    ),
  ],
);
