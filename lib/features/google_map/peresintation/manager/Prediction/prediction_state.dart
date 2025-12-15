part of 'prediction_cubit.dart';

@immutable
sealed class PredictionState {}

final class PredictionInitial extends PredictionState {}
final class PredictionLoading extends PredictionState {}
final class PredictionSuccess extends PredictionState {
  final AutocompleteResponseEntity autocompleteResponseEntity;

  PredictionSuccess({required this.autocompleteResponseEntity});
}
final class PlaceDitelsSuccess extends PredictionState {
  final PlaceEntity placeEntity;

  PlaceDitelsSuccess({required this.placeEntity});
}

final class PredictionFaluir extends PredictionState {
  final String errMassage;

  PredictionFaluir({required this.errMassage});
}

