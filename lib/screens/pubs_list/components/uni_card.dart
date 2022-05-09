import 'package:after_school/components/custom_divider.dart';
import 'package:after_school/screens/pubs_list/components/university.dart';
import 'package:flutter/material.dart';

class UniCard extends StatelessWidget {
  final University university;

  const UniCard({
    Key? key,
    required this.university,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Card(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomDivider(
              text: university.uniName,
              textColor: Colors.black,
              dividerColor: Colors.black,
              fontSize: 18,
              dividerThickness: 1,
              icon: university.uniIcon,
            ),
            ...ListTile.divideTiles(
              color: Colors.grey,
              tiles: university.pubs,
            ),
          ],
        ),
      ),
    );
  }
}
