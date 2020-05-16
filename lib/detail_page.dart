import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
          child:
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image(
                image: NetworkImage(
                    'https://www.thespruce.com/thmb/0mrzrF6SY9KBEE50Oko26nE2tJI=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/Mansweepingrestaurant-GettyImages-841234272-efe99f4465384a6c808f22c2e431b2c6.jpg'),

              ),
              Row(children: <Widget>[
                tagsSection,
                tagsSection,
                tagsSection,
                tagsSection,
                favButton,
              ]),
              Row(children: <Widget>[
                titleSection,
              ]),
              Row(children: <Widget>[
                descriSection,
              ]),
              descriptioSection,
            ],
          ),

        )
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
