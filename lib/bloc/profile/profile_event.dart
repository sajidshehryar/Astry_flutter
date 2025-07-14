import 'dart:io';

import 'package:flutter/cupertino.dart';

abstract class ProfileEvent {
  const ProfileEvent();
}

class UpdateProfileImage extends ProfileEvent {
  final File image;
  UpdateProfileImage(this.image);

  @override
  String toString() => 'UpdateProfileImage: ${image.path}';
}

class GetProfile extends ProfileEvent{
  BuildContext context;
  GetProfile({required this.context});
}

class UpdateProfile extends ProfileEvent{
  final Map<String,dynamic> data;
  BuildContext context;
  UpdateProfile({required this.context,required this.data});
}
