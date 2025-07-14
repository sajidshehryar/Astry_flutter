import 'package:astro_talk/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'constants/app_colors.dart';
import 'helper/cameraHelper.dart';

class Utils {
  static void showError(BuildContext context, String? message) {
    if (message == null || message.isEmpty) return;

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: semiTransparentPurple,
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static bool validateOtp({
    required BuildContext context,
    required String? otp,
  }) {
    if (otp == null || otp.trim().isEmpty) {
      showError(context, AppString.otpValidation);
      return false;
    }

    if (!RegExp(r'^\d{6}$').hasMatch(otp.trim())) {
      showError(context, AppString.invalidOtp);
      return false;
    }

    return true;
  }

  static void showImageSourceDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text("Camera"),
              onTap: () {
                Navigator.pop(context);
                CameraHelper(context).openImagePicker(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text("Gallery"),
              onTap: () {
                Navigator.pop(context);
                CameraHelper(context).openImagePicker(ImageSource.gallery);
              },
            ),
          ],
        );
      },
    );
  }






}
