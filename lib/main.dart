import 'package:firebase_core/firebase_core.dart';

import 'package:first_flutter/MainFeatures/cost_estimate.dart';
import 'package:first_flutter/MainFeatures/famous_place.dart';
import 'package:first_flutter/MainFeatures/group_tour.dart';
import 'package:first_flutter/MainFeatures/hotel_booking.dart';
import 'package:first_flutter/MainFeatures/pooling_tour.dart';
import 'package:first_flutter/MainFeatures/recommendation.dart';
import 'package:first_flutter/MainFeatures/travel_agent.dart';
import 'package:first_flutter/MainFeatures/trending_tour.dart';

import 'package:first_flutter/SideFeatures/nearBy_Places.dart';
import 'package:first_flutter/SideFeatures/wether.dart';

import 'package:first_flutter/models/createGroup.dart';
import 'package:first_flutter/models/createPool.dart';
import 'package:first_flutter/models/createTravel.dart';
import 'package:first_flutter/models/poolMap.dart';
import './models/groupMap.dart';

import 'package:first_flutter/screens/famousPlace_detail.dart';
import 'package:first_flutter/screens/main_screen.dart';
import 'package:first_flutter/screens/registration.dart';
import 'package:first_flutter/screens/start.dart';

import 'package:flutter/material.dart';
import './screens/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const Color mainColor = Color(0xff7fff00);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StartScreen(),
        routes: {
          WhetherUpdate.routeName: (ctx) => WhetherUpdate(),
          StartScreen.startpage: (ctx) => StartScreen(),
          MainScreen.mainroute: (ctx) => MainScreen(),
          RegistrationScreen.routeName: (ctx) => RegistrationScreen(),
          AuthScreen.routeName: (ctx) => AuthScreen(),
          NearByPlace.routeName: (ctx) => NearByPlace(),
          GroupTour.routeName: (ctx) => GroupTour(),
          PoolingTour.poolroute: (ctx) => PoolingTour(),
          CostEstimate.routeName: (ctx) => CostEstimate(),
          FamousPlace.routeName: (ctx) => FamousPlace(),
          HotelBooking.routeName: (ctx) => HotelBooking(),
          RecommendedTour.routeName: (ctx) => RecommendedTour(),
          TrendingTour.routeName: (ctx) => TrendingTour(),
          TravelAgent.routeName: (ctx) => TravelAgent(),
          GroupMap.routeName: (ctx) => GroupMap(),
          PoolMap.routeName: (ctx) => PoolMap(),
          CreateGroup.routeName: (ctx) => CreateGroup(),
          CreatePool.routeName: (ctx) => CreatePool(),
          CreateTravelTour.routeName: (ctx) => CreateTravelTour(),
          FamousDetail.routeName: (ctx) => FamousDetail(),
        },
      ),
    );
  }
}
