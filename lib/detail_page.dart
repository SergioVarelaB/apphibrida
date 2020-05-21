import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'models/jobs/job.dart';

class DetailPage extends StatelessWidget {
  Job job;

  DetailPage({this.job});

  //TODO Ya trae el job, desde el Navigator
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        //Column
        child: Column(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Image(
                    image: NetworkImage(


                      //TODO Esta imagen es de adorno nada más, cambiar por desription_img (Ver model de Work)
                        'https://www.thespruce.com/thmb/0mrzrF6SY9KBEE50Oko26nE2tJI=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/Mansweepingrestaurant-GettyImages-841234272-efe99f4465384a6c808f22c2e431b2c6.jpg'),

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
              titleSection,
            ]),
            Row(children: <Widget>[
              descriSection,
            ]),
            descriptioSection,
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
      )
  );

  Widget favButton = RawMaterialButton(
    onPressed: () {},
    elevation: 2.0,
    fillColor: Colors.red,
    child: Icon(
      Icons.favorite,
      color: Colors.white,
      size: 35.0,
    ),
    padding: EdgeInsets.all(15.0),
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
    padding: EdgeInsets.all(15.0),
    shape: CircleBorder(),
  );


  Widget titleSection = Container(
    padding: const EdgeInsets.all(20),
    child: Text(
      'BARRER MI CASA',
      softWrap: true,
      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
    ),
  );

  Widget descriSection = Container(
    padding: const EdgeInsets.all(20),
    child: Text(
      'Descripción',
      softWrap: true,
      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
    ),
  );
  Widget descriptioSection = Container(
    padding: const EdgeInsets.all(20),
    child: Text(
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      softWrap: true,
      style: TextStyle(fontSize: 12.0),
    ),
  );
}
