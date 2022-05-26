import 'dart:convert';

import 'package:after_school/screens/pub/components/newPub.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const currentZoom = 10.0;

  static const _initialCameraPosition = CameraPosition(
      target: LatLng(59.3293, 18.0686), zoom: currentZoom
  );

  late List markers = []; //markers for google map

  late Future<List<newPub>> bars;

  @override
  void initState() {
    super.initState();
    bars = fetchPubs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<newPub>>(
        future: bars,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return (const Center(child: CircularProgressIndicator()));
          } else {
            markers = getMarkers(snapshot);
            //markers = getMarkers();
            return SizedBox(
              child: GoogleMap(
                zoomGesturesEnabled: true,
                // markers:
                initialCameraPosition: _initialCameraPosition,
                markers: Set.from(markers),
                myLocationButtonEnabled: true,
              ),
            );
          }
        },
      ),
    );
  }

  List getMarkers(snapshot) {

    markers = snapshot.data.map((element) {
      var latlong =  element.coordinates.split(",");
      double latitude = double.parse(latlong[0]);
      double longitude = double.parse(latlong[1]);
      return Marker(
        markerId: MarkerId(element.name),
        draggable: false,
        infoWindow: InfoWindow(
          //popup info
          title: element.name,
          snippet: element.description + "\n"
                  + "Opening Hours: " + element.openingTime
                  + "Rating: ",
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
        position: LatLng(latitude, longitude),
      );
    }).toList();

    return markers;
  }

  Future<List<newPub>> fetchPubs() async {

    final response = await http.get(Uri.http('localhost:8080', '/bars'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => newPub.fromJson(data)).toList();

    } else {
      throw Exception('Failed to load pub');
    }
  }
}

