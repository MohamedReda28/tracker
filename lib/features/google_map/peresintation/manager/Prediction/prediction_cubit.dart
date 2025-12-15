import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mylocationtruckerapp/features/google_map/domin/entites/place_detils/plase_detilss.dart';
import 'package:mylocationtruckerapp/features/google_map/domin/entites/plasec_etity.dart';
import 'package:mylocationtruckerapp/features/google_map/domin/googlemap_repo/googlemap_repo.dart';
part 'prediction_state.dart';

class PredictionCubit extends Cubit<PredictionState> {
  PredictionCubit(this.googlemapRepo) : super(PredictionInitial());
  final GooglemapRepo googlemapRepo;

  Future<void>getPrediction({required String input})async{
    emit(PredictionLoading());

    final result = await googlemapRepo.getplasecSerch(input: input);
    result.fold((f)=>emit(PredictionFaluir(errMassage: f.errMassege)),
        (s)=>emit(PredictionSuccess( autocompleteResponseEntity: s)));
  }

  Future<void>getPlaceDetils({required String place_id})async{
    emit(PredictionLoading());

    final result = await googlemapRepo.getplasecDetils(place_id: place_id);
    result.fold((f)=>emit(PredictionFaluir(errMassage: f.errMassege)),
            (s)=>emit(PlaceDitelsSuccess(placeEntity: s)));
  }


}
