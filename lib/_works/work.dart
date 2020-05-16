
class Work {
  String image;
  String titleWork;
  String date;

  Work(this.image, this.titleWork, this.date);

  //Aquí va lo del JSON --------------------
  Work.fromJson(Map<String, dynamic> json)
      : image = json['image'],
        titleWork = json['titleWork'],
        date = json['date'];

  Map<String, dynamic> toJson() =>
      {
        'image': image,
        'titleWork': titleWork,
        'date': date,
      };
// ---------------------------------------

}