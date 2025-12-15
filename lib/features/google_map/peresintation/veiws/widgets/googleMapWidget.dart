import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mylocationtruckerapp/features/google_map/peresintation/manager/Prediction/prediction_cubit.dart';
import '../../../../../core/widgets/customErrorWidght.dart';
import '../../manager/google_map/google_map_cubit.dart';
import 'CustomTextFormFieldForSerch.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition _initialCameraPosition;
  late GoogleMapController _googleMapController;
  late TextEditingController _textEditingController;
  bool _isFirstCall = true;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _initialCameraPosition = const CameraPosition(
      zoom: 17,
      target: LatLng(0, 0),
    );
    _textEditingController.addListener(() {
      context
          .read<PredictionCubit>()
          .getPrediction(input: _textEditingController.text);
    });
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleMapCubit, GoogleMapState>(
      builder: (context, state) {
        final markers = state is GoogleMapSuccess ? state.marker : <Marker>{};
        final polylines = state is GoogleMapSuccess ? state.polylines ?? <Polyline>{} : <Polyline>{};
        Widget? overlay;

        if (state is GoogleMapLoading) {
          overlay = const Center(child: CircularProgressIndicator());
        } else if (state is GoogleMapFaluir) {
          overlay = Center(
            child: Customerrorwidght(text: state.errmassage),
          );
        }

        return Stack(
          children: [
            GoogleMap(
              onMapCreated: (controller) {
                _googleMapController = controller;
                if (_isFirstCall) {
                  context.read<GoogleMapCubit>().updateCurrentLocation(
                      googleMapController: _googleMapController);
                  _isFirstCall = false;
                }
              },
              initialCameraPosition: _initialCameraPosition,
              markers: markers,
              polylines: polylines,
            ),
            if (overlay != null) overlay,
            CustomtextformfieldForSearchAndList(
              hinttext: 'search here',
              textEditingController: _textEditingController,
            ),

          ],
        );
      },
    );
  }
}







// void updateCrruntLocation() async {
//   try {
//     var locationData = await locationServece.getLocation();
//     setCameraPossion(locationData);
//     await setMaylocationMarker(locationData);
//   } on CheckAndRequestPermissionLocationException catch (e) {
//     // TODO
//   } on CheckAndRequestLocationServiceException catch (e) {
//     // TODO
//   } catch (e) {}
// }

// Future<void> setMaylocationMarker(LocationData locationData) async {
//   var markerIcon = await BitmapDescriptor.fromAssetImage(
//       const ImageConfiguration(), 'assets/images/location.png');
//
//   var myMarker = Marker(
//       icon: markerIcon,
//       markerId: const MarkerId('1'),
//       position: LatLng(locationData.latitude!, locationData.longitude!));
//
//   markers.add(myMarker);
//   setState(() {});
// }
//
// void setCameraPossion(LocationData locationData) {
//   if (isFristCall) {
//     CameraPosition newCameraPossion = CameraPosition(
//         target: LatLng(locationData.latitude!, locationData.longitude!),
//         zoom: 17);
//     googleMapController
//         .animateCamera(CameraUpdate.newCameraPosition(newCameraPossion));
//     isFristCall = false;
//   } else {
//     googleMapController.animateCamera(
//       CameraUpdate.newLatLng(
//         LatLng(locationData.latitude!, locationData.longitude!),
//       ),
//     );
//   }
// }
