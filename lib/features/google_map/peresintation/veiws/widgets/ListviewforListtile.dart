import 'package:flutter/material.dart';
import '../../../domin/entites/plasec_etity.dart';
import 'listtile_widget.dart';

class ListviewforListtile extends StatelessWidget {
  const ListviewforListtile(
      {super.key,
      required this.autocompleteResponseEntity,
     });
  final AutocompleteResponseEntity autocompleteResponseEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        color: Colors.white,
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => PredictionListTile(

                  prediction: autocompleteResponseEntity.predictions[index],
                ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: autocompleteResponseEntity.predictions.length),
      ),
    );
  }
}
