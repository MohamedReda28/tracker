import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mylocationtruckerapp/features/google_map/domin/entites/place_detils/plase_detilss.dart';

import '../../../../core/errors/Failur.dart';
import '../entites/plasec_etity.dart';
import '../entites/routes/routes_entity.dart';

abstract class GooglemapRepo {
  Future<Either<Failur, Set<Marker>>> updateLocation(
      {required GoogleMapController googleMapController});
  Future<Set<Marker>> setMaylocationMarker({required LocationData locationData});
Future<Either<Failur, AutocompleteResponseEntity>>getplasecSerch({required String input});
  Future<Either<Failur, PlaceEntity>>getplasecDetils({required String place_id});
  Future<Either<Failur, List<RouteEntity>>> getRoutes(
      {required double startlat,
        required double startlog,required double endlat,required double endlng,});

}
