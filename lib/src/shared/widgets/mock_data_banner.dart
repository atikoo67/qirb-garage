import 'package:flutter/material.dart';
import '../../config/feature_flags.dart';

/// Banner to display when using mock data
///
/// Shows a warning banner at the top of the screen when mock data is enabled.
/// Only visible in debug mode and when mock features are enabled.
class MockDataBanner extends StatelessWidget {
  final Widget child;

  const MockDataBanner({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // Only show in debug mode and when mock features are enabled
    if (!FeatureFlags.isAnyMockEnabled) {
      return child;
    }

    return Banner(
      message: 'MOCK DATA',
      location: BannerLocation.topEnd,
      color: Colors.orange,
      child: child,
    );
  }
}

/// Info dialog showing mock credentials and data info
class MockDataInfoDialog extends StatelessWidget {
  const MockDataInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Row(
        children: [
          Icon(Icons.info_outline, color: Colors.orange),
          SizedBox(width: 8),
          Text('Mock Data Info'),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'The app is currently using mock data for testing.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            if (FeatureFlags.useMockAuth) ...[
              const Text(
                'Test Credentials:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _buildCredentialItem(
                'Regular User',
                'user@test.com',
                'password123',
              ),
              _buildCredentialItem(
                'Admin',
                'admin@test.com',
                'admin123',
              ),
              _buildCredentialItem(
                'Garage Owner',
                'owner@test.com',
                'owner123',
              ),
              const SizedBox(height: 16),
            ],
            const Text(
              'To switch to real backend:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '1. Open lib/src/config/feature_flags.dart\n'
              '2. Set useMockAuth = false\n'
              '3. Hot restart the app',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Got it'),
        ),
      ],
    );
  }

  Widget _buildCredentialItem(String role, String email, String password) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              role,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Email: $email',
              style: const TextStyle(fontSize: 11),
            ),
            Text(
              'Password: $password',
              style: const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }

  /// Show the mock data info dialog
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const MockDataInfoDialog(),
    );
  }
}
