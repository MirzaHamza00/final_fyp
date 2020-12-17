import 'package:flutter/material.dart';

class CostEstimate extends StatelessWidget {
  static const routeName = 'costEstimate';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Cost'),
        ),
      ),
    );
  }
}
