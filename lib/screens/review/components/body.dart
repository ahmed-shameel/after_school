import 'package:after_school/components/background_without_logo.dart';
import 'package:after_school/screens/profile/components/user/user.dart';
import 'package:after_school/screens/write_a_review/write_a_review_screen.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_rating_bar.dart';
import '../../pub/components/pub.dart';

class Body extends StatefulWidget {
  final Pub pub;
  User? user;

  Body({Key? key, required this.pub, this.user}) : super(key: key);

  @override
  _BodyState createState() => _BodyState(pub: pub, user: user);
}

class _BodyState extends State<Body> {
  Pub pub;
  User? user;

  _BodyState({required this.pub, this.user});

  //example data
  List filedata = [
    {
      'name': 'Adeleye Ayodeji',
      'pic': 'https://picsum.photos/300/30',
      'message': 'I love to code'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
  ];

  Widget commentField(data) {
    return Column(
      children: [
        Divider(
          color: Colors.white,
        ),
        ...ListTile.divideTiles(color: Colors.white, tiles: [
          for (var i = 0; i < data.length; i++)
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(5, 8, 5, 0),
              leading: GestureDetector(
                onTap: () {
                  // TODO: GO TO USER PROFILE
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      // TODO: user profile picture
                      backgroundImage: NetworkImage(data[i]['pic'] + "$i")),
                ),
              ),
              isThreeLine: true,
              title: Text(
                // TODO: a comment has a message sender
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: // TODO: a comment has a message body
                  Text(data[i]['message']),
            ),
        ]),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      //titleText: '',
      child: SingleChildScrollView(
        child: Column(children: [
          // SizedBox(
          //   height: 100,
          // ),
          CustomRatingBar(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Reviews',
                style: TextStyle(fontSize: 20),
              ),
            ),
            // SizedBox(width: 50,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WriteReviewScreen(pub: pub)));
                  },
                  child: Text(
                    'Write a review.',
                    style: TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                        color: Colors.black),
                  )),
            )
          ]),
          commentField(filedata),

        ]),
      ),
    );
  }
}
