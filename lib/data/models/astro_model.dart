
class AstrologyMain {
   String? id;
   String? title;
   String? description;
   String? image;
   String? colorOne;
   String? colorTwo;
   String? colorThree;

  AstrologyMain({
     this.id,
     this.title,
     this.description,
     this.image,
     this.colorOne,
     this.colorTwo,
     this.colorThree
  });

  factory AstrologyMain.fromJson(Map<String, dynamic> json) {
    return AstrologyMain(
      id: json['_id'] ,
      title: json['title'] ,
      description: json['description'],
      image: json['image'] ,
      colorOne:json['color_1'],
      colorTwo:json['color_2'] ,
      colorThree:json['color_3'],
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'title': title,
    'description': description,
    'image': image,
    'color_1': colorOne,
    'color_2': colorTwo,
    'color_3': colorThree,
  };
}
