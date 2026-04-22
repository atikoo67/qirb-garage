import 'package:equatable/equatable.dart';

/// Staff member entity
class Staff extends Equatable {
  final int id;
  final String fullName;
  final String email;
  final String specialization;
  final int? garageId;
  final bool? isActive;
  final DateTime? createdAt;

  const Staff({
    required this.id,
    required this.fullName,
    required this.email,
    required this.specialization,
    this.garageId,
    this.isActive,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        fullName,
        email,
        specialization,
        garageId,
        isActive,
        createdAt,
      ];
}
