import 'package:first_flutter/providers/groupArgu.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FamousDetail extends StatefulWidget {
  static const routeName = 'famousDetail';

  @override
  _FamousDetailState createState() => _FamousDetailState();
}

class _FamousDetailState extends State<FamousDetail> {
  var id;

  var name;

  List<String> historical;

  List<String> cultural;

  List<String> religious;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final FamousArguments routeArgu = ModalRoute.of(context).settings.arguments;
    //  final famousData = Famous_module.firstWhere((element) => element.id == id);
    id = routeArgu.id;
    name = routeArgu.name;
    historical = routeArgu.historical;
    cultural = routeArgu.cultural;
    religious = routeArgu.religious;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(
            letterSpacing: 1,
            fontSize: 24,
          ),
        ),
        backgroundColor: Color(0xff1D2553),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Text(
                  'HISTORICAL PLACES',
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: deviceSize.width / 1.2,
                  height: historical.length >= 4
                      ? 200
                      : historical.length == 3
                          ? 155
                          : historical.length == 2
                              ? 110
                              : historical.length == 1
                                  ? 70
                                  : 10,
                  decoration: BoxDecoration(
                    color: Color(0xff1D2553),
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: ListView.builder(
                      itemBuilder: (context, index) => Card(
                        color: Colors.yellow[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            historical[index],
                            style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      itemCount: historical.length,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Text(
                  'CULTURAL PLACES',
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: deviceSize.width / 1.2,
                  height: historical.length >= 4
                      ? 200
                      : historical.length == 3
                          ? 155
                          : historical.length == 2
                              ? 110
                              : historical.length == 1
                                  ? 70
                                  : 10,
                  decoration: BoxDecoration(
                    color: Color(0xff1D2553),
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: ListView.builder(
                      itemBuilder: (context, index) => Card(
                        color: Colors.yellow[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            cultural[index],
                            style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      itemCount: cultural.length,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Text(
                  'RELIGIOUS PLACES',
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: deviceSize.width / 1.2,
                  height: historical.length >= 4
                      ? 200
                      : historical.length == 3
                          ? 155
                          : historical.length == 2
                              ? 110
                              : historical.length == 1
                                  ? 70
                                  : 10,
                  decoration: BoxDecoration(
                    color: Color(0xff1D2553),
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: ListView.builder(
                      itemBuilder: (context, index) => Card(
                        color: Colors.yellow[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            religious[index],
                            style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      itemCount: religious.length,
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
