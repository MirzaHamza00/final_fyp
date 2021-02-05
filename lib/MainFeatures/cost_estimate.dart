import 'package:first_flutter/models/costMap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CostEstimate extends StatefulWidget {
  static const routeName = 'costEstimate';

  static final RegExp nameRegExp = RegExp(r'^[-a-zA-Z ]*$');

  @override
  _CostEstimateState createState() => _CostEstimateState();
}

class _CostEstimateState extends State<CostEstimate> {
  var _blankFocus = new FocusNode();

  Color backHexColor = Color(0xff1D2553);

  TextEditingController _startAddress = TextEditingController();

  TextEditingController _destinationAddress = TextEditingController();

  var _imagePreview;
  var check = true;
  _getLocation(String source, String dest) async {
    if (source != null) {
      final staticMap = LocationHepler.previewImage(source, dest);
      setState(() {
        _imagePreview = staticMap;
      });
    }
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
          appBar: AppBar(
            title: Text(
              'Cost Estimation',
              style: TextStyle(
                // fontFamily: 'appbar',
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            backgroundColor: backHexColor,
          ),
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
                            height: deviceSize.height * 0.099,
                            // width: double.infinity,
                            child: TextFormField(
                              onChanged: (f) {
                                setState(() {
                                  check = false;
                                });
                              },
                              textCapitalization: TextCapitalization.words,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              cursorColor: Colors.pink,
                              controller: _startAddress,
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
                                  : (CostEstimate.nameRegExp.hasMatch(value)
                                      ? null
                                      : 'InValid Source'),
                            ),
                          ),
                          SizedBox(
                            height: deviceSize.height * 0.006,
                          ),
                          Container(
                            height: deviceSize.height * 0.099,
                            child: TextFormField(
                              onEditingComplete: () {
                                if (check == true)
                                  _getLocation(_startAddress.text,
                                      _destinationAddress.text);
                                FocusScope.of(context)
                                    .requestFocus(_blankFocus);
                              },
                              textCapitalization: TextCapitalization.words,
                              controller: _destinationAddress,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              cursorColor: Colors.pink,
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
                                  : (CostEstimate.nameRegExp.hasMatch(value)
                                      ? null
                                      : 'InValid Destination'),
                            ),
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
                              : Stack(
                                  children: [
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
                                  ],
                                ),
                          SizedBox(
                            height: deviceSize.height * 0.02,
                          ),
                          Center(
                            child: Container(
                              width: 200,
                              height: deviceSize.height * 0.07,
                              child: RaisedButton(
                                onPressed: () {},
                                color: Colors.grey,
                                child: Text(
                                  'Select Hotel',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: deviceSize.height * 0.02,
                          ),
                          Center(
                            child: Container(
                              width: 200,
                              child: TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                textCapitalization: TextCapitalization.words,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                cursorColor: Colors.pink,
                                decoration: InputDecoration(
                                  contentPadding: new EdgeInsets.all(10),
                                  fillColor: Colors.black38,
                                  filled: true,
                                  //  counterText: ' ',
                                  errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontSize: 17,
                                  ),
                                  //focusColor: backHexColor,
                                  //  labelText: 'Email',
                                  labelText: 'Enter NO of Days',
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
                                keyboardType: TextInputType.number,
                                // validator: (value) => value.isEmpty
                                //     ? 'Enter Source'
                                //     : (nameRegExp.hasMatch(value)
                                //         ? null
                                //         : 'InValid Source'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: deviceSize.height * 0.01,
                          ),
                          Center(
                            child: Container(
                              width: 200,
                              child: TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                textCapitalization: TextCapitalization.words,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                cursorColor: Colors.pink,
                                decoration: InputDecoration(
                                  contentPadding: new EdgeInsets.all(10),
                                  fillColor: Colors.black38,
                                  filled: true,
                                  // counterText: ' ',
                                  errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontSize: 17,
                                  ),
                                  //focusColor: backHexColor,
                                  //  labelText: 'Email',
                                  labelText: 'Enter NO of Nights',
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
                                keyboardType: TextInputType.number,
                                // validator: (value) => value.isEmpty
                                //     ? 'Enter Source'
                                //     : (nameRegExp.hasMatch(value)
                                //         ? null
                                //         : 'InValid Source'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0, top: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RaisedButton(
                                  onPressed: () {
                                    // _submit();
                                  },
                                  textColor: Colors.white,
                                  color: Colors.transparent,
                                  padding: EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(18.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: Colors.blue[900],
                                    ),
                                    padding: const EdgeInsets.fromLTRB(
                                        24, 12, 24, 12),
                                    child: const Text(
                                      'Calculate',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                Text(
                                  'E.g 50,000',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                RaisedButton(
                                  onPressed: () {
                                    //    _submit();
                                  },
                                  textColor: Colors.white,
                                  color: Colors.transparent,
                                  padding: EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(18.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: Colors.green[700],
                                    ),
                                    padding: const EdgeInsets.fromLTRB(
                                        24, 12, 24, 12),
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
                                    borderRadius:
                                        new BorderRadius.circular(18.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: Colors.red[900],
                                    ),
                                    padding: const EdgeInsets.fromLTRB(
                                        24, 12, 24, 12),
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
