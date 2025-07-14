import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../bloc/profile/profile_bloc.dart';
import '../../bloc/profile/profile_event.dart';

class CameraHelper {
  final picker = ImagePicker();
  final BuildContext context;

  CameraHelper(this.context);

  /// imageSource = ImageSource.camera OR ImageSource.gallery
  Future<void> openImagePicker(ImageSource imageSource) async {
    if (imageSource == ImageSource.camera) {
      final permissionStatus = await Permission.camera.request();
      if (permissionStatus != PermissionStatus.granted) {
        debugPrint("Camera permission not granted");
        openAppSettings();
        return;
      }
    }

    final XFile? pickedFile = await picker.pickImage(
      source: imageSource,
      imageQuality: 70,
    );

    if (pickedFile != null) {
      final File image = File(pickedFile.path);
      context.read<ProfileBloc>().add(UpdateProfileImage(image));
    } else {
      debugPrint("No image selected");
    }
  }
}
