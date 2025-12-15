// autocomplete_response_model.dart
import '../../../domin/entites/plasec_etity.dart';
import 'PredictionModel.dart';

class AutocompleteResponseModel {
  final List<PredictionModel> predictions;
  final String status;

  AutocompleteResponseModel({
    required this.predictions,
    required this.status,
  });

  factory AutocompleteResponseModel.fromJson(Map<String, dynamic> json) {
    return AutocompleteResponseModel(
      predictions: (json['predictions'] as List)
          .map((e) => PredictionModel.fromJson(e))
          .toList(),
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'predictions': predictions.map((e) => e.toJson()).toList(),
    'status': status,
  };

  AutocompleteResponseEntity toEntity() => AutocompleteResponseEntity(
    predictions: predictions.map((e) => e.toEntity()).toList(),
    status: status,
  );
}
