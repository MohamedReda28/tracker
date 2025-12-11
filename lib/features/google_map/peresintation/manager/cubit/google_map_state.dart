part of 'google_map_cubit.dart';

@immutable
sealed class GoogleMapState {}

final class GoogleMapInitial extends GoogleMapState {}
final class GoogleMapLoading extends GoogleMapState {}
final class GoogleMapSuccess extends GoogleMapState {}
final class GoogleMapFaluir extends GoogleMapState {
  final String errmassage;

  GoogleMapFaluir({required this.errmassage});
}

