import 'package:flutter/material.dart';

bool check = true;
bool lost = false;

class AuthScreen extends StatelessWidget {
  static const routeName = 'login';
  static const Color buttonHexColor = Color(0xff3345c5);
  static const Color backHexColor = Color(0xff1D2553);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    //  final double left = deviceSize.width * 0.03;

    var _blankFocus = new FocusNode();
    // final transformConfig = Matrix4.rotationZ(-8 * pi / 180);
    // transformConfig.translate(-10.0);
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: check
                ? AssetImage("assets/images/signin6.png")
                : AssetImage("assets/images/signintouch1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,
          resizeToAvoidBottomPadding: true,
          body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusScope.of(context).requestFocus(_blankFocus);
              check = true;
              lost = false;
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
                      horizontal: deviceSize.width * 0.1,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pushNamed('startpage');
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
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: AuthCard(),
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
  static final RegExp emailRegExp =
      RegExp('^(([a-zA-Z]+)([a-zA-Z0-9_]*)(.|_))+(\@)([a-zA-Z]+)(\.com)');
  final FocusNode _mailFocus = FocusNode();
  final FocusNode _passFocus = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  static const Color buttonHexColor = Color(0xff3345c5);
  static const Color backHexColor = Color(0xff1D2553);
  static const Color fieldHexColor = Color(0xff4a5165);
  // final _passwordController = TextEditingController();

  bool _passwordVisible = true;

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
    _mailFocus.dispose();
    _passFocus.dispose();
    // _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final deviceOrient = MediaQuery.of(context).orientation;
    //final double top = deviceSize.height * -0.04;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, deviceSize.height * 0.08, 0, 0),
          //  color: backHexColor,
          width: deviceSize.width * 0.75,
          child: Form(
            key: _formKey,
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (lost != true)
                  Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),

                SizedBox(
                  height: deviceSize.height * 0.01,
                ),
                Container(
                  height: deviceOrient != Orientation.landscape
                      ? deviceSize.height * 0.093
                      : 80,
                  child: TextFormField(
                    onTap: () {
                      check = false;
                    },
                    onEditingComplete: () {
                      check = true;
                    },
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    cursorColor: Colors.pink,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.all(10),
                      fillColor: fieldHexColor,
                      filled: true,
                      // prefixIconConstraints:
                      //     BoxConstraints(minWidth: 19, maxHeight: 20),
                      // prefixIcon: Padding(
                      //   padding: EdgeInsets.only(right: 8),
                      //   child: Icon(
                      //     Icons.person_outline,
                      //     color: backHexColor,
                      //   ),
                      // ),
                      counterText: ' ',
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                      ),
                      //focusColor: backHexColor,
                      //  labelText: 'Email',
                      hintText: 'Type Here...',
                      hintStyle: TextStyle(
                        color: Colors.white54,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),

                      focusedBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
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
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: backHexColor,
                          width: 0.5,
                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                    ),
                    focusNode: _mailFocus,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => value.isEmpty
                        ? 'Enter Email'
                        : (emailRegExp.hasMatch(value)
                            ? null
                            : 'Enter Valid Email'),
                    onFieldSubmitted: (term) {
                      //    FocusScope.of(context).requestFocus(_passFocus);
                      _fieldFocusChange(context, _mailFocus, _passFocus);
                    },
                  ),
                ),

                // SizedBox(
                //   height: deviceSize.height * 0.02,
                // ),
                Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: deviceSize.height * 0.01,
                ),
                Container(
                  height: deviceOrient != Orientation.landscape
                      ? deviceSize.height * 0.093
                      : 80,
                  child: TextFormField(
                    onTap: () {
                      check = false;
                      lost = true;
                    },
                    onEditingComplete: () {
                      check = true;
                      lost = true;
                    },
                    focusNode: _passFocus,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    cursorColor: Colors.pink,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        child: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: backHexColor,
                        ),
                      ),
                      contentPadding: new EdgeInsets.all(10),
                      fillColor: fieldHexColor,
                      filled: true,
                      // prefixIconConstraints:
                      //     BoxConstraints(minWidth: 19, maxHeight: 20),
                      // // prefixIcon: Padding(
                      //   padding: EdgeInsets.only(right: 8),
                      //   child: Icon(
                      //     Icons.lock_outline,
                      //     color: backHexColor,
                      //   ),
                      // ),
                      counterText: ' ',
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                      ),
                      //labelText: 'Password',
                      hintText: 'Type Here...',
                      hintStyle: TextStyle(
                        color: Colors.white54,
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
                          color: backHexColor,
                          width: 0.3,
                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (term) {
                      _passFocus.unfocus();
                      _submit();
                    },
                    obscureText: _passwordVisible,
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
                SizedBox(
                  height: deviceSize.height * 0.03,
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Forget Password?',
              style: TextStyle(
                color: Colors.cyan,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              //   width: deviceSize.width * 1,
              height: 40,
              child: RaisedButton(
                splashColor: backHexColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: buttonHexColor),
                ),
                onPressed: () {
                  _submit();
                },
                color: buttonHexColor,
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
  lost = true;
}
