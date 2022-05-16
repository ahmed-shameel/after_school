import 'package:after_school/components/background_without_logo.dart';
import 'package:after_school/screens/review/components/review.dart';
import 'package:after_school/screens/write_a_review/write_a_review_screen.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_rating_bar.dart';
import '../../profile/profile_screen.dart';

class Body extends StatefulWidget {
  final List<Review> reviews;

  Body({
    Key? key,
    required this.reviews,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //example data
  List filedata = [
    {
      'name': 'Adeleye',
      'pic': 'https://picsum.photos/300/30',
      'message': 'I love to code'
    },
    {
      'name': 'Biggi',
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

  Widget reviewField(data) {
    return Column(
      children: [
        Divider(
          color: Colors.white,
        ),
        ...ListTile.divideTiles(color: Colors.white, tiles: [
          //for (Review review in reviews)
          for (int i = 0; i < data.length; i++)
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(5, 8, 5, 0),
              leading: GestureDetector(
                onTap: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(user: review.user,)));
                },
                child: Column(children: [
                  Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: CircleAvatar(
                        // TODO: user profile picture
                        // backgroundImage: review.user.profilePhoto.image,
                        // backgroundColor: Colors.white,
                        ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    //review.user.firstName + " " + review.user.lastName,
                    data[i]['name'],
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
              isThreeLine: true,
              title: CustomRatingBar(
                starSize: 20,
              ),
              subtitle: Text(
                  //review.comment,
                  data[i]['message']),
            ),
        ]),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(children: [
          CustomRatingBar(
            text: 'Rating: ',
            starSize: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Reviews',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WriteReviewScreen(),
                            settings: RouteSettings(name: 'writeReview')));
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
          reviewField(filedata), //reviewField(reviews),
        ]),
      ),
    );
  }
}
