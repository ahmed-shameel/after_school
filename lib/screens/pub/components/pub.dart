import 'package:flutter/material.dart';
import '../pub_screen.dart';

class Pub extends StatelessWidget {

  final String pubName;
  String openingHours;
  String address;
  String requirements;
  String description;
  String prices;

  Pub(
      {Key? key,
      required this.pubName,
      this.openingHours = 'Opening hours unknown.',
      this.address = 'No address given.',
      this.requirements = 'No requirements specified.',
      this.description = 'No description.',
      this.prices = 'No price information given.'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PubScreen(pub: this)));
        },
        tileColor: Colors.white,
        title: Text(pubName),
        subtitle: Text(openingHours),
        isThreeLine: true,
      );
  }
}
