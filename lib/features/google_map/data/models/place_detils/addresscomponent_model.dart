class AddressComponentModel {
  final String longName;
  final String shortName;
  final List<String> types;

  const AddressComponentModel({
    required this.longName,
    required this.shortName,
    required this.types,
  });

  factory AddressComponentModel.fromJson(Map<String, dynamic> json) {
    return AddressComponentModel(
      longName: json['long_name'] as String? ?? '',
      shortName: json['short_name'] as String? ?? '',
      types: (json['types'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
    );
  }

  const AddressComponentModel.empty()
      : longName = '',
        shortName = '',
        types = const [];
}
