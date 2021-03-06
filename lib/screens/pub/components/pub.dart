import "package:http/http.dart" as http;

import '../../review/components/review.dart';

class Pub {
  String name;
  String openingHours;
  bool? open;
  String description;
  String? coordinates;
  double? rating;
  String requirements;
  String facebookLink;
  String instagramLink;
  String address;
  String university;
  List<dynamic>? reviews = <Review>[];

  Pub({
    required this.name,
    this.openingHours = 'Opening hours unknown.',
    this.open,
    this.description = 'No description.',
    this.coordinates,
    this.rating,
    this.address = 'No address given.',
    required this.university,
    this.reviews,
    required this.requirements,
    required this.facebookLink,
    required this.instagramLink
  });
  // void setHours(String hours) {
//    openingHours = hours;
//  }

  factory Pub.fromJson(Map<String, dynamic> json) {
    return Pub(
      name: json['name'],
      openingHours: json['openingTime'],
      open: json['open'],
      description: json['description'],
      coordinates: json['coordinates'],
      rating: json['rating'],
      address: json['adress'],
      university: json['university'],
      reviews: json['reviews'],
      requirements: json['requirements'],
      facebookLink: 'facebookLink',
      instagramLink: 'instagramLink'
    );
  }

  String get pubName => name;
}
