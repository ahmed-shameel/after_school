import 'package:flutter/material.dart';

class Pub extends StatelessWidget {
  final Widget uniIcon;
  final String pubName;
  final String pubInfo;

  const Pub(
      {Key? key,
      required this.uniIcon,
      required this.pubName,
      required this.pubInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Card(
        child: ListTile(
          leading: uniIcon,
          title: Text(pubName),
          subtitle: Text(pubInfo),
          isThreeLine: true,
        ),
      ),
    );
  }
}
