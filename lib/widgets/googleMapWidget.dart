import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mylocationtruckerapp/utils/location_servece.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;
 late LocationServece locationServece;
  GoogleMapController? googleMapController;
  @override
  void initState() {

    initialCameraPosition = const CameraPosition(
        zoom: 17, target: LatLng(0,0));

    locationServece =LocationServece();
    getLocationAndPermission();
  }
  @override
  void dispose() {
    googleMapController!.dispose();
    super.dispose();

  }

  Set<Marker> markers = {};
  bool isFristCall =true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
            onMapCreated: (controller) {
              googleMapController = controller;
            },
            initialCameraPosition: initialCameraPosition),
      ],
    );
  }

  void getLocationAndPermission() async {
    await locationServece.checkAndRequestLocationService();
    if (await locationServece.checkAndRequestPermissionLocation()) {
      locationServece.getRealTimeLocationData((locationData) async {
        setCameraPossion(locationData);
        await setMaylocationMarker(locationData);
      });
    } else {}
  }
  Future<void> setMaylocationMarker(LocationData locationData) async {
    var markerIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/images/location.png');

    var myMarker = Marker(
        icon: markerIcon,
        markerId: const MarkerId('1'),
        position: LatLng(locationData.latitude!, locationData.longitude!));

    markers.add(myMarker);
    setState(() {});
  }

  void setCameraPossion(LocationData locationData) {
    if (isFristCall) {
      CameraPosition newCameraPossion = CameraPosition(
          target: LatLng(locationData.latitude!, locationData.longitude!),
          zoom: 17);
      googleMapController
          ?.animateCamera(CameraUpdate.newCameraPosition(newCameraPossion));
      isFristCall=false;
    } else {
      googleMapController?.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(locationData.latitude!, locationData.longitude!),
        ),
      );
    }
  }
}
