import 'package:mylocationtruckerapp/features/google_map/domin/entites/prediction_entity.dart';

class AutocompleteResponseEntity {
  final List<PredictionEntity> predictions;
  final String status;

  AutocompleteResponseEntity({
    required this.predictions,
    required this.status,
  });
}