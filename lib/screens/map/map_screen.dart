import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

 class MapScreen extends StatefulWidget {
   const MapScreen({Key? key}) : super(key: key);

   @override
   State<MapScreen> createState() => _MapScreenState();
 }

 class _MapScreenState extends State<MapScreen> {
   static const currentZoom = 9.0;
   static const _initialCameraPosition = CameraPosition(
       target: LatLng(59.3293, 18.0686),
       zoom: currentZoom);

   @override
   Widget build(BuildContext context) {
     return const Scaffold(
       body: GoogleMap(
         initialCameraPosition: _initialCameraPosition,
         myLocationEnabled: true,
       ),
     );
   }
 }
