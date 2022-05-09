import 'package:flutter/material.dart';
import '../../../components/background_without_logo.dart';
import 'pub.dart';

class Body extends StatelessWidget {
  final Pub pub;

  const Body({Key? key, required this.pub}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
        titleText: pub.pubName,
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("openingHours: " + pub.openingHours),
            Text("address: " + pub.address),
            Text("requirements: " + pub.requirements),
            Text("description: " + pub.description),
            Text("prices: " + pub.prices),
          ]),
        ));
  }
}
