import 'package:flutter/material.dart';

class HotelBooking extends StatelessWidget {
  static const routeName = 'hotelBooking';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Hotel booking'),
        ),
      ),
    );
  }
}
