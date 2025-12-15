import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:mylocationtruckerapp/features/google_map/domin/googlemap_repo/googlemap_repo.dart';
import '../../../../../core/utils/decode_Polyline.dart';
part 'google_map_state.dart';

class GoogleMapCubit extends Cubit<GoogleMapState> {
  GoogleMapCubit(this.googlemapRepo) : super(GoogleMapInitial());
  final GooglemapRepo googlemapRepo;

  Future<void> updateCurrentLocation(
      {required GoogleMapController googleMapController}) async {
    emit(GoogleMapLoading());
    final result = await googlemapRepo.updateLocation(
        googleMapController: googleMapController);

    result.fold((f) => emit(GoogleMapFaluir(errmassage: f.errMassege)),
        (marker) => emit(GoogleMapSuccess(marker:marker)));
  }

  Future<void> getRoutes({
    required double startlat,
    required double startlog,
    required double endlat,
    required double endlng,
  }) async {
    emit(GoogleMapLoading());

    final result = await googlemapRepo.getRoutes(
      startlat: startlat,
      startlog: startlog,
      endlat: endlat,
      endlng: endlng,
    );

    result.fold(
          (f) => emit(GoogleMapFaluir(errmassage: f.errMassege)),
          (routesList) {
        // تحويل routes إلى polylines
        final Set<Polyline> polylines = {};
        for (int i = 0; i < routesList.length; i++) {
          final route = routesList[i];
          final points = decodePolyline(route.encodedPolyline);
          polylines.add(
            Polyline(
              polylineId: PolylineId('route_$i'),
              points: points,
              color: Colors.blue,
              width: 5,
            ),
          );
                }

        // خد العلامات الحالية لو في أي
        final currentMarkers = (state is GoogleMapSuccess)
            ? (state as GoogleMapSuccess).marker
            : <Marker>{};

        // أصدر حالة واحدة فيها العلامات + المسار
        emit(GoogleMapSuccess(
          marker: currentMarkers,
          polylines: polylines,
        ));
      },
    );
  }
}
