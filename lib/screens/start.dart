import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  static const startpage = 'startpage';
  static const Color buttonHexColor = Color(0xff3345c5);
  static const Color backHexColor = Color(0xff1D2553);
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final deviceOrient = MediaQuery.of(context).orientation;
    return SafeArea(
      child: deviceSize.height < 200
          ? Container(
              color: Colors.red,
            )
          : Container(
              width: deviceSize.width,
              height: deviceSize.height,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("assets/images/start2.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Padding(
                  padding: EdgeInsets.only(bottom: deviceSize.height * 0.06),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: deviceSize.width * 0.3,
                          height: deviceOrient != Orientation.landscape
                              ? deviceSize.height * 0.07
                              : 50,
                          child: RaisedButton(
                            splashColor: backHexColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0),
                              side: BorderSide(color: buttonHexColor),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pushNamed('login');
                            },
                            color: buttonHexColor,
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                fontSize: 21,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
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
                          width: deviceSize.width * 0.3,
                          height: deviceOrient != Orientation.landscape
                              ? deviceSize.height * 0.07
                              : 50,
                          child: RaisedButton(
                            splashColor: buttonHexColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0),
                              side: BorderSide(
                                color: buttonHexColor,
                                width: 3,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pushNamed('register');
                            },
                            color: backHexColor,
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                                color: buttonHexColor,
                              ),
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
