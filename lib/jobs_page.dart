
import 'package:apphibridatrabajos/detail_page.dart';
import 'package:apphibridatrabajos/models/jobs/postActiveJobs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'controllers/allControllers.dart';
import 'models/jobs/job.dart';
import 'dart:async' show Future;

class JobsPage extends StatelessWidget {

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
                      Expanded(child: JobList(post: getActiveJobs()))
                    ],
                  ),
                ),
                TextoTrabajos('Trabajos terminados'),
                SizedBox(
                  height: 120,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: JobList(post: getTerminatedJobs(),))
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


class CardJob extends StatelessWidget{
  Job job;

  CardJob(this.job); //Recibe como parámetro un trabajo

  @override
  Widget build(BuildContext context) {

    //InkWell se usa para hacer clickeable el Card
    return InkWell(
          //Va a la nueva página, mandándole el job

      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(job: job))),
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
                  fit: BoxFit.fill,
                    height: 80,
                    width: 80,
                    image: NetworkImage(
                        //work.image  //la imagen del elemento que se le da click
                      job.description_img
                    )
                ),
              )
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text(job.name, //el titulo del elemento que se le da click
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
                    (job.publishDate), //la fecha del elemento que se le da click
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

//Esta clase genera la listview horizontal a partir de la lista que se obtiene desde el post
class JobList extends StatelessWidget{

final Future<PostActiveJobs> post;
JobList({this.post});


  @override
  Widget build(BuildContext context) {

    return FutureBuilder<PostActiveJobs>(
      future: post,
        builder: (context,  projectSnap){
          if (projectSnap.connectionState == ConnectionState.done) {

            print(projectSnap.data.toJson());

            if (projectSnap.hasData) {
              return
                ListView.builder(
                    padding: EdgeInsets.only(left: 40),
                    scrollDirection: Axis.horizontal,
                    itemCount: projectSnap.data.jobs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: CardJob(projectSnap.data.jobs[index]),
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

}


class TextoTrabajos extends StatelessWidget{
  String texto;

  TextoTrabajos(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 40, left: 40, bottom: 15),
      child: Text(texto),
    );
  }

}