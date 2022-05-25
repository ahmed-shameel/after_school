import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:after_school/screens/event/components/event.dart';
import '../../review/components/review.dart';


class newPub{
  String pubName;
//  String openingHours;
//  bool? open;
//  double? rating;
//  String address;
//  String requirements;
//  String description;
//  String prices;
//  String entry;
//  String coordinates;
//  List<String> images = <String>[];
//  List<Event> events = <Event>[];
//  List<Review> reviews = <Review>[];

  newPub({
    required this.pubName,
//    required this.openingHours,
//    required this.address,
//    required this.coordinates,
//    required this.requirements,
//    required this.description,
//    required this.prices,
//    required this.entry,
  });
 // void setHours(String hours) {
//    openingHours = hours;
//  }

  factory newPub.fromJson(Map<String, dynamic> json) {

    return newPub(

      pubName: json['pubName'],
 //     openingHours: json['openingHours'],
 //     address: json['adress'],
 //     description: json['description'],
 //     coordinates: json['coordinates'],

    );
  }


}
