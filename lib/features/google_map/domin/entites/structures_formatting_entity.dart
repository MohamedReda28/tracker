import 'matched_substring_entity.dart';

class StructuredFormattingEntity {
  final String mainText;
  final List<MatchedSubstringEntity> mainTextMatchedSubstrings;
  final String secondaryText;

  StructuredFormattingEntity({
    required this.mainText,
    required this.mainTextMatchedSubstrings,
    required this.secondaryText,
  });
}
