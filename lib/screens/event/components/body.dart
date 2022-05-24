import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../components/background_without_logo.dart';
import '../../../components/image_gallery.dart';
import 'event.dart';

class Body extends StatefulWidget {
  Event event;
  Body({Key? key, required this.event}) : super(key: key);

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
          Card(
            color: Colors.transparent,
            shadowColor: Colors.transparent,
            child: Column(
              children: <Widget>[
                ...ListTile.divideTiles(
                  color: Colors.white,
                  tiles: [
                    ListTile(
                      leading: Icon(
                        Icons.event,
                        color: Colors.white,
                      ),
                      title: Text(widget.event.title),
                    ),
                    ListTile(
                      leading: Icon(
                        CupertinoIcons.clock,
                        color: Colors.white,
                      ),
                      title: Text('Time'),
                      subtitle: Text(widget.event.time!),
                    ),
                    ListTile(
                      leading: Icon(
                        CupertinoIcons.placemark,
                        color: Colors.white,
                      ),
                      title: Text("Place"),
                      subtitle: Text(widget.event.address!),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.door_front_door,
                        color: Colors.white,
                      ),
                      title: Text("Entry"),
                      subtitle: Text(widget.event.entry!),
                    ),
                    ListTile(
                      leading: Icon(
                        CupertinoIcons.text_quote,
                        color: Colors.white,
                      ),
                      title: Text("Description"),
                      subtitle: Text(widget.event.description!),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white,
                ),
              ],
            ),
          ),
          ImageGallery(images: widget.event.images),
        ],
      ),
    ));
  }
}
