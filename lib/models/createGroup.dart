import 'package:first_flutter/models/location_helper.dart';
import 'package:first_flutter/providers/groupArgu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocode/geocode.dart';
import 'package:intl/intl.dart';

const kGoogleApiKey = "AIzaSyB-Q6pu_qxP9eSxrFxoLn0WK_k4dXVwcHk";

class CreateGroup extends StatefulWidget {
  static const routeName = 'createGroup';
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  static final RegExp nameRegExp = RegExp(r'^[-a-zA-Z ]*$');

  var _blankFocus = new FocusNode();
  Color backHexColor = Color(0xff1D2553);
  DateTime selectedDate = DateTime.now();
  var selectedTime;
  DateTime _dateTime = DateTime.now();
  TextEditingController _controller = TextEditingController();
  var city;
  var check = false;
  var _imagePreview;
  GeoCode geoCode = GeoCode();
  Coordinates cor;

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    Navigator.of(context).pushReplacementNamed('mainpage');
  }

  _getLocation(String city) async {
    final staticMap = LocationHepler.previewImage(city);
    setState(() {
      _imagePreview = staticMap;
    });
    try {
      Coordinates coordinates =
          await geoCode.forwardGeocoding(address: "$city , pakistan");

      setState(() {
        cor = coordinates;
      });
    } catch (e) {}
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    final deviceOrient = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Color(0xff262E5E),
      body: SingleChildScrollView(
        child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding:
                    EdgeInsets.fromLTRB(0, deviceSize.height * 0.015, 0, 0),
                //  color: backHexColor,
                width: deviceSize.width * 0.75,
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: deviceOrient != Orientation.landscape
                            ? deviceSize.height * 0.099
                            : 90,
                        // width: double.infinity,
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          cursorColor: Colors.pink,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FaIcon(
                                FontAwesomeIcons.mapMarkerAlt,
                                color: Colors.grey[600],
                                size: 29,
                              ),
                            ),
                            contentPadding: new EdgeInsets.all(10),
                            fillColor: Colors.black38,
                            filled: true,
                            counterText: ' ',
                            errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 17,
                            ),
                            //focusColor: backHexColor,
                            //  labelText: 'Email',
                            labelText: 'Enter Source',
                            labelStyle: TextStyle(
                              color: Colors.white70,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: backHexColor,
                                width: 0.5,
                              ),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 0.5,
                              ),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: backHexColor,
                                width: 0.5,
                              ),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                          ),
                          // focusNode: _mailFocus,
                          keyboardType: TextInputType.text,
                          validator: (value) => value.isEmpty
                              ? 'Enter Source'
                              : (nameRegExp.hasMatch(value)
                                  ? null
                                  : 'InValid Source'),
                        ),
                      ),
                      // SizedBox(
                      //   height: deviceSize.height * 0.006,
                      // ),

                      Container(
                        height: deviceOrient != Orientation.landscape
                            ? deviceSize.height * 0.099
                            : 90,
                        child: TextFormField(
                          controller: _controller,
                          onEditingComplete: () {
                            setState(() {
                              city = _controller.text;
                            });
                            _getLocation(city);
                            FocusScope.of(context).requestFocus(_blankFocus);
                          },

                          // onFieldSubmitted: _launchMapsUrl(_controller.text),

                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          cursorColor: Colors.pink,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FaIcon(
                                FontAwesomeIcons.mapPin,
                                size: 29,
                                color: Colors.grey[600],
                              ),
                            ),
                            contentPadding: new EdgeInsets.all(10),
                            fillColor: Colors.black38,
                            filled: true,
                            counterText: ' ',
                            errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 17,
                            ),
                            //focusColor: backHexColor,
                            //  labelText: 'Email',
                            labelText: 'Enter Destination',
                            labelStyle: TextStyle(
                              color: Colors.white70,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: backHexColor,
                                width: 0.5,
                              ),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 0.5,
                              ),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: backHexColor,
                                width: 0.5,
                              ),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                          ),
                          // focusNode: _mailFocus,
                          keyboardType: TextInputType.text,
                          validator: (value) => value.isEmpty
                              ? 'Enter Destination'
                              : (nameRegExp.hasMatch(value)
                                  ? null
                                  : 'InValid Destination'),
                        ),
                      ),

                      Row(
                        children: [
                          Text(
                            'TOTAL CAPACITY',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: Container(
                              //   height: deviceSize.height * 0.099,
                              width: 100,
                              child: TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),

                                cursorColor: Colors.pink,
                                decoration: InputDecoration(
                                  contentPadding: new EdgeInsets.all(10),
                                  fillColor: Colors.black38,
                                  filled: true,
                                  counterText: ' ',
                                  errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontSize: 17,
                                  ),
                                  //focusColor: backHexColor,
                                  //  labelText: 'Email',
                                  hintText: 'e.g 50',
                                  hintStyle: TextStyle(
                                    fontSize:
                                        deviceOrient != Orientation.landscape
                                            ? 19
                                            : deviceSize.width * 0.04,
                                    color: Colors.grey,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: backHexColor,
                                      width: 0.5,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 0.5,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: backHexColor,
                                      width: 0.5,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                  ),
                                ),
                                // focusNode: _mailFocus,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                        ],
                      ),
                      _imagePreview == null
                          ? Stack(
                              children: [
                                Container(
                                    width: deviceSize.width * 0.75,
                                    height: 170,
                                    child: Image.asset(
                                      'assets/images/googleMap.jpg',
                                      fit: BoxFit.cover,
                                    )),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Text(
                                    'Map',
                                    style: TextStyle(
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : GestureDetector(
                              onTap: () {
                                // GroupMap(cor.latitude, cor.longitude);
                                Navigator.of(context).pushNamed(
                                  'groupMap',
                                  arguments: ScreenArguments(
                                      cor.latitude, cor.longitude, city),
                                );
                              },
                              child: Stack(children: [
                                Container(
                                  width: deviceSize.width * 0.75,
                                  height: 170,
                                  child: Image.network(
                                    _imagePreview,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Text(
                                    'Map',
                                    style: TextStyle(
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                      SizedBox(
                        height: deviceSize.height * 0.01,
                      ),

                      Row(
                        //    mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            DateFormat.yMMMd().format(selectedDate),
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          FlatButton(
                            onPressed: () =>
                                _selectDate(context), // Refer step 3
                            child: Text(
                              'Select date',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                              ),
                            ),
                            //  color: Colors.greenAccent,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              selectedTime == null
                                  ? _dateTime.hour.toString().padLeft(2, '0') +
                                      ':' +
                                      _dateTime.minute
                                          .toString()
                                          .padLeft(2, '0')
                                  : selectedTime,
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              DatePicker.showTime12hPicker(
                                context,
                                showTitleActions: true,
                                onConfirm: (date) {
                                  setState(() {
                                    selectedTime = DateFormat.jm().format(date);
                                  });
                                },
                                locale: LocaleType.en,
                              );
                            }, // Refer step 3
                            child: Text(
                              'Select Time',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                              ),
                            ),
                            //  color: Colors.greenAccent,
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: deviceSize.height * 0.02,
                      // ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RaisedButton(
                              onPressed: () {
                                _submit();
                              },
                              textColor: Colors.white,
                              color: Colors.transparent,
                              padding: EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.green[700],
                                ),
                                padding:
                                    const EdgeInsets.fromLTRB(24, 12, 24, 12),
                                child: const Text(
                                  'Post',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            RaisedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('mainpage');
                              },
                              textColor: Colors.white,
                              color: Colors.transparent,
                              padding: EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.red[900],
                                ),
                                padding:
                                    const EdgeInsets.fromLTRB(24, 12, 24, 12),
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
