

class Role {

  String name;

  Role({this.name});

  factory Role.fromJson(Map<String, dynamic> json){

    return Role(
        name: json['name']
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name
  };
}