// prediction_model.dart
import 'package:mylocationtruckerapp/features/google_map/data/models/plasec_autocomplete_model/structured_formatting.dart';
import 'package:mylocationtruckerapp/features/google_map/data/models/plasec_autocomplete_model/term.dart';

import '../../../domin/entites/prediction_entity.dart';
import 'AutocompleteResponseModel .dart';
import 'matched_substring.dart';

class PredictionModel {
  final String description;
  final List<MatchedSubstringModel> matchedSubstrings;
  final String placeId;
  final String reference;
  final StructuredFormattingModel structuredFormatting;
  final List<TermModel> terms;
  final List<String> types;

  PredictionModel({
    required this.description,
    required this.matchedSubstrings,
    required this.placeId,
    required this.reference,
    required this.structuredFormatting,
    required this.terms,
    required this.types,
  });

  factory PredictionModel.fromJson(Map<String, dynamic> json) {
    return PredictionModel(
      description: json['description'] ?? '',
      matchedSubstrings: (json['matched_substrings'] as List)
          .map((e) => MatchedSubstringModel.fromJson(e))
          .toList(),
      placeId: json['place_id'] ?? '',
      reference: json['reference'] ?? '',
      structuredFormatting:
      StructuredFormattingModel.fromJson(json['structured_formatting']),
      terms: (json['terms'] as List)
          .map((e) => TermModel.fromJson(e))
          .toList(),
      types: List<String>.from(json['types'] ?? []),
    );
  }

  Map<String, dynamic> toJson() => {
    'description': description,
    'matched_substrings':
    matchedSubstrings.map((e) => e.toJson()).toList(),
    'place_id': placeId,
    'reference': reference,
    'structured_formatting': structuredFormatting.toJson(),
    'terms': terms.map((e) => e.toJson()).toList(),
    'types': types,
  };

  PredictionEntity toEntity() => PredictionEntity(
    description: description,
    matchedSubstrings:
    matchedSubstrings.map((e) => e.toEntity()).toList(),
    placeId: placeId,
    reference: reference,
    structuredFormatting: structuredFormatting.toEntity(),
    terms: terms.map((e) => e.toEntity()).toList(),
    types: types,
  );
}
