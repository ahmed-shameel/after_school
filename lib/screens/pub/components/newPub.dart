import "package:http/http.dart" as http;

import '../../review/components/review.dart';


class newPub{
  String name;
  String? openingTime;
  bool? open;
  String? description;
  String? coordinates;
  double? rating;
  String? address;
  String? university;
  List reviews;

  newPub({
    required this.name,
    this.openingTime,
    this.open,
    this.description,
    this.coordinates,
    this.rating,
    this.address,
    this.university,
    required this.reviews,
  });
 // void setHours(String hours) {
//    openingHours = hours;
//  }

  factory newPub.fromJson(Map<String, dynamic> json) {

    return newPub(

      name: json['name'],
      openingTime: json['openingTime'],
      open: json['open'],
      description: json['description'],
      coordinates: json['coordinates'],
      rating: json['rating'],
      address: json['adress'],
      university: json['university'],
      reviews: json['reviews'],

    );
  }

  String get pubName => name;


}
