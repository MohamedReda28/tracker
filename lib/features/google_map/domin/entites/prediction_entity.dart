import 'package:mylocationtruckerapp/features/google_map/domin/entites/structures_formatting_entity.dart';
import 'package:mylocationtruckerapp/features/google_map/domin/entites/tearm_entity.dart';

import 'matched_substring_entity.dart';

class PredictionEntity {
  final String description;
  final List<MatchedSubstringEntity> matchedSubstrings;
  final String placeId;
  final String reference;
  final StructuredFormattingEntity structuredFormatting;
  final List<TermEntity> terms;
  final List<String> types;

  PredictionEntity({
    required this.description,
    required this.matchedSubstrings,
    required this.placeId,
    required this.reference,
    required this.structuredFormatting,
    required this.terms,
    required this.types,
  });
}