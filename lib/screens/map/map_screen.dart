import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const currentZoom = 10.0;
  static const _initialCameraPosition =
  CameraPosition(target: LatLng(59.3293, 18.0686), zoom: currentZoom);
  final Set<Marker> markers = new Set(); //markers for google map
  static const LatLng showLocation =  LatLng(59.4077207690603, 17.945989974148407); //location to show in map

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: getMarkers(), //markers to show on map
        initialCameraPosition: _initialCameraPosition,
        myLocationEnabled: true,

      ),
    );
  }
  Set<Marker> getMarkers() {
    //markers to place on map
    setState(() {
      markers.add(Marker( //add first marker
        markerId: MarkerId(showLocation.toString()),
        position: showLocation, //position of marker
        infoWindow: const InfoWindow( //popup info
          title: 'DISK KM',
          snippet: 'Onsdagar 15:45 - Sent™ och sista fredagen i månaden kl. 15:45 - Sent™',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker(
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(59.36484800359592, 18.054968939491033),
        infoWindow: const InfoWindow(
          title: 'Bojan Crew',
          snippet: 'Torsdagar 17:00-01:00',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker(
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(59.35798073395385, 18.05561361223785), //position of marker
        infoWindow: const InfoWindow( //popup info
          title: 'F.E.ST PrU',
          snippet: 'Följ på Facebook för event!',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      //add more markers here
    });

    return markers;
  }
}