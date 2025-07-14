import 'dart:io';
import 'dart:ui';


import 'package:astro_talk/utils/constants/app_colors.dart';
import 'package:crop_image/crop_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../utils.dart';

class CropperScreen extends StatefulWidget {

  late String file;
  double aspectRatio = 1 / 1;

  CropperScreen({Key? key, required this.file, required this.aspectRatio}) : super(key: key);

  @override
  State<CropperScreen> createState() => _CropperScreenState();
}

class _CropperScreenState extends State<CropperScreen> {
  late CropController controller;

  @override
  void initState() {
    super.initState();
    controller = CropController(
      aspectRatio: widget.aspectRatio,
      defaultCrop: const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                ),
                GestureDetector(
                  onTap: () {
                    _cropImage(context);
                  } ,
                ),
              ],
            ),
          ),
          Expanded(
            child: CropImage(
              controller: controller,
              image: Image.file(File(widget.file)),
              gridColor: Colors.white,
              gridCornerSize: 30,
              gridThinWidth: 2,
              gridThickWidth: 5,
              scrimColor: Colors.black38,
              alwaysShowThirdLines: false,
              onCrop: (rect) => debugPrint(rect.toString()),
              minimumImageSize: 50,
            ),
            // child: Crop.file(
            //   File(widget.file),
            //   key: cropKey,
            //   aspectRatio: widget.aspectRatio,
            //   alwaysShowGrid: true,
            // ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _aspectRatioButton("1:1", 1 / 1),
                _aspectRatioButton("4:3", 4 / 3),
                _aspectRatioButton("16:9", 16 / 9),
                _aspectRatioButton("Free", null),
              ],
            ),
          ),

        ],
      ),
    );
  }
  Widget _aspectRatioButton(String label, double? ratio) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {
          setState(() {
            controller.aspectRatio = ratio; // null means free crop
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
              border: Border.all(color: greyText, width: 1),
              borderRadius: BorderRadius.circular(10)
          ),
          child: Text(label),
        ),
      ),
    );
  }


  Future<void> _cropImage(BuildContext context) async {
    // return;
    // final scale = cropKey.currentState?.scale;
    // final area = cropKey.currentState?.area;
    // if (area == null || scale == null) {
    //   // cannot crop, widget is not setup
    //   return;
    // }

    // if (!(await hasStorageEnabled())) {
    //   showLog("Storage permission is not enabled");
    //   return;
    // }
    var bitmap = await controller.croppedBitmap();
    var data = await bitmap.toByteData(format: ImageByteFormat.png);
    var bytes = data!.buffer.asUint8List();
    Directory tempDir = await getTemporaryDirectory();
    String filePath = "${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.png";
    debugPrint("new file path $filePath");
    var file = File(filePath);
    debugPrint("created file path ${file.path}");
    file.writeAsBytes(bytes,flush: true);
    debugPrint("file successfully saved");
    Navigator.pop(context, file);

    //   // _cropImage(context);
    //
    //   // scale up to use maximum possible number of pixels
    //   // this will sample image in higher resolution to make cropped image larger
    //   final sample = await ImageCrop.sampleImage(
    //     file: File(widget.file),
    //     preferredSize: 1024,
    //   );
    //
    //   // final file = await ImageCrop.cropImage(file: File(widget.file), area: area);
    //   final file = await ImageCrop.cropImage(file: sample, area: area);
    //   sample.delete();
    //   Navigator.pop(context, file);
    //   debugPrint('$file');
    // } else {
    //   debugPrint('Storage permission denied');
    // }
  }

  Future<bool> hasStorageEnabled() async {
    // return true;
    PermissionStatus status;
    if (Platform.isAndroid) {
      status = await Permission.storage.request();
    } else {
      status = await Permission.photos.request();
    }
    debugPrint("status: " + status.toString());
    if (Platform.isAndroid) {
      if (status == PermissionStatus.permanentlyDenied) {
        Utils.showError(context,"Storage permission permanently denied, we are redirecting to you setting screen to enable permission");
        Future.delayed(const Duration(seconds: 4), () {
          openAppSettings();
        });
        return false;
      } else if (status == PermissionStatus.granted) {
        return true;
      } else {
        Utils.showError(context,"Storage permission denied, please allow permission to crop photo");
        return false;
      }
    } else {
      if (status == PermissionStatus.permanentlyDenied) {
        Utils.showError(context,"Photos permission permanently denied, we are redirecting to you setting screen to enable permission");
        Future.delayed(const Duration(seconds: 4), () {
          openAppSettings();
        });
        return false;
      } else if (status == PermissionStatus.granted || status == PermissionStatus.limited) {
        return true;
      } else {
        Utils.showError(context,"Storage permission denied, please allow permission to crop photo");
        return false;
      }
    }
  }
}
