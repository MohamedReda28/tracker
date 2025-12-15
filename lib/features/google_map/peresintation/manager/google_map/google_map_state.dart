part of 'google_map_cubit.dart';

@immutable
sealed class GoogleMapState {}

final class GoogleMapInitial extends GoogleMapState {}
final class GoogleMapLoading extends GoogleMapState {}
final class GoogleMapSuccess extends GoogleMapState {
  final Set<Marker> marker;
  final Set<Polyline>? polylines; // <-- جديد

   GoogleMapSuccess({
    required this.marker,
    this.polylines,
  });
}

final class GoogleMapFaluir extends GoogleMapState {
  final String errmassage;

  GoogleMapFaluir({required this.errmassage});
}

