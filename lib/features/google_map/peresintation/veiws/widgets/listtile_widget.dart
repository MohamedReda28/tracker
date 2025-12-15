import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylocationtruckerapp/features/google_map/peresintation/manager/Prediction/prediction_cubit.dart';
import 'package:mylocationtruckerapp/features/google_map/peresintation/manager/google_map/google_map_cubit.dart';
import '../../../domin/entites/prediction_entity.dart';

class PredictionListTile extends StatelessWidget {
  final PredictionEntity prediction;
  final VoidCallback? onTap;

  const PredictionListTile({
    Key? key,
    required this.prediction,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainText = prediction.structuredFormatting.mainText;
    final secondaryText = prediction.structuredFormatting.secondaryText;

    return ListTile(
      leading: const Icon(Icons.location_on),
      title: Text(
        mainText,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(secondaryText),
      onTap: ()async{
       await context.read<PredictionCubit>().getPlaceDetils(place_id: prediction.placeId);
      },
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, ),
      trailing: IconButton(onPressed: (){},
          icon: const Icon(Icons.arrow_forward)),
    );
  }
}


