import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'dart:ui';

bool check = false;

class RegistrationScreen extends StatelessWidget {
  static const routeName = 'register';
  static const Color myHexColor = Color(0xff7fff00);
  static const Color backHexColor = Color(0xff2c2c3c);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    var _blankFocus = new FocusNode();
    // final transformConfig = Matrix4.rotationZ(-8 * pi / 180);
    // transformConfig.translate(-10.0);
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/signup4.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,
          //resizeToAvoidBottomPadding: false,
          body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusScope.of(context).requestFocus(_blankFocus);
              //   check = true;
            },
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: deviceSize.width,
                    height: deviceSize.height,
                    margin: EdgeInsets.symmetric(
                      vertical: deviceSize.height * 0.04,
                      horizontal: deviceSize.width * 0.06,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pushNamed('/');
                          },
                          child: Container(
                            width: deviceSize.width * 0.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 23,
                                ),
                                SizedBox(
                                  width: deviceSize.width * 0.02,
                                ),
                                Text(
                                  'Back',
                                  style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.03,
                        ),
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.12,
                        ),
                        Expanded(
                          flex: 3,
                          child: AuthCard(),
                        ),
                      ],
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

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  //final controllerNumber = MaskedTextController(mask: "0000-00 00 000");
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  static const Color buttonHexColor = Color(0xff3345c5);
  static const Color backHexColor = Color(0xff1D2553);
  static const Color fieldHexColor = Color(0xff4a5165);
  final _passwordController = TextEditingController();

  final FocusNode _firstFocus = FocusNode();
  final FocusNode _secondFocus = FocusNode();
  final FocusNode _mailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passFocus = FocusNode();
  final FocusNode _confirmFocus = FocusNode();

  static final RegExp nameRegExp = RegExp(r'^[-a-zA-Z ]*$');
  static final RegExp noRegExp = RegExp('^([0-9])(-|)');
  static final RegExp emailRegExp =
      RegExp('^(([a-zA-Z]+)([a-zA-Z0-9_]*)(.|_))+(\@)([a-zA-Z]+)(\.com)');

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    Navigator.of(context).pushReplacementNamed('mainpage');
  }

  @override
  void dispose() {
    _firstFocus.dispose();
    _secondFocus.dispose();
    _mailFocus.dispose();
    _phoneFocus.dispose();
    _passFocus.dispose();
    _confirmFocus.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Text(
                //   'UserName',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 22,
                //   ),
                // ),
                // SizedBox(
                //   height: deviceSize.height * 0.01,
                // ),
                Container(
                  height: deviceSize.height * 0.11,
                  width: deviceSize.width * 0.75,
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    cursorColor: Colors.pink,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.all(10),
                      fillColor: fieldHexColor,
                      filled: true,
                      counterText: ' ',
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                      ),
                      focusColor: Colors.white,
                      labelText: 'User Name',
                      // hintText: 'Type Here...',
                      // hintStyle: TextStyle(
                      //   color: Colors.white,
                      //   fontSize: 18,
                      //   fontWeight: FontWeight.w300,
                      // ),
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: backHexColor,
                          width: 0.3,
                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 0.3,
                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 0.3,
                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    focusNode: _firstFocus,
                    onFieldSubmitted: (value) {
                      _fieldFocusChange(context, _firstFocus, _secondFocus);
                    },
                    validator: (value) => value.isEmpty
                        ? 'Enter Name'
                        : (nameRegExp.hasMatch(value) ? null : 'InValid Name'),
                    onSaved: (value) {
                      _authData['firstName'] = value;
                    },
                  ),
                ),
                // SizedBox(
                //   height: deviceSize.height * 0.02,
                // ),
                // Text(
                //   'Email',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 22,
                //   ),
                // ),
                // SizedBox(
                //   height: deviceSize.height * 0.01,
                // ),
                Container(
                  height: deviceSize.height * 0.11,
                  width: deviceSize.width * 0.75,
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    cursorColor: Colors.pink,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.all(10),
                      counterText: ' ',
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                      ),
                      focusColor: Colors.white,
                      fillColor: fieldHexColor,
                      filled: true,
                      labelText: 'Email',
                      hintText: 'example@example.com',
                      alignLabelWithHint: true,
                      hintStyle: TextStyle(
                        color: Colors.orange,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 0.3,
                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 0.3,
                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 0.3,
                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    focusNode: _mailFocus,
                    onFieldSubmitted: (value) {
                      _fieldFocusChange(context, _mailFocus, _phoneFocus);
                    },
                    validator: (value) => value.isEmpty
                        ? 'Enter Email'
                        : (emailRegExp.hasMatch(value)
                            ? null
                            : 'Enter Valid Email'),
                    onSaved: (value) {
                      _authData['email'] = value;
                    },
                  ),
                ),
                // SizedBox(
                //   height: deviceSize.height * 0.03,
                // ),
                Container(
                  width: deviceSize.width * 0.75,
                  height: deviceSize.height * 0.11,
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    cursorColor: Colors.pink,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      NumberFormatter(),
                    ],
                    //    controller: controllerNumber,
                    maxLength: 12,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.all(10),
                      fillColor: fieldHexColor,
                      filled: true,
                      counterText: ' ',
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                      ),
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 0.3,
                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: backHexColor,
                          width: 0.3,
                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 0.3,
                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                    ),
                    // obscureText: true,
                    //controller: _passwordController,
                    textInputAction: TextInputAction.next,
                    focusNode: _phoneFocus,
                    onFieldSubmitted: (value) {
                      _fieldFocusChange(context, _phoneFocus, _passFocus);
                    },
                    validator: (value) => value.isEmpty
                        ? 'Enter Phone Number'
                        : (noRegExp.hasMatch(value)
                                    ? null
                                    : 'Enter Valid Number') ??
                                value.length != 12
                            ? 'Enter Complete Number'
                            : null,
                    onSaved: (value) {
                      _authData['phone'] = value;
                    },
                  ),
                ),
                // SizedBox(
                //   height: deviceSize.height * 0.02,
                // ),
                Container(
                  height: deviceSize.height * 0.11,
                  width: deviceSize.width * 0.75,
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    cursorColor: Colors.pink,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.all(10),
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                      ),
                      counterText: ' ',
                      labelText: 'Password',
                      fillColor: fieldHexColor,
                      filled: true,
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 0.3,
                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: backHexColor,
                          width: 0.3,
                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 0.3,
                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                    ),
                    obscureText: true,
                    controller: _passwordController,
                    focusNode: _passFocus,
                    onFieldSubmitted: (value) {
                      _fieldFocusChange(context, _passFocus, _confirmFocus);
                    },
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Password';
                      } else if (value.length < 5) {
                        return 'Password is too short!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _authData['password'] = value;
                    },
                  ),
                ),
                // SizedBox(
                //   height: deviceSize.height * 0.03,
                // ),

                Container(
                  height: deviceSize.height * 0.11,
                  width: deviceSize.width * 0.75,
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    cursorColor: Colors.pink,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.all(10),
                      counterText: ' ',
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                      ),
                      labelText: 'Confirm Password',
                      fillColor: fieldHexColor,
                      filled: true,
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 0.3,
                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: backHexColor,
                          width: 0.3,
                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 0.3,
                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                    ),
                    focusNode: _confirmFocus,
                    onFieldSubmitted: (value) {
                      _confirmFocus.unfocus();
                      _submit();
                    },
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter confirm Password';
                      } else if (value != _passwordController.text) {
                        return 'Password is not match';
                      }

                      return null;
                    },
                    onSaved: (value) {
                      _authData['confirmPass'] = value;
                    },
                  ),
                ),
                // SizedBox(
                //   height: deviceSize.height * 0.04,
                // ),
                Center(
                  child: Container(
                    width: deviceSize.width * 0.34,
                    height: deviceSize.height * 0.072,
                    child: RaisedButton(
                      splashColor: Colors.white,
                      onPressed: () => _submit(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          //  letterSpacing: 4,
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                        ),
                      ),
                      color: buttonHexColor,
                      textColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      print(text.length);
      if (nonZeroIndex <= 4) {
        print("non");
        print(nonZeroIndex);
        if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
          buffer.write('-'); // Add double spaces.
        }
      } else {
        if (nonZeroIndex % 12 == 0 && nonZeroIndex != text.length) {
          buffer.write('-'); // Add double spaces.
        }
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
