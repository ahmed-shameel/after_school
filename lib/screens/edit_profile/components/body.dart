import 'dart:io';
import 'package:after_school/components/profile_picture.dart';
import 'package:after_school/components/reviews_expansion.dart';
import 'package:after_school/screens/user/components/user.dart';
import 'package:flutter/material.dart';
import '../../../components/background_without_logo.dart';
import '../../pub/components/pub.dart';
import '../../review/components/review.dart';
import 'package:image_picker/image_picker.dart';

class Body extends StatefulWidget {
  User user;
  Body({required this.user});
  @override
  BodyState createState() {
    return BodyState();
  }
}

class BodyState extends State<Body> {
  final ImagePicker _picker = ImagePicker();
  PickedFile? _imageFile;
  @override
  Widget build(BuildContext context) {
    //example data
    Pub bojanCrew = Pub(pubName: 'Bojan Crew');
    Pub fooBar = Pub(pubName: 'Foo Bar');
    Review review1 = Review(
        user: widget.user, rate: 1, comment: 'Drinks not good', pub: bojanCrew);
    Review review2 =
        Review(user: widget.user, rate: 5, comment: 'Awesome', pub: fooBar);
    widget.user.reviews.add(review1);
    widget.user.reviews.add(review2);
    bojanCrew.reviews.add(review1);
    fooBar.reviews.add(review2);

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
                    profilePhoto: _imageFile == null
                        ? widget.user.profilePhoto
                        : Image(image: FileImage(File(_imageFile!.path))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: ((builder) => bottomSheet()),
                          );
                        },
                        child: Text(
                          'Change profile picture',
                          style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                              fontSize: 15),
                        )),
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
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          onPressed: () {
                            //TODO: SAVE PROFILE CHANGES
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Your changes have been saved!"),
                                actions: [
                                  TextButton(
                                    child: Text("OK"),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                            );
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

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            TextButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    setState(() {
      _imageFile = PickedFile(pickedFile!.path); //TODO UPDATE IMAGE
    });
  }
}
