import 'package:equatable/equatable.dart';

/// Garage entity representing a service garage
/// Based on API response from /garages/nearby
class Garage extends Equatable {
  final int id;
  final String name;
  final String rating;
  final GarageAddress address;
  final double? distanceKm;
  final String? distanceLabel;
  final String? description;
  final String? phoneNumber;
  final String? email;
  final List<String>? specialties;
  final bool? isVerified;
  final String? imageUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Garage({
    required this.id,
    required this.name,
    required this.rating,
    required this.address,
    this.distanceKm,
    this.distanceLabel,
    this.description,
    this.phoneNumber,
    this.email,
    this.specialties,
    this.isVerified,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        rating,
        address,
        distanceKm,
        distanceLabel,
        description,
        phoneNumber,
        email,
        specialties,
        isVerified,
        imageUrl,
        createdAt,
        updatedAt,
      ];
}

/// Garage address entity
class GarageAddress extends Equatable {
  final String streetAddress;
  final String city;
  final String? region;
  final String? postalCode;

  const GarageAddress({
    required this.streetAddress,
    required this.city,
    this.region,
    this.postalCode,
  });

  @override
  List<Object?> get props => [streetAddress, city, region, postalCode];
}
