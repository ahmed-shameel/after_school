import 'package:after_school/components/profile_picture.dart';
import 'package:after_school/components/reviews_expansion.dart';
import 'package:after_school/screens/user/components/user.dart';
import 'package:flutter/material.dart';
import '../../../components/background_without_logo.dart';
import '../../pub/components/pub.dart';
import '../../review/components/review.dart';

class Body extends StatefulWidget {
  User user;
  Body({required this.user});
  @override
  BodyState createState() {
    return BodyState();
  }
}

class BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {

    //example data
    Pub bojanCrew = Pub(pubName: 'Bojan Crew');
    Review review1 = Review(user: widget.user, rate: 1, comment: 'Drinks not good', pub: bojanCrew);
    widget.user.reviews.add(review1);
    bojanCrew.reviews.add(review1);

    return Background(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(50.0),
              child: Column(
                children: [
                  ProfilePic(
                    profilePhoto: widget.user.profilePhoto,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextButton(onPressed: (){
                      //TODO: CHANGE PROFILE PIC
                    }, child: Text('Change profile picture', style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                        fontSize: 15),)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Card(
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          ...ListTile.divideTiles(
                            color: Colors.black,
                            tiles: [
                              ListTile(
                                title: Text("Name"),
                                subtitle: Text(widget.user.firstName +
                                    " " +
                                    widget.user.lastName),
                              ),
                              ListTile(
                                title: Text("About Me"),
                                subtitle: Text(widget.user.aboutMe),
                              ),
                              ReviewsExpansionPanel(user: widget.user),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(20, 50),
                            shape: StadiumBorder(),
                            primary: Color(0xFF519580),
                          ),
                          child: FittedBox(
                            child: Text(
                              'Cancel',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(20, 50),
                            shape: StadiumBorder(),
                            primary: Color(0xFF519580),
                          ),
                          child: FittedBox(
                            child: Text(
                                'Save',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                          ),
                          onPressed: () {
                            //TODO: SAVE PROFILE CHANGES
                          },
                        ),
                      ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
