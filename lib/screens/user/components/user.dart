import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '../../check-in/components/check-in.dart';
import '../../review/components/review.dart';
import 'package:http/http.dart' as http;

class User {
  final Image profilePhoto;
  final String username;
  final String firstName;
  final String lastName;
  String email;
  String password;
  final String aboutMe;
  List<User>? friends = [];
  List<Review>? reviews = [];
  List<CheckIn>? checkins = [];

  User({
    this.profilePhoto = const Image(
      image: AssetImage('assets/images/unknown_profile_pic.png'),
    ),
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    this.aboutMe = 'No description',
    this.friends,
    this.reviews,
  });


  void addFriend(User user) {
    final httpUri = Uri.http('localhost:8080', '/addfriend', {'limit': '10'});

    Future login() async {
      var res = await http.post(httpUri,
          headers: {"Content-Type": "application/json"},
          body: json.encode({'email': user.email, 'password': user.password}));
      print(res.body);
    }
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      aboutMe: json['profile'],
    );
  }
}

// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import '../../check-in/components/check-in.dart';
// import '../../pub/components/(unused)pub.dart';
// import '../../review/components/review.dart';
// import "package:http/http.dart" as http;
//
// class User {
//   final Image profilePhoto;
//   final String username;
//   final String firstName;
//   final String lastName;
//   String email;
//   String password;
//   String aboutMe;
//   bool checkedIn;
//   List<User>? friends = [];
//   List<Review>? reviews = [];
//   List<CheckIn>? checkins = <CheckIn>[];
//
//   User({
//     this.profilePhoto = const Image(
//       image: AssetImage('assets/images/unknown_profile_pic.png'),
//     ),
//     required this.username,
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//     required this.password,
//     this.friends,
//     this.reviews,
//     this.aboutMe = "",
//     this.checkedIn = false
//   });
//
//   void checkIn(Pub pub) {
//     checkedIn = true;
//     checkins?.add(CheckIn(dateTime: DateTime.now(), pub: pub));
//   }
//
//   void checkOut(){
//     checkedIn = false;
//   }

//
//   Future<bool> addFriend(User user) async {
//     final httpUri =
//     Uri.http('localhost:8080', '/add-friend', {'limit': '10'});
//
//     var res = await http.put(httpUri,
//         headers: {"Content-Type": "application/json"},
//         body: json.encode({
//           "username": username,
//           "friendUsername": user.username,
//         }));
//
//     if (res.statusCode == 200) {
//       return true;
//     } else {
//       throw Exception('Failed to add friend');
//     }
//   }
//
// }
//
