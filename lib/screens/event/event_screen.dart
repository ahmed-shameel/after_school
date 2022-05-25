import 'package:after_school/constants.dart';
import 'package:flutter/material.dart';
import '../event/components/body.dart';
import 'components/event.dart';

class EventScreen extends StatelessWidget {
  Event event;

  EventScreen({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //example data
    event = Event(
        title: 'NF KM - mario kart',
        time: '17:00-late',
        address: 'Gröna villan, Svante Arrhenius väg 10114 18 Stockholm',
        entry: 'Member of NF or +1',
        description:
            'Nu är det dags allesammans! NFKM arrangerar en kväll ägnad åt Mario Kart! Ta med era kompisar och visa vad ni går för! Snacks och både alk och alkoholfri dryck kommer även att säljas i baren så att du orkar vara med hela kvällen.');
    event.images.add('assets/images/nfkm.png');
    event.images.add('assets/images/logo.png');

    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: appBarColor,
          elevation: 0,
          leading: GestureDetector(
            child: Icon(
              Icons.keyboard_backspace_sharp,
              color: iconColor,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            event.title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Body(
          event: event,
        ));
  }
}
