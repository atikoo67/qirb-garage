import 'package:equatable/equatable.dart';

/// Service type entity from /lookups/service-types
class ServiceType extends Equatable {
  final int id;
  final String name;
  final String description;
  final int estimatedDuration; // in minutes

  const ServiceType({
    required this.id,
    required this.name,
    required this.description,
    required this.estimatedDuration,
  });

  String get durationLabel {
    if (estimatedDuration < 60) {
      return '$estimatedDuration min';
    }
    final hours = estimatedDuration ~/ 60;
    final minutes = estimatedDuration % 60;
    if (minutes == 0) {
      return '$hours hr';
    }
    return '$hours hr $minutes min';
  }

  @override
  List<Object?> get props => [id, name, description, estimatedDuration];
}
