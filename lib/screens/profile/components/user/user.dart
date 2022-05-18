import 'package:flutter/cupertino.dart';

import '../../../review/components/review.dart';

class User{
  final Image profilePhoto;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String aboutMe;
  List<User> friends = <User>[];
  List<Review> reviews = <Review>[];

  User({
    this.profilePhoto = const Image(image:AssetImage('assets/images/unknown_profile_pic.png'),),
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    this.aboutMe = 'No description',
  });
}

