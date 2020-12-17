import 'package:first_flutter/models/app_drawer.dart';
import 'package:first_flutter/models/createGroup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GroupTour extends StatefulWidget {
  static const routeName = 'groupTour';

  @override
  _GroupTourState createState() => _GroupTourState();
}

class _GroupTourState extends State<GroupTour> {
  Color backHexColor = Color(0xff1D2553);
  var _blankFocus = new FocusNode();
  var selectedPage = 0;
  final _pageOptions = [Text('Center'), CreateGroup()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(_blankFocus);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'GROUP TOUR',
              style: TextStyle(
                letterSpacing: 2.5,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            backgroundColor: backHexColor,
            automaticallyImplyLeading: true,
          ),
          drawer: AppDrawer(),
          body: _pageOptions[selectedPage],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: backHexColor,
            mouseCursor: MouseCursor.defer,
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedPage,
            onTap: (int i) {
              setState(() {
                selectedPage = i;
              });
            },
            // fixedColor: Colors.white,
            selectedIconTheme: IconThemeData(
              color: Colors.amber,
            ),
            unselectedIconTheme: IconThemeData(
              color: Colors.white,
            ),
            selectedItemColor: Colors.amber,
            items: [
              BottomNavigationBarItem(
                // ignore: deprecated_member_use
                title: Text(
                  'List',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: selectedPage == 0 ? Colors.amber : Colors.white,
                  ),
                ),
                icon: Icon(
                  Icons.list,
                  size: 20,
                ),
              ),
              BottomNavigationBarItem(
                // ignore: deprecated_member_use
                title: Text(
                  'Create',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: selectedPage == 1 ? Colors.amber : Colors.white,
                  ),
                ),
                icon: Icon(
                  Icons.create,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
