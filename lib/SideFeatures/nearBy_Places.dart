import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:search_map_place/search_map_place.dart';

class SearchPlace extends StatefulWidget {
  static const routeName = 'searchPlace';

  @override
  _SearchPlaceState createState() => _SearchPlaceState();
}

class _SearchPlaceState extends State<SearchPlace> {
  var check = false;
  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchMapPlaceWidget(
                hasClearButton: true,
                placeType: PlaceType.address,
                placeholder: 'Enter the location',
                apiKey: 'AIzaSyCoH4NvDvgkvAuJyAJFm345MUkC3lojRrY',
                onSelected: (Place place) async {
                  check = true;
                  Geolocation geolocation = await place.geolocation;
                  mapController.animateCamera(
                      CameraUpdate.newLatLng(geolocation.coordinates));
                  mapController.animateCamera(
                      CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.77,
                  child: GoogleMap(
                    onMapCreated: (GoogleMapController googleMapController) {
                      setState(() {
                        mapController = googleMapController;
                      });
                    },
                    initialCameraPosition: CameraPosition(
                        zoom: 15.0, target: LatLng(21.1458, 79.0882)),
                    mapType: MapType.normal,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
