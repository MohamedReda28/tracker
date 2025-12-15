import 'package:mylocationtruckerapp/features/google_map/data/models/routes/routes_model.dart';

import '../../../domin/entites/routes/routes_entity.dart';

class RoutesResponseModel {
  final List<RouteModel> routes;

  RoutesResponseModel({required this.routes});

  factory RoutesResponseModel.fromJson(Map<String, dynamic> json) {
    return RoutesResponseModel(
      routes: (json['routes'] as List<dynamic>? ?? [])
          .map(
            (e) => RouteModel.fromJson(
          e as Map<String, dynamic>? ?? const {},
        ),
      )
          .toList(),
    );
  }

  List<RouteEntity> toEntities() {
    return routes.map((e) => e.toEntity()).toList();
  }
}
