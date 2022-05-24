import '../../pub/components/pub.dart';

class Event {
  final String title;
  Pub? pub;
  String? address;
  String? time;
  String? entry;
  String? description;
  List<String> images = <String>[];
  Event({
    required this.title,
    this.address = 'No address given',
    this.time = 'No time information given',
    this.entry = 'No entry information given',
    this.description = 'No description given',
  });
}
