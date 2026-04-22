/// API response wrapper based on API documentation
class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? message;
  final int? count;

  const ApiResponse({
    required this.success,
    this.data,
    this.message,
    this.count,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic)? fromJsonT,
  ) {
    return ApiResponse<T>(
      success: json['success'] as bool? ?? false,
      data: json['data'] != null && fromJsonT != null
          ? fromJsonT(json['data'])
          : null,
      message: json['message'] as String?,
      count: json['count'] as int?,
    );
  }

  bool get isSuccess => success;
  bool get isError => !success;
}

/// Auth response wrapper
class AuthResponse {
  final bool success;
  final String token;
  final Map<String, dynamic> user;
  final String? applicationStatus;

  const AuthResponse({
    required this.success,
    required this.token,
    required this.user,
    this.applicationStatus,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      success: json['success'] as bool? ?? false,
      token: json['token'] as String? ?? '',
      user: json['user'] as Map<String, dynamic>? ?? {},
      applicationStatus: json['applicationStatus'] as String?,
    );
  }
}

/// Location response wrapper for nearby garages
class LocationResponse<T> {
  final bool success;
  final Map<String, dynamic>? userLocation;
  final List<T> data;

  const LocationResponse({
    required this.success,
    this.userLocation,
    required this.data,
  });

  factory LocationResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    final dataList = json['data'] as List<dynamic>? ?? [];
    return LocationResponse<T>(
      success: json['success'] as bool? ?? false,
      userLocation: json['userLocation'] as Map<String, dynamic>?,
      data: dataList
          .map((item) => fromJsonT(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
