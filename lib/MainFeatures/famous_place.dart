import 'package:flutter/material.dart';

class FamousPlace extends StatelessWidget {
  static const routeName = 'famousPlace';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Famous Place'),
        ),
      ),
    );
  }
}
