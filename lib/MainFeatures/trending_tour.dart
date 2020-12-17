import 'package:flutter/material.dart';

class TrendingTour extends StatelessWidget {
  static const routeName = 'TrendingTour';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('trending Tour'),
        ),
      ),
    );
  }
}
