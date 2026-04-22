import 'package:equatable/equatable.dart';

/// Vehicle type entity from /lookups/vehicle-types
class VehicleType extends Equatable {
  final int id;
  final String make;
  final String model;
  final String category;

  const VehicleType({
    required this.id,
    required this.make,
    required this.model,
    required this.category,
  });

  String get fullName => '$make $model';

  @override
  List<Object?> get props => [id, make, model, category];
}
