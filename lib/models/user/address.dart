

class Address {
  String street;
  String city;
  String state;
  String zipCode;

  Address({
    this.street,
    this.city,
    this.state,
    this.zipCode
});


  factory Address.fromJson(Map<String, dynamic> json){
    return Address(
        street: json['street'],
        city: json['city'],
        state: json['state'],
        zipCode: json['zipCode']
    );
  }

  Map<String, dynamic> toJson() => {

    "street": street,
    "city": city,
    "state": state,
    "zipCode": zipCode

  };
}