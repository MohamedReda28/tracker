import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:mylocationtruckerapp/features/google_map/domin/googlemap_repo/googlemap_repo.dart';
part 'google_map_state.dart';

class GoogleMapCubit extends Cubit<GoogleMapState> {
  GoogleMapCubit(this.googlemapRepo) : super(GoogleMapInitial());
  final GooglemapRepo googlemapRepo;

  Future<void> updateCurrentLocation(
      {required GoogleMapController googleMapController}) async {
    emit(GoogleMapLoading());
    final result = await googlemapRepo.updateLocation(
        googleMapController: googleMapController);

    result.fold((f) => emit(GoogleMapFaluir(errmassage: f.message)),
        (s) => emit(GoogleMapSuccess()));
  }
}
