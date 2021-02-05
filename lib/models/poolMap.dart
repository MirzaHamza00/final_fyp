import 'package:first_flutter/providers/groupArgu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PoolMap extends StatefulWidget {
  static const routeName = 'poolMap';
  @override
  _PoolMapState createState() => _PoolMapState();
}

class _PoolMapState extends State<PoolMap> {
  LatLng _latLon;
  List<Marker> _marker = [];
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    _latLon = LatLng(args.latitude, args.longitude);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Color(0xff1D2553),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('poolingTour');
              }),
          title: Text(
            args.dest,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(
              args.latitude,
              args.longitude,
            ),
            zoom: 10,
          ),
          onMapCreated: (controller) {
            setState(() {
              _marker.add(
                Marker(
                  position: LatLng(
                    _latLon.latitude,
                    _latLon.longitude,
                  ),
                  markerId: MarkerId(
                    _latLon.toString(),
                  ),
                ),
              );
            });
          },
          onTap: _handleTap,
          markers: Set.from(_marker),
          // mapType: MapType.hybrid,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(18.0),
          child: FloatingActionButton(
            backgroundColor: Color(0xff1D2553),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('poolingTour');
            },
            child: FaIcon(
              FontAwesomeIcons.arrowRight,
            ),
          ),
        ),
      ),
    );
  }

  _handleTap(LatLng tapPosition) {
    setState(() {
      //  _marker = [];
      _marker.add(
        Marker(
          markerId: MarkerId(
            tapPosition.toString(),
          ),
          position: tapPosition,
        ),
      );
    });
  }
}
