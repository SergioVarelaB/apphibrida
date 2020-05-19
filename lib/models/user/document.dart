class Document {
  String ine;
  String certificate;
  String residenceProof;


  Document({
    this.ine,
    this.certificate,
    this.residenceProof
});


  factory Document.fromJson(Map<String, dynamic> json){
    return Document(
        ine: json['INE'],
        certificate: json['certificate'],
        residenceProof: json['residenceProof']
    );
  }

  Map<String, dynamic> toJson() => {

    "INE": ine,
    "certificate": certificate,
    "residenceProof": residenceProof
  };
}