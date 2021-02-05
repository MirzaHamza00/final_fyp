import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';

class WhetherUpdate extends StatefulWidget {
  static const routeName = 'whetherUpdate';
  @override
  _WhetherUpdateState createState() => _WhetherUpdateState();
}

class _WhetherUpdateState extends State<WhetherUpdate> {
  var _blankFocus = new FocusNode();
  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;
  var country;
  var error;
  var check;

  static const Color backHexColor = Color(0xff1D2553);
  //static const Color buttonHexColor = Color(0xff3345c5);
  Widget appBarTitle = new Text("Weather Update");
  Icon actionIcon = new Icon(Icons.search);
  Icon actionIcon1;
  final _searchController = TextEditingController();
  var city;
  Future getWeater() async {
    http.Response response = await http.get(
        'http://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=c5b3f2b5434150f988702a604713f561');

    var results = jsonDecode(response.body);
    setState(() {
      check = response.statusCode;
      if (check != 404) {
        this.temp = results['main']['temp'];
        this.description = results['weather'][0]['description'];
        this.currently = results['weather'][0]['main'];
        this.humidity = results['main']['humidity'];
        this.windSpeed = results['wind']['speed'];
        this.country = results['sys']['country'];
        error = false;
      } else {
        error = true;
      }
      // this.error = results['message'];
    });
  }

  @override
  void initState() {
    //this.getWeater();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(_blankFocus);
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: buildAppBar(context),
          body: city == null
              ? Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          height: 300,
                          child: Image.asset('assets/images/weather.png'),
                        ),
                        Text(
                          'Find Weather Update',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : error == true
                  ? SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 300,
                            height: 300,
                            // margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                            child: Image.asset('assets/images/error4.png'),
                          ),
                          Center(
                            child: Text(
                              'Enter Valid City Name',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : buildWeather(deviceSize),
        ),
      ),
    );
  }

  Column buildWeather(Size deviceSize) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: deviceSize.height / 2.5,
            width: deviceSize.width,
            color: backHexColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 10.0,
                    top: 10.0,
                  ),
                  child: Text(
                    'Current In ' + city.toString() + ' $country',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  temp != null ? temp.toString() + "\u00b0" : 'Loading',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    currently != null ? currently.toString() : 'Loading',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.thermometerHalf,
                    color: backHexColor,
                  ),
                  title: Text("Temperature"),
                  trailing: Text(
                      temp != null ? temp.toString() + "\u00b0" : "Loading"),
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.cloud,
                    color: backHexColor,
                  ),
                  title: Text("Weather"),
                  trailing: Text(
                      description != null ? description.toString() : 'Loading'),
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.sun,
                    color: backHexColor,
                  ),
                  title: Text("Humidity"),
                  trailing:
                      Text(humidity != null ? humidity.toString() : 'Loading'),
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.wind,
                    color: backHexColor,
                  ),
                  title: Text("Wind Speed"),
                  trailing: Text(
                      windSpeed != null ? windSpeed.toString() : 'Loading'),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamed('mainpage');
          }),
      backgroundColor: backHexColor,
      centerTitle: true,
      title: appBarTitle,
      actions: <Widget>[
        if (actionIcon.icon != Icons.search)
          IconButton(
              icon: actionIcon1,
              onPressed: () {
                setState(() {
                  city = _searchController.text.trim();
                  getWeater();
                  _searchController.clear();
                  this.actionIcon = new Icon(Icons.search);
                  this.appBarTitle = new Text("Weather Update");
                });
              }),
        new IconButton(
          icon: actionIcon,
          onPressed: () {
            setState(() {
              if (this.actionIcon.icon == Icons.search) {
                this.actionIcon1 = Icon(
                  Icons.arrow_forward,
                );
                this.actionIcon = new Icon(Icons.close);
                this.appBarTitle = new TextField(
                  textCapitalization: TextCapitalization.words,
                  onSubmitted: (value) {
                    setState(() {
                      city = value.trim();
                      getWeater();
                      _searchController.clear();
                      this.actionIcon = new Icon(Icons.search);
                      this.appBarTitle = new Text("Weather Update");
                    });
                  },
                  inputFormatters: [
                    // ignore: deprecated_member_use
                    WhitelistingTextInputFormatter(RegExp(r'[a-zA-Z ]'))
                  ],
                  controller: _searchController,
                  cursorColor: Colors.deepOrange,
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  decoration: new InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1.0),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.pink, width: 2.0),
                    ),
                    //  prefixIcon: new Icon(Icons.search, color: Colors.white),
                    hintText: "Search...",
                    hintStyle: new TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                );
              } else {
                this.actionIcon = new Icon(Icons.search);
                this.appBarTitle = new Text("Weather Update");
              }
            });
          },
        ),
      ],
    );
  }
}
