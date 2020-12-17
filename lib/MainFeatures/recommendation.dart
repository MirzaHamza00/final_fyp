import 'package:flutter/material.dart';

class RecommendedTour extends StatelessWidget {
  static const routeName = 'recommended';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Recommended Tour'),
        ),
      ),
    );
  }
}
