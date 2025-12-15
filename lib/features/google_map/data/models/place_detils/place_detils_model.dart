import '../../../domin/entites/place_detils/plase_detilss.dart';
import 'addresscomponent_model.dart';
import 'geometry_model.dart';

class PlaceModel {
  final String placeId;
  final String name;
  final String formattedAddress;
  final GeometryModel geometry;
  final List<AddressComponentModel> addressComponents;
  final String website;

  PlaceModel({
    required this.placeId,
    required this.name,
    required this.formattedAddress,
    required this.geometry,
    required this.addressComponents,
    required this.website,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      placeId: json['place_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      formattedAddress: json['formatted_address'] as String? ?? '',
      website: json['website'] as String? ?? '',
      geometry: GeometryModel.fromJson(
        json['geometry'] as Map<String, dynamic>? ?? const {},
      ),
      addressComponents:
          (json['address_components'] as List<dynamic>? ?? [])
              .map(
                (e) => AddressComponentModel.fromJson(
                  e as Map<String, dynamic>? ?? const {},
                ),
              )
              .toList(),
    );
  }

  // ⭐ Null-safe toEntity
  PlaceEntity toEntity() {
    AddressComponentModel find(String type) {
      return addressComponents.firstWhere(
        (c) => c.types.contains(type),
        orElse: () => const AddressComponentModel.empty(),
      );
    }

    final city = find('locality');
    final governorate = find('administrative_area_level_1');
    final country = find('country');

    return PlaceEntity(
      placeId: placeId,
      name: name,
      formattedAddress: formattedAddress,
      lat: geometry.location.lat,
      lng: geometry.location.lng,
      city: city.longName,
      governorate: governorate.longName,
      country: country.longName,
      countryCode: country.shortName,
      website: website,
    );
  }
}
