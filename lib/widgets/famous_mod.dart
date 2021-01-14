import 'package:first_flutter/providers/groupArgu.dart';
import 'package:flutter/material.dart';

class FamousMod extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String image;
  final List<String> historical;
  final List<String> cultural;
  final List<String> religious;

  FamousMod(
    this.id,
    this.title,
    this.color,
    this.image,
    this.historical,
    this.cultural,
    this.religious,
  );

  navigatorPlace(
      String id, context, String title, historical, cultural, religious) {
    Navigator.of(context).pushNamed(
      'famousDetail',
      arguments: FamousArguments(id, title, historical, cultural, religious),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final deviceOrient = MediaQuery.of(context).orientation;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.5),
            color.withOpacity(0.9),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          navigatorPlace(id, context, title, historical, cultural, religious);
        },
        splashColor: color,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: deviceOrient != Orientation.landscape ? 80 : 20,
                  height: deviceOrient != Orientation.landscape ? 60 : 20,
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 8,
                    bottom: 8,
                    top: 6,
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Color(0xff233259),
                      fontSize: deviceOrient != Orientation.landscape
                          ? deviceSize.width * 0.045
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
    );
  }
}
