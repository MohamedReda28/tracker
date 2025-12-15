class PolylineModel {
  final String encodedPolyline;

  PolylineModel({required this.encodedPolyline});

  factory PolylineModel.fromJson(Map<String, dynamic> json) {
    return PolylineModel(
      encodedPolyline: json['encodedPolyline'] as String? ?? '',
    );
  }
}
