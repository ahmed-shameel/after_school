import 'package:after_school/screens/event/components/event.dart';
import '../../review/components/review.dart';

class Pub {

  String name;
  String openingHours;
  bool? open;
  String description;
  String requirements;
  String coordinates;
  double? rating;
  String address;
  String? university;

  //   final String pubName;
  // String openingHours;
  // bool? open;
  // double? rating;
  // String address;
  // String requirements;
  // String description;
  // String prices;
  // String entry;
  // List<String> images = <String>[];
  // List<Event> events = <Event>[];
   List<dynamic>? reviews;

  Pub({

    required this.name,
    required this.openingHours,
    this.open,
    required this.description,
    required this.coordinates,
    required this.requirements,
    this.rating,
    required this.address,
    this.university,
    this.reviews,

    // required this.pubName,
    // this.openingHours = 'Opening hours unknown.',
    // this.address = 'No address given.',
    // this.requirements = 'No requirements specified.',
    // this.description = 'No description.',
    // this.prices = 'No price information given.',
    // this.entry = 'No entry information given.',
  });

//  void setHours(String hours) {
//   openingHours = hours;
//  }
//}
  factory Pub.fromJson(Map<String, dynamic> json) {

    return Pub(

        name: json['name'],
        openingHours: json['openingTime'],
        open: json['open'],
        description: json['description'],
        coordinates: json['coordinates'],
        requirements: json['requirements'],
        rating: json['rating'],
        address: json['adress'],
        university: json['university'],
        reviews: json['reviews'],
    );
    }




}