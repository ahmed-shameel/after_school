import 'package:after_school/components/custom_rating_bar.dart';
import 'package:after_school/components/image_gallery.dart';
import 'package:after_school/screens/pub/components/pub.dart';
import 'package:flutter/material.dart';
import '../../../components/background_without_logo.dart';
import '../../review/review_screen.dart';

class Body extends StatelessWidget {
  final Pub pub;

  Body({Key? key, required this.pub}) : super(key: key);

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
                        leading: Icon(
                          Icons.timer,
                          color: Colors.white,
                        ),
                        title: Text("Opening hours"),
                        subtitle: Text(pub.openingHours),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.pin_drop,
                          color: Colors.white,
                        ),
                        title: Text("Address"),
                        subtitle: Text(pub.address),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.door_front_door,
                          color: Colors.white,
                        ),
                        title: Text("Entry"),
                        subtitle: Text(pub.entry),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.attach_money,
                          color: Colors.white,
                        ),
                        title: Text("Prices"),
                        subtitle: Text(pub.prices),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                ],
              ),
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
                              reviews: pub.reviews,
                            ),
                        settings: RouteSettings(name: 'reviews')),
                  );
                },
                child: Text(
                  'See and write reviews',
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      fontSize: 15),
                )),
            ImageGallery(images: pub.images),
          ],
        ),
      ),
    );
  }
}
