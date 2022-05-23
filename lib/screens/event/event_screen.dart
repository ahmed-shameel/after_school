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
