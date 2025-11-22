import 'package:flutter/material.dart';
import 'package:mylocationtruckerapp/widgets/googleMapWidget.dart';

void main() {
  runApp(const GoogleMapTest());
}

class GoogleMapTest extends StatelessWidget {
  const GoogleMapTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CustomGoogleMap(),
    );
  }
}
