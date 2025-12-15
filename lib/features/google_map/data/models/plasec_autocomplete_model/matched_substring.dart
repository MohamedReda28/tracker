// matched_substring_model.dart
import '../../../domin/entites/matched_substring_entity.dart';

class MatchedSubstringModel {
  final int length;
  final int offset;

  MatchedSubstringModel({
    required this.length,
    required this.offset,
  });

  factory MatchedSubstringModel.fromJson(Map<String, dynamic> json) {
    return MatchedSubstringModel(
      length: json['length'] ?? 0,
      offset: json['offset'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'length': length,
    'offset': offset,
  };

  MatchedSubstringEntity toEntity() =>
      MatchedSubstringEntity(length: length, offset: offset);
}
