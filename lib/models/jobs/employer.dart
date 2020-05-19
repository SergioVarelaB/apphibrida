class Employer {
  String id;
  int rate;


  Employer({this.id, this.rate});

  factory Employer.fromJson(Map<String, dynamic> json) {
    return Employer(
        id: json['_id'],
        rate: json['rate']
    );
  }


}