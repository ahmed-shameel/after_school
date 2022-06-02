import 'package:after_school/components/custom_rating_bar.dart';
import 'package:after_school/screens/pub/components/pub.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../components/background_without_logo.dart';
import '../../../components/social_icon.dart';
import '../../check-in/check-in_screen.dart';
import '../../review/review_screen.dart';

class Body extends StatelessWidget {
  final Pub pub;

  const Body({Key? key, required this.pub}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(

          children: [
            Card(
              color: Colors.transparent,
              shadowColor: Colors.transparent,
              child: Column(
                children: <Widget>[
                  ...ListTile.divideTiles(
                    color: Colors.white,
                    tiles: [
                      ListTile(
                        leading: const Icon(
                          CupertinoIcons.clock,
                          color: Colors.white,
                        ),
                        title: const Text("Opening hours"),
                        subtitle: Text(pub.openingHours),
                      ),
                      ListTile(
                        leading: const Icon(
                          CupertinoIcons.placemark,
                          color: Colors.white,
                        ),
                        title: const Text("Address"),
                        subtitle: Text(pub.address),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.door_front_door,
                          color: Colors.white,
                        ),
                        title: const Text("Entry"),
             //           subtitle: Text(pub.requirements),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.sports_bar,
                          color: Colors.white,
                        ),
                        title: const Text("Description"),
                        subtitle: Text(pub.description),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // SocialIcon(
                //   iconSrc: "assets/icons/facebook_colored.svg",
                //   press: () {
                //
                //   },
                // ),
                SocialIcon(
                  iconSrc: "assets/icons/facebook_colored.svg",
                  press: () {
                    pub.facebookLink;
                    //TODO: LinkInstagramPage, if insta null go facebook
                  },
                ),
              ],
            ),
            CustomRatingBar(
              text: 'Rating: ',
              starSize: 30,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReviewScreen(
                              pub: pub,
                            ),
                        settings: const RouteSettings(name: 'reviews')),
                  );
                },
                child: const Text(
                  'See and write reviews',
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      fontSize: 15),
                )),
            //          ImageGallery(images: pub.images),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(20, 50),
                //shape: StadiumBorder(),
                primary: const Color(0xFF519580),
              ),
              child: FittedBox(
                child: Row(children: const [
                  Text(
                    'Check-in ',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Icon(
                    CupertinoIcons.check_mark_circled,
                    color: Colors.white,
                  ),
                ]),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CheckInScreen(
                              pub: pub,
                            )));
             },
           ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
