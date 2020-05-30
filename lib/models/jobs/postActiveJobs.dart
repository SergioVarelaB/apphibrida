import 'package:apphibridatrabajos/models/jobs/job.dart';

class PostActiveJobs {
  String message;
  List<Job> jobs;

  PostActiveJobs({this.message, this.jobs});

  factory PostActiveJobs.fromJson(Map<String, dynamic> json){

    var post = json['jobs'] as List;
    List<Job> postList = post.map((i) => Job.fromJson(i)).toList();

    return PostActiveJobs(
        message: json['message'],
        jobs: postList
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "jobs": jobs
  };
}