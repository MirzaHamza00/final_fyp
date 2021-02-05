import 'package:first_flutter/famous_data.dart';
import 'package:first_flutter/models/app_drawer.dart';
import 'package:first_flutter/screens/main_page.dart';
import 'package:first_flutter/widgets/famous_mod.dart';
import 'package:flutter/material.dart';

class FamousPlace extends StatefulWidget {
  static const routeName = 'famousPlace';

  @override
  _FamousPlaceState createState() => _FamousPlaceState();
}

class _FamousPlaceState extends State<FamousPlace> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff1D2551),
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: deviceSize.width * 0.1),
          child: Text(
            'Famous Places',
            style: TextStyle(
              fontSize: 24,
              letterSpacing: 1,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w800,
              //   fontFamily: 'appbar'
            ),
          ),
        ),
        backgroundColor: MainPage.backHexColor,
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          buildGridView(context),
        ],
      ),
    ));
  }
}

Expanded buildGridView(context) {
  return Expanded(
    child: Container(
      width: MediaQuery.of(context).size.width * 0.95,
      padding: EdgeInsets.only(top: 12.0),
      child: GridView(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 25,
        ),
        children: Famous_module.map(
          (catData) => FamousMod(
            catData.id,
            catData.title,
            catData.color,
            catData.image,
            catData.historical,
            catData.cultural,
            catData.religous,
            catData.pics,
          ),
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio:
              MediaQuery.of(context).orientation != Orientation.landscape
                  ? 1.33
                  : 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 18,
        ),
      ),
    ),
  );
}
