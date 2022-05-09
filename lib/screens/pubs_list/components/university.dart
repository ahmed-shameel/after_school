import 'package:flutter/material.dart';
import '../../pub/components/pub_tile.dart';

class University {
  final Widget uniIcon;
  final String uniName;
  final List<PubTile> pubs = <PubTile>[];

  University({
    required this.uniIcon,
    required this.uniName,
  });
}
