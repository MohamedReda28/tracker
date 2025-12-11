import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../../core/errors/Failur.dart';


abstract class GooglemapRepo {
  Future<Either<Failur, void>>updateLocation({required GoogleMapController googleMapController });
}