class Point {
  String id;
  double lat;
  double lng;


  Point({this.id, this.lat, this.lng});

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(
        id: json['_id'],
        lat: json['lat'],
        lng: json['lng']
    );
  }


}