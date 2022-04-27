import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class list_page extends StatelessWidget {
  const list_page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text("StudentPubs"),
    ),
         body: ListView(
              children: const <Widget>[
                Card(
                  child: ListTile(
                    leading: FlutterLogo(size: 72.0),
                    title: Text('Foo Bar'),
                    subtitle: Text(
                        'Borgarfjordsgatan 6C Kårexpiditionen, 164 40 Kista'
                    ),
                    trailing: Icon(Icons.more_vert),
                    isThreeLine: true,           
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: FlutterLogo(size: 72.0),
                    title: Text('SöderS Pub'),
                    subtitle: Text(
                        '9 Alfred Nobels allé, Huddinge, Stockholms län, 141 52'
                    ),
                    trailing: Icon(Icons.more_vert),
                    isThreeLine: true,
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: FlutterLogo(size: 72.0),
                    title: Text('Bojan Crew'),
                    subtitle: Text(
                        'Café Bojan, Frescativägen 14B'
                    ),
                    trailing: Icon(Icons.more_vert),
                    isThreeLine: true,
                  ),
                ),
              ],
            )
        ),
        );




  }

  }

