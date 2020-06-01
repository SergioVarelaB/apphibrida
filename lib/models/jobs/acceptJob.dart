
class AcceptJob {
  String userId;
  String jobId;

  AcceptJob({this.userId, this.jobId});

  factory AcceptJob.fromJson(Map<String, dynamic> json){

    return AcceptJob(
        userId: json['userId'],
        jobId: json['jobId'],
    );
  }
  Map<String, dynamic> toJson() => {
    "userId": userId,
    "jobId": jobId,
  };
}