import 'package:after_school/components/search_field.dart';
import 'package:after_school/screens/pubs_list/components/uni_card.dart';
import 'package:after_school/screens/pubs_list/components/university.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../components/background_without_logo.dart';
import '../../pub/components/pub.dart';
import '../../pub/components/pub_tile.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    University su = University(
        uniIcon: Image(image: AssetImage("assets/icons/suicon.png")),
        uniName: 'SU');
    University kth = University(
        uniIcon: Image(image: AssetImage("assets/icons/kthicon.png")),
        uniName: 'KTH');
    University gih = University(
        uniIcon: Image(image: AssetImage("assets/icons/gihicon.png")),
        uniName: 'GIH');
    University ki = University(
        uniIcon: Image(image: AssetImage("assets/icons/kiicon.png")),
        uniName: 'KI');
    University shh = University(
        uniIcon: Image(image: AssetImage("assets/icons/shhicon.png")),
        uniName: 'SHH');
    University sh = University(
        uniIcon: Image(image: AssetImage("assets/icons/shicon.png")),
        uniName: 'SH');

    Pub bojanCrew = Pub(pubName: 'Bojan Crew');
    Pub fooBar = Pub(pubName: 'Foo Bar');
    PubTile pubTileBJ = PubTile(pub: bojanCrew);
    PubTile pubTileFB = PubTile(pub: fooBar);
    su.pubs.add(pubTileBJ);
    su.pubs.add(pubTileFB);
    bojanCrew.images.add('assets/images/logo.png');
    bojanCrew.images.add('assets/images/logo.png');
    fooBar.images.add('assets/images/logo.png');
    fooBar.setHours(
        'Onsdagar 15:45 - Sent och sista fredagen i månaden kl. 15:45 - Sent');

    return Background(
      child: ListView(children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(63, 20, 63, 20),
          child: SearchField(),
        ),
        UniCard(university: su),
        UniCard(university: kth),
        UniCard(university: gih),
        UniCard(university: ki),
        UniCard(university: shh),
        UniCard(university: sh),
      ]),
    );
  }
}
