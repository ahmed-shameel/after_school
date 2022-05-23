import 'package:flutter/cupertino.dart';
import '../../review/components/review.dart';

class User {
  final Image profilePhoto;
  final String username;
  final String firstName;
  final String lastName;
  String email;
  String password;
  final String aboutMe;
  List<User> friends = <User>[];
  List<Review> reviews = <Review>[];

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
  });

  void addFriend(User user){
    final httpUri = Uri.http('localhost:8080', '/addfriend', {'limit': '10'});

    User user = User(username: "", firstName: "", lastName: "", email: "", password: "");

    Future login() async{
      var res = await http.post(httpUri,
          headers: {"Content-Type":"application/json"},
          body: json.encode({'email': user.email,'password': user.password}));
      print(res.body);
    }
  }
}
