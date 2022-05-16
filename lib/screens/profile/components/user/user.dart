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
    this.username = 'No username',
    this.firstName = 'No firstname',
    this.lastName = 'No lastname',
    this.email = 'No email',
    this.password = 'No password',
    this.aboutMe = 'No description',
  });
}

