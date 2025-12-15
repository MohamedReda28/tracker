import 'location_model.dart';

class GeometryModel {
  final LocationModel location;

  GeometryModel({required this.location});

  factory GeometryModel.fromJson(Map<String, dynamic> json) {
    return GeometryModel(
      location: LocationModel.fromJson(
        json['location'] as Map<String, dynamic>? ?? const {},
      ),
    );
  }
}
