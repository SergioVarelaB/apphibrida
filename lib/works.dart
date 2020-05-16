
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '_works/work.dart';

class WorksPage extends StatelessWidget {
  List<Work> worksActive = List<Work>();

  List<Work> worksFinished = List<Work>();

  WorksPage(this.worksActive, this.worksFinished);
  @override
  Widget build(BuildContext context) {

    return Expanded(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[profile, skills,
              TextoTrabajos('Trabajos activos'),
              SizedBox(
              height: 120,
              child: Row(
                children: <Widget>[
                  Expanded(child: WorkList(worksActive))
                ],
              ),
            ),
              TextoTrabajos('Trabajos terminados'),
              SizedBox(
                height: 120,
                child: Row(
                  children: <Widget>[
                    Expanded(child: WorkList(worksFinished))
                  ],
                ),
              ),
            ]
          ),
        )
      );
  }
}

Widget profile = Container(
  padding: const EdgeInsets.only(top: 50),
  color: Colors.grey,
  height: 280,
  child: Column(
    children: <Widget>[
      Container(
        child: Center(
          child: Text(
            'PERFIL',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.only(top: 50, bottom: 20),
        child: CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
        ),
      ),
      Container(
        child: Text(
          'Nombre del bato',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      )
    ],
  ),
);

Widget skills = Container(
    padding: EdgeInsets.only(top: 50, left: 40),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'Habilidades',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                skillItem,
                skillItem,
                skillItem,
                skillItem,
                skillItem
              ],
            ),
          )
        ],
      )),
    ));

Widget skillItem = Container(
    padding: const EdgeInsets.all(5),
    child: ButtonTheme(
      height: 15,
      child: RaisedButton(

        onPressed: () => {debugPrint('click')},
        color: Color(0xffeaf4fd),
        child: Text('skill #',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            )),
      ),
    )
);


class CardWork extends StatelessWidget{
  Work work;

  CardWork(this.work); //Recibe como parámetro un trabajo

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //InkWell se usa para hacer clickeable el Card
    return InkWell(
          //Muestra el "toast bonito abajo" dependiendo el elemento al que se le da click
      onTap: () => Scaffold.of(context).showSnackBar(SnackBar(content: Text(work.titleWork), duration: Duration(milliseconds: 200))),
      child: Card(
        margin: EdgeInsets.only(right: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.black12,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                    height: 80,
                    width: 80,
                    image: NetworkImage(
                        work.image  //la imagen del elemento que se le da click
                    )
                ),
              )
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text(work.titleWork, //el titulo del elemento que se le da click
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.centerRight,
                  child: Text(
                    (work.date), //la fecha del elemento que se le da click
                    style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

}

//Esta clase genera la listview horizontal a partir de la lista
class WorkList extends StatelessWidget{
  List<Work> workList = List<Work>();

  WorkList(this.workList);
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return ListView.builder(
      padding: EdgeInsets.only(left: 40),
      scrollDirection: Axis.horizontal,
        itemCount: workList.length,
        itemBuilder: (BuildContext context, int index){

          return Container(
            child: CardWork(workList.elementAt(index)),
          );
        });
  }


}


class TextoTrabajos extends StatelessWidget{
  String texto;

  TextoTrabajos(this.texto);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 40, left: 40, bottom: 15),
      child: Text(texto),
    );
  }


}