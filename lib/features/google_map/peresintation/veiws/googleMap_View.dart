import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylocationtruckerapp/core/servesce/git_it_Service.dart';
import 'package:mylocationtruckerapp/features/google_map/domin/googlemap_repo/googlemap_repo.dart';
import 'package:mylocationtruckerapp/features/google_map/peresintation/veiws/widgets/googleMapWidget.dart';

import '../manager/Prediction/prediction_cubit.dart';
import '../manager/google_map/google_map_cubit.dart';

class GooglemapView extends StatelessWidget {
  const GooglemapView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GoogleMapCubit(
            getIt<GooglemapRepo>(),
          ),
        ),
        BlocProvider(
          create: (context) => PredictionCubit(
            getIt<GooglemapRepo>(),
          ),
        ),
      ],
      child: const Scaffold(
        body: SafeArea(child: CustomGoogleMap()),
      ),
    );
  }
}
// class CustomGoogleMapBlocBuilder extends StatelessWidget {
//   const CustomGoogleMapBlocBuilder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<GoogleMapCubit,GoogleMapState>(
//       builder: ( context,state) {
//         if(state is GoogleMapFaluir){
//           return Customerrorwidght(text: state.errmassage,);
//         }else if(state is GoogleMapSuccess){
//           return const CustomGoogleMap();
//         }else if (state is GoogleMapLoading){
//           return const Skeletonizer(
//             child:CustomGoogleMap(),
//           );
//         }else{
//           return  Container(color: Colors.blue,);
//         }
//        },
//     );
//   }
// }
