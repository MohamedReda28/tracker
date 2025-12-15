// structured_formatting_model.dart
import '../../../domin/entites/structures_formatting_entity.dart';
import 'AutocompleteResponseModel .dart';
import 'matched_substring.dart';

class StructuredFormattingModel {
  final String mainText;
  final List<MatchedSubstringModel> mainTextMatchedSubstrings;
  final String secondaryText;

  StructuredFormattingModel({
    required this.mainText,
    required this.mainTextMatchedSubstrings,
    required this.secondaryText,
  });

  factory StructuredFormattingModel.fromJson(Map<String, dynamic> json) {
    return StructuredFormattingModel(
      mainText: json['main_text'] ?? '',
      mainTextMatchedSubstrings:
      (json['main_text_matched_substrings'] as List)
          .map((e) => MatchedSubstringModel.fromJson(e))
          .toList(),
      secondaryText: json['secondary_text'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'main_text': mainText,
    'main_text_matched_substrings':
    mainTextMatchedSubstrings.map((e) => e.toJson()).toList(),
    'secondary_text': secondaryText,
  };

  StructuredFormattingEntity toEntity() => StructuredFormattingEntity(
    mainText: mainText,
    mainTextMatchedSubstrings:
    mainTextMatchedSubstrings.map((e) => e.toEntity()).toList(),
    secondaryText: secondaryText,
  );
}
