import 'package:after_school/components/background_without_logo.dart';
import 'package:after_school/screens/pub/components/pub.dart';
import 'package:after_school/screens/review/components/review.dart';
import 'package:after_school/screens/user/components/user.dart';
import 'package:after_school/screens/write_a_review/write_a_review_screen.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_rating_bar.dart';
import '../../check-in/components/check-in.dart';
import '../../user/user_screen.dart';

class Body extends StatefulWidget {
  Pub pub;

  Body({
    Key? key,
    required this.pub,
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

  List<Review>? buildReview() {
    //example data
    User john = User(
        username: 'johndoe',
        firstName: 'John',
        lastName: 'Doe',
        aboutMe: 'Hello, my name is John.',
        password: 'pass',
        email: 'email');
    User karen = User(
        username: 'ksmith',
        firstName: 'Karen',
        lastName: 'Smith',
        aboutMe: 'Hello, my name is Karen.',
        password: 'pass',
        email: 'email');
    User amy = User(
        username: 'ksmith',
        firstName: 'Amy',
        lastName: 'Williams',
        aboutMe: 'Hello, my name is Amy.',
        password: 'pass',
        email: 'mail');
    User jasmine = User(
        username: 'jasmine',
        firstName: 'Jasmine',
        lastName: 'Rivera',
        aboutMe: 'Hello, my name is Jasmine',
        password: 'pass',
        email: 'mail');

    Pub bojanCrew = Pub(
        name: 'Bojan Crew',
        openingHours: '',
        coordinates: '',
        address: '',
        description: '',
        requirements: '',
        university: '');
    Pub fooBar = Pub(
        name: 'Foo Bar',
        coordinates: '',
        address: '',
        openingHours: '',
        description: '',
        requirements: '',
        university: '');
    Pub sodersPub = Pub(
        name: 'SöderS Pub',
        description: '',
        address: '',
        coordinates: '',
        openingHours: '',
        university: '',
        requirements: '');

    Review review1 =
        Review(user: john, rate: 1, comment: 'Drinks not good', pub: bojanCrew);
    Review review2 =
        Review(user: john, rate: 4, comment: 'Nice environment', pub: fooBar);
    Review review3 =
        Review(user: john, rate: 3, comment: 'Okay', pub: sodersPub);
    Review review4 =
        Review(user: karen, rate: 5, comment: 'Cheap prices', pub: bojanCrew);
    Review review5 =
        Review(user: karen, rate: 1, comment: 'Awful service', pub: fooBar);
    Review review6 =
        Review(user: amy, rate: 5, comment: 'I love here', pub: bojanCrew);
    Review review7 =
        Review(user: amy, rate: 4, comment: 'People are nice', pub: sodersPub);

    CheckIn checkIn =
        CheckIn(timeCheckedIn: DateTime(2022, 1, 3, 15, 45), pub: bojanCrew);
    CheckIn checkIn2 =
        CheckIn(timeCheckedIn: DateTime(2022, 3, 2, 10, 00), pub: fooBar);
    CheckIn checkIn3 = CheckIn(timeCheckedIn: DateTime.now(), pub: sodersPub);

    john.reviews!.add(review1);
    john.reviews!.add(review2);
    john.reviews!.add(review3);
    karen.reviews!.add(review4);
    karen.reviews!.add(review5);
    amy.reviews!.add(review6);
    amy.reviews!.add(review7);

    john.checkins!.add(checkIn);
    john.checkins!.add(checkIn2);
    john.checkins!.add(checkIn3);

    bojanCrew.reviews?.add(review1);
    bojanCrew.reviews?.add(review4);
    bojanCrew.reviews?.add(review6);

    fooBar.reviews?.add(review2);
    fooBar.reviews?.add(review5);

    sodersPub.reviews?.add(review3);
    sodersPub.reviews?.add(review7);

    john.friends!.add(karen);
    karen.friends!.add(john);
    karen.friends!.add(amy);
    amy.friends!.add(karen);
    jasmine.friends!.add(karen);
    karen.friends!.add(jasmine);
    jasmine.friends!.add(john);
    john.friends!.add(jasmine);

    if (widget.pub.name.toLowerCase() == bojanCrew.name.toLowerCase()) {
//      widget.pub.reviews?.addAll(bojanCrew.reviews);
    } else if (widget.pub.name.toLowerCase() == fooBar.name.toLowerCase()) {
//      widget.pub.reviews?.addAll(fooBar.reviews);
    } else {
//      widget.pub.reviews?.addAll(sodersPub.reviews);
    }

//    return widget.pub.reviews;
  }

  Widget reviewField(List<Review> reviews) {
    return Column(
      children: [
        Divider(
          color: Colors.white,
        ),
        ...ListTile.divideTiles(color: Colors.white, tiles: [
          for (Review review in reviews)
            //for (int i = 0; i < data.length; i++)
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(5, 8, 5, 0),
              leading: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserScreen(
                                user: review.user,
                              )));
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
                      backgroundImage: review.user.profilePhoto.image,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    review.user.firstName,
                    //data[i]['name'],
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
              isThreeLine: true,
              title: CustomRatingBar(
                starSize: 20,
              ),
              subtitle: Text(
                review.comment,
                //data[i]['message']),
              ),
            )
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
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(30, 50),
                  shape: StadiumBorder(),
                  primary: Color(0xFF519580),
                ),
                child: FittedBox(
                  child: Row(children: [
                    Text(
                      'Write a review ',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Icon(
                      Icons.comment_outlined,
                      color: Colors.white,
                    ),
                  ]),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WriteReviewScreen(),
                          settings: RouteSettings(name: 'writeReview')));
                },
              ),
            )
          ]),
          //reviewField(widget.pub.reviews),
          //      reviewField(buildReview()),
          //reviewField(filedata),
        ]),
      ),
    );
  }
}
