
import 'package:apphibridatrabajos/models/jobs/employer.dart';
import 'package:apphibridatrabajos/models/jobs/point.dart';
import 'package:apphibridatrabajos/models/jobs/worker.dart';
import 'package:flutter/cupertino.dart';

class Job {
  String id;
  NetworkImage image;
  String name;
  String publishDate;
  String startedDate;
  String finishedDate;
  String dueDate;
  bool isActive;
  List<Worker> workers;
  String description;
  List<Employer> employer;
  int amountPayment;
  String description_img;
  String category;
  Point point;
  int maxWorkers;
  bool done;


  Job({
    this.id,
    this.image,
    this.name,
    this.publishDate,
    this.startedDate,
    this.finishedDate,
    this.dueDate,
    this.isActive,
    this.workers,
    this.description,
    this.employer,
    this.amountPayment,
    this.description_img,
    this.category,
    this.point,
    this.maxWorkers,
    this.done
  });

  factory Job.fromJson(Map<String, dynamic> json){
    var wlist = json['workers'] as List;
    List<Worker> workersList = wlist.map((i) => Worker.fromJson(i)).toList();

    var elist = json['employer'] as List;
    List<Employer> employerList = elist.map((i) => Employer.fromJson(i)).toList();

    return Job(
        id: json['_id'],
        name: json['name'],
        publishDate: json['publishDate'],
        startedDate: json['startedDate'],
        finishedDate: json['finishedDate'],
        dueDate: json['dueDate'],
        isActive: json['isActive'],
        workers: workersList,
        description: json['description'],
        employer: employerList,
        amountPayment: json['amountPayment'],
        description_img: json['description_img'],
        category: json['category'],
        point: Point.fromJson(json['point']),
        maxWorkers: json['maxWorkers'],
        done: json['done']
    );
  }

  Map<String, dynamic> toJson() => {

    "_id": id,
    "name": name,
    "publishDate": publishDate,
    "startedDate": startedDate,
    "finishedDate": finishedDate,
    "dueDate": dueDate,
    "isActive": isActive,
    "workers": workers,
    "description": description,
    "employer": employer,
    "amountPayment": amountPayment,
    "description_img": description_img,
    "category": category,
    "point": point,
    "maxWorkers": maxWorkers,
    "done": done,


  };
}
