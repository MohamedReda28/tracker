import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mylocationtruckerapp/core/servesce/location_servece.dart';
import 'package:mylocationtruckerapp/features/google_map/domin/googlemap_repo/googlemap_repo.dart';
import '../../../../core/errors/Failur.dart';
import '../../../../core/errors/premission_error.dart';

class GooglemapRepoimple extends GooglemapRepo {
  final LocationServece locationServece;

  GooglemapRepoimple({required this.locationServece});
  @override
  Future<Either<Failur, void>> updateLocation({required GoogleMapController googleMapController }) async {
    try {
      final currentLocation = await locationServece.getLocation();

      CameraPosition newCameraPossion = CameraPosition(
          target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
          zoom: 17);
      googleMapController
          .animateCamera(CameraUpdate.newCameraPosition(newCameraPossion));
      return right(null);
    } on CheckAndRequestPermissionLocationException catch (e) {
      log('Exception from get location ${e.toString()}');

      return left(LocationServerFailure(e.message));
    }on CheckAndRequestLocationServiceException catch (e) {
      log('Exception from get Service location ${e.toString()}');

      return left(LocationServerFailure(e.message));
    } catch (e) {
      log('Exseption from get location ${e.toString()}');
      return left(LocationServerFailure('error in get loction'));
    }
  }
}




