

import 'package:apphibridatrabajos/models/jobs/job.dart';

class Post {
  String message;
  int totalJobs;
  List<Job> jobs;

  Post({this.message, this. totalJobs, this.jobs});

  factory Post.fromJson(Map<String, dynamic> json){

    var post = json['jobs'] as List;
    List<Job> postList = post.map((i) => Job.fromJson(i)).toList();

    return Post(
        message: json['message'],
        totalJobs: json['totalJobs'],
        jobs: postList
    );
  }
  Map<String, dynamic> toJson() => {

    "message": message,
    "totalJobs": totalJobs,
    "jobs": jobs
  };
}