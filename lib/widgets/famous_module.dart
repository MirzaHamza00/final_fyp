import 'package:flutter/material.dart';

class Famous {
  final String id;
  final String title;
  final Color color;
  final String image;
  final List<String> historical;
  final List<String> cultural;
  final List<String> religous;
  const Famous({
    @required this.id,
    @required this.title,
    @required this.color,
    @required this.image,
    @required this.historical,
    @required this.cultural,
    @required this.religous,
  });
}
