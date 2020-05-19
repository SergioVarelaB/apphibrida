class Worker {
  String id;
  int rate;


  Worker({this.id, this.rate});

  factory Worker.fromJson(Map<String, dynamic> json) {
    return Worker(
      id: json['_id'],
      rate: json['rate']
    );
  }


}