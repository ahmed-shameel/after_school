import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

import '../pub/components/pub.dart';
import '../pub/pub_screen.dart';
import 'Directions.dart';
import 'directions_repository.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const currentZoom = 10.0;

  static const _initialCameraPosition =
      CameraPosition(target: LatLng(59.3293, 18.0686), zoom: currentZoom);

  late List markers = []; //markers for google map

  late Future<List<Pub>> bars;

  late GoogleMapController _googleMapController;
  late LatLng _currentLocation;
  late LatLng _destination;

  // bool hasPermission = false;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    bars = fetchPubs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Pub>>(
          future: bars,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return (const Center(child: CircularProgressIndicator()));
            } else {
              markers = getMarkers(snapshot);
              return SizedBox(
                child: GoogleMap(
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  onMapCreated: (controller) =>
                      _googleMapController = controller,
                  // markers:
                  initialCameraPosition: _initialCameraPosition,
                  markers: Set.from(markers),
                  // polylines: {
                  //   if (_info != null)
                  //     Polyline(
                  //       polylineId: const PolylineId('overview_polyline'),
                  //       color: Colors.red,
                  //       width: 5,
                  //       points: _info.polylinePoints
                  //           .map((e) => LatLng(e.latitude, e.longitude))
                  //           .toList(),
                  //     ),
                  // },
                  myLocationEnabled: true,
                ),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.black,
            onPressed: () => _googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(_initialCameraPosition),
            ),
            child: const Icon(Icons.center_focus_strong),
          ),
        );
  }

  List getMarkers(snapshot) {
    markers = snapshot.data.map((element) {
      var latlong = element.coordinates.split(",");
      double latitude = double.parse(latlong[0]);
      double longitude = double.parse(latlong[1]);
      return Marker(
        markerId: MarkerId(element.name),
        draggable: false,
        infoWindow: InfoWindow(
          //popup info
          title: element.name,
          snippet: element.description +
              "\n" +
              "Opening Hours: " +
              element.openingHours +
              "\n" +
              "Rating: ",
          onTap: ()=> Navigator.push(context,
              MaterialPageRoute(builder: (index) => PubScreen(pub: element))),
        ),
        icon: BitmapDescriptor.defaultMarker,
        //Icon for Marker
        position: LatLng(latitude, longitude),
      );
    }).toList();

    return markers;
  }

  Future<List<Pub>> fetchPubs() async {
    final response = await http.get(Uri.http('localhost:8080', '/bars'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      return jsonResponse.map((data) => Pub.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load pub');
    }
  }

  Future<Position> locateUser() async {
    return Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    Position pos = await locateUser();
    setState(() {
      _currentLocation = LatLng(pos.latitude, pos.longitude);
    });
  }


  // void _getDirections(LatLng pos) async {
  //     // Get directions
  //     final directions = await DirectionsRepository()
  //         .getDirections(origin: _currentLocation, destination: _destination);
  //     setState(() => _info = directions);
  //   }

}

