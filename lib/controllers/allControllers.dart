import 'dart:convert';

import 'package:apphibridatrabajos/models/jobs/post.dart';
import 'package:apphibridatrabajos/models/jobs/postActiveJobs.dart';
import 'package:apphibridatrabajos/models/jobs/job.dart';
import 'package:apphibridatrabajos/models/user/user.dart';
import 'package:http/http.dart' as http;
import 'package:sky_engine/_http/http.dart';
import 'dart:async';
import 'dart:io';

import 'methodsApi.dart';

//TODO Agregar tu dirección ip-----
String url = 'http://192.168.0.19:3000/jobs';


User user = User(userId: "5e7ce2971e765b0d83316268");
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


Future<List<Job>> getAllJobs() async {
  final response = await http.get(url+'/getalljobs');
  print(response.body);
  return allPostsFromJson(response.body);
}

Future<Post> getAllJobsPost() async {
  final response = await http.get(url);
  print(response.body);
  return allPostsFromJsonPost(response.body);
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
