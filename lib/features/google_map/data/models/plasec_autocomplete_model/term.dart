// term_model.dart
import '../../../domin/entites/tearm_entity.dart';

class TermModel {
  final int offset;
  final String value;

  TermModel({
    required this.offset,
    required this.value,
  });

  factory TermModel.fromJson(Map<String, dynamic> json) {
    return TermModel(
      offset: json['offset'] ?? 0,
      value: json['value'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'offset': offset,
    'value': value,
  };

  TermEntity toEntity() =>
      TermEntity(offset: offset, value: value);
}
