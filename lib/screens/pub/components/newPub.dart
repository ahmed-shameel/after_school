import "package:http/http.dart" as http;

import '../../review/components/review.dart';


class newPub{
  String name;
  String? openingHours;
  bool? open;
  String? description;
  String? coordinates;
  double? rating;
  String? address;
  String? university;
//  List<Review>? reviews = <Review>[];

  newPub({
    required this.name,
    this.openingHours,
    this.open,
    this.description,
    this.coordinates,
    this.rating,
    this.address,
    this.university,
//    this.reviews,
  });
 // void setHours(String hours) {
//    openingHours = hours;
//  }

  factory newPub.fromJson(Map<String, dynamic> json) {

    return newPub(

      name: json['name'],
      openingHours: json['openingHours'],
      open: json['open'],
      description: json['description'],
      coordinates: json['coordinates'],
      rating: json['rating'],
      address: json['adress'],
      university: json['university'],
 //     reviews: json['reviews'],





    );
  }


}
