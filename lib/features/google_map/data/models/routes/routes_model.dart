import 'package:mylocationtruckerapp/features/google_map/data/models/routes/polyline_model.dart';

import '../../../domin/entites/routes/routes_entity.dart';

class RouteModel {
  final int distanceMeters;
  final String duration;
  final PolylineModel polyline;

  RouteModel({
    required this.distanceMeters,
    required this.duration,
    required this.polyline,
  });

  factory RouteModel.fromJson(Map<String, dynamic> json) {
    return RouteModel(
      distanceMeters: json['distanceMeters'] as int? ?? 0,
      duration: json['duration'] as String? ?? '0s',
      polyline: PolylineModel.fromJson(
        json['polyline'] as Map<String, dynamic>? ?? const {},
      ),
    );
  }

  RouteEntity toEntity() {
    return RouteEntity(
      distanceMeters: distanceMeters,
      duration: _parseDuration(duration),
      encodedPolyline: polyline.encodedPolyline,
    );
  }

  Duration _parseDuration(String value) {
    // Google بيرجعها بصيغة: "165s"
    final seconds =
        int.tryParse(value.replaceAll('s', '')) ?? 0;
    return Duration(seconds: seconds);
  }
}
