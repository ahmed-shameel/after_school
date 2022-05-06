import 'package:after_school/screens/pubs_list/components/pub.dart';
import 'package:flutter/material.dart';
import '../../../components/background_without_logo.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      titleText: 'Pubs',
      child: ListView(
        children: const <Widget>[
          SizedBox(
            height: 100,
          ),
          Pub(
              uniIcon: Image(image: AssetImage("assets/icons/suicon.png")),
              pubName: 'Foo Bar',
              pubInfo: 'Borgarfjordsgatan 6C Kårexpiditionen, 164 40 Kista'),
          Pub(
              uniIcon: Image(image: AssetImage("assets/icons/shicon.png")),
              pubName: 'SöderS Pub',
              pubInfo:
                  '9 Alfred Nobels allé, Huddinge, Stockholms län, 141 52'),
          Pub(
              uniIcon: Image(image: AssetImage("assets/icons/suicon.png")),
              pubName: 'Bojan Crew',
              pubInfo: 'Café Bojan, Frescativägen 14B'),
          Pub(
              uniIcon: Icon(Icons.account_balance_outlined),
              pubName: 'Pub Name',
              pubInfo: 'Pub Information'),
          Pub(
              uniIcon: Icon(Icons.account_balance_outlined),
              pubName: 'Pub Name',
              pubInfo: 'Pub Information'),
          Pub(
              uniIcon: Icon(Icons.account_balance_outlined),
              pubName: 'Pub Name',
              pubInfo: 'Pub Information'),
          Pub(
              uniIcon: Icon(Icons.account_balance_outlined),
              pubName: 'Pub Name',
              pubInfo: 'Pub Information'),
          Pub(
              uniIcon: Icon(Icons.account_balance_outlined),
              pubName: 'Pub Name',
              pubInfo: 'Pub Information'),
          Pub(
              uniIcon: Icon(Icons.account_balance_outlined),
              pubName: 'Pub Name',
              pubInfo: 'Pub Information'),
          Pub(
              uniIcon: Icon(Icons.account_balance_outlined),
              pubName: 'Pub Name',
              pubInfo: 'Pub Information'),Pub(
              uniIcon: Icon(Icons.account_balance_outlined),
              pubName: 'Pub Name',
              pubInfo: 'Pub Information'),Pub(
              uniIcon: Icon(Icons.account_balance_outlined),
              pubName: 'Pub Name',
              pubInfo: 'Pub Information'),
        ],
      ),
    );
  }
}
