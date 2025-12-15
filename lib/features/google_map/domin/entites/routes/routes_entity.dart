class RouteEntity {
  final int distanceMeters;
  final Duration duration;
  final String encodedPolyline;

  const RouteEntity({
    required this.distanceMeters,
    required this.duration,
    required this.encodedPolyline,
  });
}
