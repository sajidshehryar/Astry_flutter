class CompatibilityModel {
  String? id;
  String? firstName;
  String? lastName;
  int? phone;
  String? gender;
  String? dob;
  String? profilepicture;

  CompatibilityModel({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.gender,
    this.dob,
    this.profilepicture,
  });

  factory CompatibilityModel.fromJson(Map<String, dynamic> json) {
    return CompatibilityModel(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phone: json['phone'],
      gender: json['gender'],
      dob: json['dob'] ?? '',
      profilepicture: json['profilepicture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'gender': gender,
      'dob': dob,
      'profilepicture':profilepicture
    };
  }
}

class UserListResponse {
  bool? success;
  String? message;
  List<CompatibilityModel>? users;

  UserListResponse({
    this.success,
    this.message,
    this.users,
  });

  factory UserListResponse.fromJson(Map<String, dynamic> json) {
    List<CompatibilityModel> allUsers = [];

    if (json['data'] != null) {
      final data = json['data'];
      if (data['male'] != null) {
        allUsers.addAll((data['male'] as List)
            .map((e) => CompatibilityModel.fromJson(e))
            .toList());
      }
      if (data['female'] != null) {
        allUsers.addAll((data['female'] as List)
            .map((e) => CompatibilityModel.fromJson(e))
            .toList());
      }
    }

    return UserListResponse(
      success: json['success'],
      message: json['message'],
      users: allUsers,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'users': users?.map((e) => e.toJson()).toList(),
    };
  }
}
