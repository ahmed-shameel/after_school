import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'Directions.dart';

class DirectionsRepository{
  static const String _baseUrl = "https://maps.googleapis.com/maps/api/directions/json?";
  final Dio _dio;

  DirectionsRepository({required Dio dio}) : _dio = dio ?? Dio();

  Future<Directions> getDirections ({
    required LatLng origin,
    required LatLng destination,
}) async {
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
        "origin": "${origin.latitude},${origin.longitude}",
        "destination": "${destination.latitude},${destination.longitude}",
        "key": "AIzaSyAyxr-431fdP_LK7iBwrAq7jTDyl1efwXw",
      },
    );
    if(response.statusCode == 200){
      return Directions.fromMap(response.data);
    }
    throw Exception("Something went wrong");
  }
}