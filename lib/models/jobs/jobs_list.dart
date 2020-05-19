
import 'package:apphibridatrabajos/models/jobs/job.dart';

class JobsList{
  List<Job> jobs;

  JobsList({
    this.jobs,
  });

  factory JobsList.fromJson(List<dynamic> parsedJson) {

    List<Job> list = new List<Job>();
    list = parsedJson.map((i)=>Job.fromJson(i)).toList();
    return new JobsList(
        jobs: list
    );
  }

}