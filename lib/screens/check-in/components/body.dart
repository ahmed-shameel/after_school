import 'package:after_school/components/background_without_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../pub/components/pub.dart';

class Body extends StatefulWidget {
  Pub pub;

  Body({Key? key, required this.pub}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Background(
        child: SingleChildScrollView(
            child: Column(
      children: [
        Text('Check in to ' + widget.pub.name,
            style: TextStyle(fontSize: 20)),
        SizedBox(
          height: 40,
        ),
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(20, 50),
              //shape: StadiumBorder(),
              primary: Color(0xFF519580),
            ),
            child: FittedBox(
              child: Row(children: [
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
            onPressed: () => showDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) => AlertDialog(
                      // TODO: what happens if the person is not close to the bar?
                      title: Text(
                          'You are now checked in at ' + widget.pub.name),
                      actions: [
                        TextButton(
                          child: Text("Ok"),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    )),
          ),
        )
      ],
    )));
  }
}
