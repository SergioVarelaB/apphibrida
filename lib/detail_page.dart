import 'dart:async';

import 'package:apphibridatrabajos/controllers/allControllers.dart';
import 'package:apphibridatrabajos/main.dart';
import 'package:apphibridatrabajos/models/jobs/acceptJob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'models/jobs/job.dart';
import 'models/jobs/worker.dart';

class DetailPage extends StatelessWidget {
  Job job;
  int counter;

  DetailPage({this.counter, this.job});

  BuildContext buildContext;

  //TODO Ya trae el job, desde el Navigator
  @override
  Widget build(BuildContext context) {
    buildContext = context;
    return Scaffold(
      body: SingleChildScrollView(
        //Column
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Image(
                    image: NetworkImage(job.description_img),
                  ),
                  Positioned(
                    right: 2,
                    bottom: 2,
                    child: favButton,
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: shareButton,
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  tagItem,
                  tagItem,
                  tagItem,
                  tagItem,
                  tagItem,
                ],
              ),
            ),
            Row(children: <Widget>[
              titleSection(),
            ]),
            Container(
              child: Text("Pago: " + job.amountPayment.toString()),
            ),
            Container(
              child: Text("Trabajadores máximos: " + job.maxWorkers.toString()),
            ),
            Container(
              child: Text(
                  "Trabajadores actuales: " + job.workers.length.toString()),
            ),
            Row(children: <Widget>[
              descriSection(),
            ]),
            descriptioSection(),
            ButtonAccept(job: job, counter: counter)
          ],
        ),
      ),
    );
  }

  Widget tagsSection = Container(
    padding: const EdgeInsets.all(15),
    child: Text(
      'tag 1',
      softWrap: true,
      style: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
        color: Colors.cyan,
        backgroundColor: Colors.black12,
      ),
    ),
  );

  Widget tagItem = Container(
      padding: const EdgeInsets.all(3),
      child: ButtonTheme(
        height: 15,
        child: RaisedButton(
          onPressed: () => {debugPrint('click')},
          color: Color(0xffeaf4fd),
          child: Text('tag',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              )),
        ),
      ));

  Widget favButton = RawMaterialButton(
    onPressed: () {},
    elevation: 2.0,
    fillColor: Colors.red,
    child: Icon(
      Icons.favorite,
      color: Colors.white,
      size: 35.0,
    ),
    padding: EdgeInsets.all(10.0),
    shape: CircleBorder(),
  );

  Widget shareButton = RawMaterialButton(
    onPressed: () {},
    elevation: 2.0,
    child: Icon(
      Icons.share,
      color: Colors.white,
      size: 35.0,
    ),
    padding: EdgeInsets.all(10.0),
    shape: CircleBorder(),
  );

  Widget titleSection() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        job.name,
        softWrap: true,
        style: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }

  Widget descriSection() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        'Descripción',
        softWrap: true,
        style: TextStyle(fontSize: 15.0, color: Colors.black54),
      ),
    );
  }

  Widget descriptioSection() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        job.description,
        softWrap: true,
        style: TextStyle(fontSize: 12.0, color: Colors.black54),
      ),
    );
  }
}

class ButtonAccept extends StatelessWidget {
  Job job;
  int counter;

  ButtonAccept({this.counter, this.job});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if (job.done != true) {
      bool isAvaliableForMe = true;
      for (int i = 0; i < job.workers.length; i++) {
        if (job.workers[i].id == getUser().userId) {
          isAvaliableForMe = false;
          counter++;
        }
      }
      if (isAvaliableForMe && counter == 0) {
        return FlatButton(
          color: Colors.cyan,
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(10.0),
          splashColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          onPressed: () {
            print("boton presionado");
            acceptJob(job.id);
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Aceptaste el trabajo: ' + job.name),
              duration: Duration(milliseconds: 900),
            ));
            Timer(Duration(milliseconds: 1000), () {
              Navigator.pop(context, 'Acabado');
            });
          },
          child: Text(
            "Aplicar ahora",
            style: TextStyle(fontSize: 15.0),
          ),
        );
      } else {
        return FlatButton(
          color: Colors.cyan,
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(10.0),
          splashColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          onPressed: () {},
          child: Text(
            "Ver trabajo",
            style: TextStyle(fontSize: 15.0),
          ),
        );
      }
    } else {
      return FlatButton(
        color: Colors.cyan,
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(10.0),
        splashColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        onPressed: () {},
        child: Text(
          "Ver trabajo",
          style: TextStyle(fontSize: 15.0),
        ),
      );
    }
  }
}
