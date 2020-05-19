
import 'dart:convert';

import 'package:apphibridatrabajos/models/jobs/post.dart';
import 'package:apphibridatrabajos/models/jobs/job.dart';

Job postFromJson(String str) {
  final jsonData = json.decode(str);
  return Job.fromJson(jsonData);
}

String postToJson(Job data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}


List<Job> allPostsFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Job>.from(jsonData.map((x) => Job.fromJson(x)));
}

Post allPostsFromJsonPost(String str){
  final jsonData = json.decode(str);
  //Map<String, dynamic> map = json.decode(str);
  //print(data[0]["name"]);
  //print("DATA: " +map.toString());
  print("jsonData->"+jsonData.toString());
  return new Post.fromJson(jsonData);

}

String allPostsToJson(List<Job> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}
