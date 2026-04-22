import 'package:qirb_garage/src/imports/core_imports.dart';
import 'package:qirb_garage/src/imports/packages_imports.dart';

import 'package:qirb_garage/src/features/auth/presentation/providers/session_provider.dart';

class SessionListenerWrapper extends ConsumerWidget {
  final Widget child;
  const SessionListenerWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SessionState>(sessionProvider, (prev, next) {
      // Only navigate if status changed and context is mounted
      if (next.status != SessionStatus.unknown && context.mounted) {
        FlutterNativeSplash.remove();

        // Use WidgetsBinding to ensure navigation happens after frame
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!context.mounted) return;

          try {
            // Check if GoRouter is available
            final router = GoRouter.maybeOf(context);
            if (router == null) return;

            if (next.status == SessionStatus.authenticated) {
              context.go(AppRoutes.home);
            } else if (next.status == SessionStatus.unauthenticated) {
              context.go(AppRoutes.onboarding);
            }
          } catch (e) {
            // Silently catch navigation errors during initialization
            AppLogger.error('Navigation error: $e');
          }
        });
      }
    });

    return child;
  }
}
