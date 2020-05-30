import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'dart:async' show Future;
import 'controllers/allControllers.dart';
import 'models/jobs/job.dart';
import 'models/jobs/post.dart';
import 'models/jobs/postActiveJobs.dart';


Completer<GoogleMapController> _controler = Completer();

class Maps extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new MapsState();
  }
}
class MapsState extends State<Maps>{
  Completer<GoogleMapController> _controler = Completer();
  double lat = 28.635308;
  double long = -106.075614;
  double zoom = 5.0;

  List<Marker> markers = [];


  @override
  void initState() {
    super.initState();
    markers.add(Marker(
      markerId: MarkerId('Barrer'),
      position: LatLng(28.635308, -106.075614),
      infoWindow: InfoWindow(title: 'Barrer'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueGreen,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    double lat = 28.635308;
    double long = -106.0756140;
    double zoom = 5.0;

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

    return Expanded(
      child: Stack(
        children: <Widget>[
          //_builtContainer(),
          // JobList(post: getActiveJobs()),
          _googleMap(context, lat, long),
          Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 110.0,
                child: box(post: nearmeJobs()),
              )),
          _getFAB(),

        ],
      ),
    );

  }
  Widget _getFAB() {
    void _CurrentLocation() async{
      final position  = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      double lat = position.latitude;
      double long = position.longitude;
      _gotoLocation(lat, long);

    }
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22,
          color: Colors.lightBlue),
      backgroundColor: Colors.white70,
      visible: true,
      elevation: 100,
      curve: Curves.bounceIn,
      children: [
        // FAB 1
        SpeedDialChild(
          child: Icon(Icons.location_searching,
            color: Colors.lightBlue,),
          backgroundColor: Colors.white,
          onTap: () {
            _CurrentLocation();
          },
        ),
        // FAB 2
        SpeedDialChild(
          child: Icon(Icons.search),
          backgroundColor: Colors.white,
          onTap: () {
            setState(() {
              //_counter = 0;
            });
          },
        )
      ],
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controler.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long), zoom: 20, tilt: 50.0,
      bearing: 45.0,)));
  }


  Widget _googleMap(BuildContext context, double lat, double long) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child:
      GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
            target: LatLng(lat,long), zoom: 15),
        onMapCreated: (GoogleMapController controller) {
          _controler.complete(controller);
        },
        markers: Set.from(markers),
      ),

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

  Widget box({Future<Post> post}){
    return FutureBuilder<Post>(
      future: post,
      builder: (context,  projectSnap){
        if (projectSnap.connectionState == ConnectionState.done) {
          print("HOLA "+projectSnap.error.toString());
          //print(projectSnap.data.toJson());
          if (projectSnap.hasData) {
            return
              ListView.builder(
                  padding: EdgeInsets.only(left: 40),
                  scrollDirection: Axis.horizontal,
                  itemCount: projectSnap.data.jobs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.all(
                                Radius.circular(12.0) //         <--- border radius here
                            ),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 4.0),
                          height: 90.0,
                          child: lista(projectSnap.data.jobs[index]),
                          //color: Colors.blue,
                        ),
                      );
                  }
              );
          }
          else if(projectSnap.hasError){
            return Container(child: Text('No hay datos'),);
          }
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Future<void> addmarquer(String name, String category, double lat, double long){
    if(category == 'Jardineria'){
      markers.add(
          Marker(
            markerId: MarkerId(name),
            position: LatLng(lat, long),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueGreen,
            ),
          ));
    }else{
      markers.add(
          Marker(
            markerId: MarkerId(name),
            position: LatLng(lat, long),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueRed,
            ),
          ));
    }
  }
  Widget lista(Job job) {
    addmarquer(job.name, job.category,job.point.lat,job.point.lng);
    print(markers.toString());
    return GestureDetector(
      onTap: (){
        _gotoLocation(job.point.lat, job.point.lng);
        print("on tap " + job.name);
      },
      child: new FittedBox(
        child: Material(
            color: Colors.white,
            shadowColor: Colors.transparent,
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
                      image: NetworkImage("https://www.thespruce.com/thmb/0mrzrF6SY9KBEE50Oko26nE2tJI=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/Mansweepingrestaurant-GettyImages-841234272-efe99f4465384a6c808f22c2e431b2c6.jpg"),
                    ),
                  ),),
                Container(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(job.name, job.description, job.amountPayment.toString())
                  ),
                ),
              ],)
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String name, String descr, String amount) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(name,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )),
        ),
        Container(
            child: Text(
              "       Description \n" + descr,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
        SizedBox(height:1.0),
        Container(
            child: Text(
              " \u0024\ " + amount,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }

}