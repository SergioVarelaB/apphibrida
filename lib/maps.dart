import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Maps extends StatelessWidget {
  Completer<GoogleMapController> _controler = Completer();
  double zoom = 5.0;
  final String title;
  double lat = 28.635308;
  double long = -106.075614;
  Maps({
    Key key,
    this.title,
  }) : super(key: key);

  void showShortToast() {
    Fluttertoast.showToast(
        msg: "This is",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1);
  }

  void showShortToasts(double lat, double long) {
    Fluttertoast.showToast(
        msg: "" + lat.toString() + " " + long.toString(),
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1);
  }
  void showShortToas(position) {
    Fluttertoast.showToast(
        msg: "" + position.toString(),
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1);
  }
  void _CurrentLocation() async{
    final position  = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    showShortToasts(position.latitude,position.longitude);
    lat = position.latitude;
    long = position.longitude;
    _gotoLocation(lat, long);
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: <Widget>[
          _googleMap(context),
          _builtContainer(),
        ],
      ),
    );
  }
  Widget _builtContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 110.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://www.thespruce.com/thmb/0mrzrF6SY9KBEE50Oko26nE2tJI=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/Mansweepingrestaurant-GettyImages-841234272-efe99f4465384a6c808f22c2e431b2c6.jpg",
                  28.635308, -106.075614, "Barrer poquillo"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://www.thespruce.com/thmb/0mrzrF6SY9KBEE50Oko26nE2tJI=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/Mansweepingrestaurant-GettyImages-841234272-efe99f4465384a6c808f22c2e431b2c6.jpg",
                  40.761421, -73.981667, "Le Bernardin"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://www.thespruce.com/thmb/0mrzrF6SY9KBEE50Oko26nE2tJI=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/Mansweepingrestaurant-GettyImages-841234272-efe99f4465384a6c808f22c2e431b2c6.jpg",
                  40.732128, -73.999619, "Blue Hill"),
            ),
          ],
        ),
      ),
    );
  }
  Widget _googleMap(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
            target: LatLng(lat,long), zoom: 15),
        onMapCreated: (GoogleMapController controller) {
          _controler.complete(controller);
        },
        markers: {
          newyork1Marker,newyork2Marker,newyork3Marker,gramercyMarker,bernardinMarker,blueMarker
        },
      ),
    );
  }
  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controler.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long), zoom: 15, tilt: 50.0,
      bearing: 45.0,)));
  }

  Widget _boxes(String _image, double lat, double long, String restaurantName) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
        showShortToasts(lat, long);
      },
      child: Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 160,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(_image),
                      ),
                    ),),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(restaurantName),
                    ),
                  ),

                ],)
          ),
        ),
      ),
    );
  }

}
Widget myDetailsContainer1(String restaurantName) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
            child: Text(restaurantName,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            )),
      ),
      Container(
          child: Text(
            "       Description \n barrer pero poquillo",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
            ),
          )),
      SizedBox(height:1.0),
      Container(
          child: Text(
            " \u0024\ 100 ",
            style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          )),
    ],
  );
}

Marker gramercyMarker = Marker(
  markerId: MarkerId('Barrer'),
  position: LatLng(28.635308, -106.075614),
  infoWindow: InfoWindow(title: 'Barrer'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);

Marker bernardinMarker = Marker(
  markerId: MarkerId('bernardin'),
  position: LatLng(40.761421, -73.981667),
  infoWindow: InfoWindow(title: 'Le Bernardin'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
Marker blueMarker = Marker(
  markerId: MarkerId('bluehill'),
  position: LatLng(40.732128, -73.999619),
  infoWindow: InfoWindow(title: 'Blue Hill'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);

//New York Marker

Marker newyork1Marker = Marker(
  markerId: MarkerId('newyork1'),
  position: LatLng(40.742451, -74.005959),
  infoWindow: InfoWindow(title: 'Los Tacos'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
Marker newyork2Marker = Marker(
  markerId: MarkerId('newyork2'),
  position: LatLng(40.729640, -73.983510),
  infoWindow: InfoWindow(title: 'Tree Bistro'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);


Marker newyork3Marker = Marker(
  markerId: MarkerId('newyork3'),
  position: LatLng(40.719109, -74.000183),
  infoWindow: InfoWindow(title: 'Le Coucou'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);