import 'package:first_flutter/screens/contact.dart';
import 'package:first_flutter/screens/main_page.dart';
import 'package:first_flutter/screens/profile.dart';
import 'package:first_flutter/screens/saved_tour.dart';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static const mainroute = 'mainpage';
  static const Color buttonHexColor = Color(0xff3345c5);
  static const Color backHexColor = Color(0xff1D2553);
  static const Color fieldHexColor = Color(0xff4a5165);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedPage = 1;
  final _pageOptions = [SavedTour(), MainPage(), ContactAdmin(), UserProfile()];
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final deviceOrient = MediaQuery.of(context).orientation;
    return SafeArea(
      child: Scaffold(
        body: _pageOptions[selectedPage],
        bottomNavigationBar: ConvexAppBar(
          curveSize: deviceSize.height * 0.1,
          height: deviceOrient != Orientation.landscape
              ? deviceSize.height * 0.065
              : 40,
          backgroundColor: Colors.blue[900],
          style: TabStyle.flip,
          items: [
            TabItem(icon: Icons.storage, title: 'Saved Tour'),
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.local_post_office, title: 'Contact'),
            TabItem(icon: Icons.person, title: 'Profile'),
          ],
          initialActiveIndex: currentIndex, //optional, default as 0
          onTap: (int i) {
            setState(() {
              selectedPage = i;
            });
          },
        ), // This trailing comma makes auto-formatting ),
      ),
    );
  }
}
