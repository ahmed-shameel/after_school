import 'package:after_school/screens/pub/components/pub.dart';
import 'package:flutter/material.dart';
import '../pub_screen.dart';

class PubTile extends StatelessWidget {

  final Pub pub;

  const PubTile(
      {Key? key,
      required this.pub})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PubScreen(pub: pub)));
        },
        tileColor: Colors.white,
        title: Text(pub.pubName),
        subtitle: Text(pub.openingHours),
        isThreeLine: true,
      );
  }
}
