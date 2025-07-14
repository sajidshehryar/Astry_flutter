
class UserProfile {
  String? id;
  String? title;
  String? description;
  String? image;


  UserProfile({
    this.id,
    this.title,
    this.description,
    this.image,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],

    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'title': title,
    'description': description,
    'image': image,

  };
}
