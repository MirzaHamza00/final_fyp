import 'package:first_flutter/MainFeatures/pooling_tour.dart';
import 'package:first_flutter/SideFeatures/nearBy_Places.dart';
import 'package:first_flutter/SideFeatures/wether.dart';
import 'package:first_flutter/screens/main_screen.dart';
import 'package:first_flutter/screens/registration.dart';
import 'package:first_flutter/screens/start.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/auth_screen.dart';
import './providers/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const Color mainColor = Color(0xff7fff00);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Auth(),
          ),
        ],
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: MaterialApp(
            title: 'MyShop',
            // theme: ThemeData(
            //   //  primarySwatch: Colors.purple,
            //   primaryColor: Colors.white,
            //   //    accentColor: mainColor,
            //   fontFamily: 'Lato',
            //  ),
            home: StartScreen(),
            routes: {
              WhetherUpdate.routeName: (ctx) => WhetherUpdate(),
              PoolingTour.poolroute: (ctx) => PoolingTour(),
              StartScreen.startpage: (ctx) => StartScreen(),
              MainScreen.mainroute: (ctx) => MainScreen(),
              RegistrationScreen.routeName: (ctx) => RegistrationScreen(),
              AuthScreen.routeName: (ctx) => AuthScreen(),
              NearByPlace.routeName: (ctx) => NearByPlace(),
            },
          ),
        ));
  }
}
