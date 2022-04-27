import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const minZoom = 9.0;
  static const maxZoom = 30.0;
  static const _initialCameraPosition = CameraPosition(
      target: LatLng(59.3293, 18.0686),
      zoom: minZoom);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GoogleMap(
        minMaxZoomPreference: MinMaxZoomPreference(minZoom, maxZoom),
        initialCameraPosition: _initialCameraPosition,
        myLocationEnabled: true,
      ),
    );
  }
}
