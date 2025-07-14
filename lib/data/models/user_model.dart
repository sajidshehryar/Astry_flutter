class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String role;
  final int phone;
  final String token;
  final String gender;
  final String dob;
  final String createdAt;
  final String updatedAt;
  final String countryCode;
  final int v;
  final String dobTime;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.phone,
    required this.token,
    required this.gender,
    required this.dob,
    required this.createdAt,
    required this.updatedAt,
    required this.countryCode,
    required this.v,
    required this.dobTime
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      role: json['role'] ,
      phone: json['phone'],
      token: json['token'],
      gender: json['gender'],
      dob: json['dob'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'] ,
      countryCode: json['countryCode'],
      v: json['__v'],
      dobTime: json['dobTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'role': role,
      'phone': phone,
      'token': token,
      'gender': gender,
      'dob': dob,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'countryCode': countryCode,
      '__v': v,
      'dobTime': dobTime,
    };
  }
}
