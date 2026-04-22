import '../imports/core_imports.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'feature_flags.dart';

class AppConfig {
  AppConfig._();
  static late final Dio dio;

  static String get baseUrl => _getBaseUrl();

  static Future<void> init() async {
    // Log feature flags configuration
    if (FeatureFlags.enableDebugLogging) {
      AppLogger.info('🚀 Initializing App Configuration');
      AppLogger.info(FeatureFlags.configSummary);
    }

    // Only initialize Dio if not using mock data
    // This prevents the invalid URL error when using mock services
    if (!FeatureFlags.useMockAuth) {
      dio = Dio(
        BaseOptions(
          baseUrl: _getBaseUrl(),
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            if (FeatureFlags.enableDebugLogging) {
              AppLogger.info(
                  '🌐 [DIO] REQUEST[${options.method}] => PATH: ${options.path}');
            }
            return handler.next(options);
          },
          onResponse: (response, handler) {
            if (FeatureFlags.enableDebugLogging) {
              AppLogger.info(
                  '✅ [DIO] RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
            }
            return handler.next(response);
          },
          onError: (DioException e, handler) {
            if (FeatureFlags.enableDebugLogging) {
              AppLogger.error(
                  '❌ [DIO] ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}');
            }
            return handler.next(e);
          },
        ),
      );
    } else {
      // Create a dummy Dio instance for mock mode
      // This prevents null reference errors
      dio = Dio(
        BaseOptions(
          baseUrl: 'http://localhost:3000/api', // Dummy URL for mock mode
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (FeatureFlags.enableDebugLogging) {
        AppLogger.info(
            '🎭 [MOCK MODE] Dio initialized with dummy URL (not used)');
      }
    }
  }

  static String _getBaseUrl() {
    return dotenv.get('BASE_API_URL', fallback: 'http://localhost:3000/api');
  }
}
