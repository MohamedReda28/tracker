import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mylocationtruckerapp/core/servesce/dataBaseServece.dart';
import 'package:mylocationtruckerapp/core/servesce/location_servece.dart';
import 'package:mylocationtruckerapp/features/google_map/data/models/place_detils/place_detils_model.dart';
import 'package:mylocationtruckerapp/features/google_map/domin/entites/place_detils/plase_detilss.dart';
import 'package:mylocationtruckerapp/features/google_map/domin/entites/routes/routes_entity.dart';
import 'package:mylocationtruckerapp/features/google_map/domin/googlemap_repo/googlemap_repo.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/errors/Failur.dart';
import '../../../../core/errors/premission_error.dart';
import '../../domin/entites/plasec_etity.dart';
import '../models/plasec_autocomplete_model/AutocompleteResponseModel .dart';
import '../models/routes/routes_response_model.dart';

class GooglemapRepoimple extends GooglemapRepo {
  final LocationServece locationServece;
  final DataBaseServese dataBaseServese;
  String? uuid = const Uuid().v4();
  GooglemapRepoimple(
      {required this.locationServece, required this.dataBaseServese});
  @override
  Future<Either<Failur, Set<Marker>>> updateLocation(
      {required GoogleMapController googleMapController}) async {
    try {
      final currentLocation = await locationServece.getLocation();

      CameraPosition newCameraPossion = CameraPosition(
          target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
          zoom: 17);
      googleMapController
          .animateCamera(CameraUpdate.newCameraPosition(newCameraPossion));

      final marker = await setMaylocationMarker(locationData: currentLocation);
      return right(marker);
    } on CheckAndRequestPermissionLocationException catch (e) {
      log('Exception from get location ${e.toString()}');

      return left(LocationServerFailure(errMassege: e.message));
    } on CheckAndRequestLocationServiceException catch (e) {
      log('Exception from get Service location ${e.toString()}');

      return left(LocationServerFailure(errMassege: e.message));
    } catch (e) {
      log('Exseption from get location ${e.toString()}');
      return left(LocationServerFailure(errMassege: 'error in get loction'));
    }
  }

  Future<Set<Marker>> setMaylocationMarker(
      {required LocationData locationData}) async {
    var markerIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/images/location.png');

    return {
      Marker(
          icon: markerIcon,
          markerId: const MarkerId('1'),
          position: LatLng(locationData.latitude!, locationData.longitude!)),
    };
  }

  @override
  Future<Either<Failur, AutocompleteResponseEntity>> getplasecSerch(
      {required String input}) async {
    try {
      uuid ??= const Uuid().v4();
      final data = await dataBaseServese.getData(
              endPoint:
                  'place/autocomplete/json?input=$input&sessiontoken=$uuid')
          as Map<String, dynamic>;

      AutocompleteResponseModel plasecesModel =
          AutocompleteResponseModel.fromJson(data);
      AutocompleteResponseEntity plassecs = plasecesModel.toEntity();
      log('sessiontoke$uuid');
      return right(plassecs);
    } on DioException catch (e) {
      return left(LocationServerFailure.fromDioException(e));
    } catch (e) {
      log('Exseption from get plasece ${e.toString()}');
      return left(LocationServerFailure(errMassege: 'error in get plaseces'));
    }
  }

  @override
  Future<Either<Failur, PlaceEntity>> getplasecDetils(
      {required String place_id}) async {
    try {
      final data = await dataBaseServese.getData(
              endPoint: 'place/details/json?place_id=$place_id')
          as Map<String, dynamic>;

      PlaceModel placeModel = PlaceModel.fromJson(data);
      PlaceEntity placeDetils = placeModel.toEntity();
      uuid = null;
      return right(placeDetils);
    } on DioException catch (e) {
      return left(LocationServerFailure.fromDioException(e));
    } catch (e) {
      log('Exseption from get plasec Detils ${e.toString()}');
      return left(LocationServerFailure(errMassege: 'error in get plaseces'));
    }
  }

  @override
  Future<Either<Failur, List<RouteEntity>>> getRoutes(
      {required double startlat,
        required double startlog,required double endlat,required double endlng,}) async{
    try{
      final data =await  dataBaseServese.addData(endPoint:'https://routes.googleapis.com/directions/v2:computeRoutes',
          body: {
            "origin": {
              "location": {
                "latLng": {
                  "latitude": startlat,
                  "longitude": startlog
                }
              }
            },
            "destination": {
              "location": {
                "latLng": {
                  "latitude": endlat,
                  "longitude": endlng
                }
              }
            },
            "travelMode": "DRIVE",
            "routingPreference": "TRAFFIC_AWARE",
            "computeAlternativeRoutes": false,
            "routeModifiers": {
              "avoidTolls": false,
              "avoidHighways": false,
              "avoidFerries": false
            },
            "languageCode": "en-US",
            "units": "METRIC"
          })as Map<String,dynamic>;
      RoutesResponseModel routesResponseModel = RoutesResponseModel.fromJson(data);
      List<RouteEntity> routeEntity = routesResponseModel.toEntities().toList();
      return right(routeEntity);
    } on DioException catch (e) {
      return left(LocationServerFailure.fromDioException(e));
    } catch (e) {
      log('Exseption from get Routes ${e.toString()}');
      return left(LocationServerFailure(errMassege: 'error in get Routes'));
    }
  }
}
