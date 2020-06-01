import 'dart:core';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'dart:async' show Future;
import 'controllers/allControllers.dart';
import 'models/jobs/job.dart';
import 'models/jobs/post.dart';
import 'package:http/http.dart' as http;
import 'Dart:ui' as ui;
import 'detail_page.dart';

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
}


class Maps extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new MapsState();
  }
}
class MapsState extends State<Maps>{

  Completer<GoogleMapController> _controler = Completer();

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controler.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long), zoom: 20, tilt: 50.0,
      bearing: 45.0,)));
  }

  double lat = 28.635308;
  double long = -106.075614;
  double zoom = 5.0;
  Set<Marker> markers = Set();

  List<Job> jobs = List();

  BitmapDescriptor pinLocationIcon;
  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    double lat = 28.635308;
    double long = -106.0756140;
    double zoom = 5.0;


    return Expanded(
      child: Stack(
        children: <Widget>[
          _googleMap(context, lat, long),
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



  Widget _googleMap(BuildContext context, double lat, double long) {
    return
        Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: list(nearmeJobs())
        );
  }

  Widget list(Future<Post> post){
    return FutureBuilder<Post>(
      future: post,
      builder: (context,  projectSnap){
        if (projectSnap.connectionState == ConnectionState.done) {

          if (projectSnap.hasData) {

            jobs = projectSnap.data.jobs;
            _createMarkers();
            return
              Stack(
                children: <Widget>[
              GoogleMap(
              mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                    target: LatLng(lat,long), zoom: 15),
                onMapCreated: (GoogleMapController controller) {
                  _controler.complete(controller);
                },
                markers: markers,
              ),

                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      height: 110.0,
                      child: box(),
                    ),
                  ),
                ],
              );
            //_createMarkers();



            print("Se ejecutó método _createMarkers-->"+jobs.toString());

          }
          else{
            return Container(child: Text('Revisa tu conexión'),);
          }
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }


  Widget box() {
    if(jobs.length>0) {
      return
        ListView.builder(
            padding: EdgeInsets.only(left: 40),
            scrollDirection: Axis.horizontal,
            itemCount: jobs.length,
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
                          Radius.circular(
                              12.0) //         <--- border radius here
                      ),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    height: 90.0,
                    child: lista(jobs[index]),
                    //color: Colors.blue,
                  ),
                );
            }
        );
    }
    else{
      return
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black12,
                width: 1.0,
              ),
              borderRadius: BorderRadius.all(
                  Radius.circular(
                      12.0) //         <--- border radius here
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            height: 90.0,
            child: Center(
              child: Text('No hay trabajos disponibles'),
            ),
            //color: Colors.blue,
          ),
        );
    }
  }


 void  _createMarkers() {

   Set<Marker> newMarkers = Set();

    for(int i=0; i<jobs.length; i++){

      BitmapDescriptor bitmap = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan) ;

      switch(jobs[i].category){
        case 'Pintura':
          bitmap = BitmapDescriptor.fromAsset('assets/images/paint.png');
          break;
        case 'Carros':
          bitmap = BitmapDescriptor.fromAsset('assets/images/car.png');
          break;
        case 'Barrer':
          bitmap = BitmapDescriptor.fromAsset('assets/images/sweeping.png');
          break;
        case 'Construcción':
          bitmap = BitmapDescriptor.fromAsset('assets/images/builder.png');
          break;
        case 'Herrería':
          bitmap = BitmapDescriptor.fromAsset('assets/images/blacksmith.png');
          break;
        case 'Trapear':
          bitmap = BitmapDescriptor.fromAsset('assets/images/mop.png');
          break;
        case 'Baño de perro':
          bitmap = BitmapDescriptor.fromAsset('assets/images/shower_dog.png');
          break;
      }

      print("jobH-->"+jobs[i].toJson().toString());
      int counter=0;
      newMarkers.add(
          Marker(
              markerId: MarkerId(jobs[i].name),
              position: LatLng(jobs[i].point.lat, jobs[i].point.lng),
              icon:  bitmap,
              infoWindow: InfoWindow(title: jobs[i].name, onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailPage(counter: counter++,job: jobs[i])))),
          ));
    }


    markers=newMarkers;
    print("MarkersList-->"+markers.toString());

    ListView.builder(
        padding: EdgeInsets.only(left: 40),
        scrollDirection: Axis.horizontal,
        itemCount: jobs.length,
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
                      Radius.circular(
                          12.0) //         <--- border radius here
                  ),
                ),
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                height: 90.0,
                child: lista(jobs[index]),
                //color: Colors.blue,
              ),
            );
        }
    );
  }


Widget lista(Job job) {
  print("ListaJob-->"+job.toString());
  print("Markers Widget  lista-->"+markers.toString());
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
                    image: NetworkImage(job.description_img),
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

    return Container(
      width: 320,
      child:Column(

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
                  textAlign: TextAlign.center,
                ),

            ),
          ),
          Container(
              width: 250,
              child: Text(
                "Descripción \n" + descr,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              )),
          SizedBox(height:1.0,
            child: Text(
              " \u0024\ " + amount,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      )
    );
  }
}