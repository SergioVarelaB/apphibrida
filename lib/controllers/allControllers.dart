import 'dart:convert';
import 'dart:ui';

import 'package:apphibridatrabajos/models/jobs/acceptJob.dart';
import 'package:apphibridatrabajos/models/jobs/post.dart';
import 'package:apphibridatrabajos/models/jobs/postActiveJobs.dart';
import 'package:apphibridatrabajos/models/jobs/job.dart';
import 'package:apphibridatrabajos/models/user/user.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'package:apphibridatrabajos/models/jobs/point.dart';
import 'methodsApi.dart';
import 'package:apphibridatrabajos/main.dart';

//TODO Agregar tu dirección ip-----
String url = 'https://super-jobs-api.herokuapp.com/jobs';


User user = getUser();

Future<PostActiveJobs> getActiveJobs() async{

  final response = await http.post('$url'+'/active',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : ''
      },
      body: json.encode(user.toJson())
  );

  print("encode"+json.encode(user.toJson()));
  print("body->"+response.body);
  print("bodydecode->"+PostActiveJobs.fromJson(json.decode(response.body)).toString());
  return PostActiveJobs.fromJson(json.decode(response.body));
}

Future<PostActiveJobs> getTerminatedJobs() async{

  final response = await http.post('$url'+'/finished',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : ''
      },
      body: json.encode(user.toJson())
  );
  print("encode"+json.encode(user.toJson()));
  print("body->"+response.body);
  print("bodydecode->"+PostActiveJobs.fromJson(json.decode(response.body)).toString());
  return PostActiveJobs.fromJson(json.decode(response.body));
}


Future<AcceptJob> acceptJob(String jobId) async{
  AcceptJob acceptJob = AcceptJob(userId: getUser().userId, jobId: jobId);
  final response = await http.post('$url'+'/acept',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : ''
      },
      body: json.encode(acceptJob.toJson())
  );
  print("encode"+json.encode(acceptJob.toJson()));
  print("body->"+response.body);
  print("bodydecode->"+AcceptJob.fromJson(json.decode(response.body)).toString());
  return AcceptJob.fromJson(json.decode(response.body));
}

Future<PostActiveJobs> getAllJobs() async {
    final response = await http.get(url+'/getalljobs');
    print(response.body);
    return PostActiveJobs.fromJson(json.decode(response.body));
}

Future<Post> getAllJobsPost() async {
  final response = await http.get(url);
  print(response.body);
  return allPostsFromJsonPost(response.body);
}


Future<Post> nearmeJobs() async{
  final position  = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  double lat = position.latitude;
  double long = position.longitude;
  print("latitud " + lat.toString());
  print("longitud " + long.toString());
  Point puntito = new Point(lat: lat, lng: long);
  final response = await http.post('$url'+'/nearme',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : ''
      },
      body: json.encode(puntito.toJson())
  );


  print("body parseado nearme-->"+json.encode(puntito.toJson()));
  print("body del puntito  "+ response.body);
  return Post.fromJson(json.decode(response.body));

}

Future<Post> fetchPost() async {
  final response =
  await http.get(url);
  print(response.body);

  if (response.statusCode == 200) {
    // Si el servidor devuelve una repuesta OK, parseamos el JSON
    //print("DATA " json.decode(response.body));
    return Post.fromJson(json.decode(response.body));
  } else {
    // Si esta respuesta no fue OK, lanza un error.
    throw Exception('Failed to load post');
  }
}

Future<Job> getPost() async{
  final response = await http.get('$url/1');
  return postFromJson(response.body);
}

Future<http.Response> createPost(Job job) async{
  final response = await http.post('$url',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : ''
      },
      body: postToJson(job)
  );
  return response;
}