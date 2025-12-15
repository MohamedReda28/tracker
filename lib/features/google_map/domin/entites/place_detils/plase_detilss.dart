class PlaceEntity {
  final String placeId;
  final String name;
  final String formattedAddress;
  final double lat;
  final double lng;

  final String city;
  final String governorate;
  final String country;
  final String countryCode;

  final String? website;

  const PlaceEntity({
    required this.placeId,
    required this.name,
    required this.formattedAddress,
    required this.lat,
    required this.lng,
    required this.city,
    required this.governorate,
    required this.country,
    required this.countryCode,
    this.website,
  });
}
