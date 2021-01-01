import 'package:flutter/material.dart';

class MainModule extends StatelessWidget {
  final String id;
  final String title;
  final String imagePath;

  MainModule(this.id, this.title, this.imagePath);

  void selectCategory(BuildContext ctx) {
    if (id == 't1') {
      Navigator.of(ctx).pushNamed('costEstimate');
    } else if (id == 't2') {
      Navigator.of(ctx).pushNamed('famousPlace');
    } else if (id == 't3') {
      Navigator.of(ctx).pushNamed('poolingtour');
    } else if (id == 't4') {
      Navigator.of(ctx).pushNamed('groupTour');
    } else if (id == 't5') {
      Navigator.of(ctx).pushNamed('recommended');
    } else if (id == 't6') {
      Navigator.of(ctx).pushNamed('TrendingTour');
    } else if (id == 't7') {
      Navigator.of(ctx).pushNamed('travelAgent');
    } else {
      Navigator.of(ctx).pushNamed('hotelBooking');
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final deviceOrient = MediaQuery.of(context).orientation;
    return Card(
      elevation: 5,
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: () => selectCategory(context),
        splashColor: Colors.blue[900],
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: deviceOrient != Orientation.landscape ? 40 : 20,
                  height: deviceOrient != Orientation.landscape ? 40 : 20,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: deviceOrient != Orientation.landscape
                      ? deviceSize.height * 0.01
                      : 0,
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, left: 10, right: 8),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: deviceOrient != Orientation.landscape
                            ? deviceSize.width * 0.04
                            : 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
