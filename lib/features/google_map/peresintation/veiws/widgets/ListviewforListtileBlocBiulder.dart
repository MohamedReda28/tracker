
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/customErrorWidght.dart';
import '../../manager/Prediction/prediction_cubit.dart';
import 'ListviewforListtile.dart';

class ListviewforListtileBlocBiulder extends StatelessWidget {
  const ListviewforListtileBlocBiulder({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<PredictionCubit,PredictionState>(
        builder: (context,state){

           if(state is PredictionSuccess){
            return ListviewforListtile(autocompleteResponseEntity: state.autocompleteResponseEntity, );
          }else if (state is PredictionFaluir){
            return Customerrorwidght(text: state.errMassage,);
          }
          else{
            return const SizedBox();
          }
        }
    );
  }
}