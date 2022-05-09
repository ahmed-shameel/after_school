import 'package:after_school/screens/pub/components/pub.dart';
import 'package:flutter/material.dart';

class University {
  final Widget uniIcon;
  final String uniName;
  final List<Pub> pubs = <Pub>[];

  University({
    required this.uniIcon,
    required this.uniName,
  });
}
