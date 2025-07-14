import 'package:flutter/material.dart';
import 'api_request_type.dart';
import 'base_client.dart';

class ApiRequestType {
  ApiRequestType();

  static Future<void> post({
    required String apiEndpoint,
    String? contentType,
    String? token,
    required BuildContext context,
    required Function(dynamic) onSuccess,
    required Function(String) onError,
    required Map<String, dynamic> body,
  }) async {
    try {
      var apiRequest = await BaseClient.handleRequest(ApiRequest(
        url: apiEndpoint,
        requestType: RequestType.post,
        contentType: contentType,
        body: body,
        token: token
      ));
      if (apiRequest["success"] == true) {
        onSuccess.call(apiRequest["data"]);
      } else {
        onError.call(apiRequest["message"]);
      }
    } catch (error) {
      final res = (error as dynamic).response;
      onError.call(res?.data?["message"]??"An unknown error occurred");
    }
  }

  static Future<void> put({
    required String apiEndpoint,
    String? contentType,
    String? token,
    required BuildContext context,
    required Function(dynamic) onSuccess,
    required Function(String) onError,
    required Map<String, dynamic> body,
  }) async {
    try {
      var apiRequest = await BaseClient.handleRequest(ApiRequest(
          url: apiEndpoint,
          requestType: RequestType.put,
          contentType: contentType,
          body: body,
          token: token
      ));
      if (apiRequest["success"] == true) {
        onSuccess.call(apiRequest["data"]);
      } else {
        onError.call(apiRequest["message"]);
      }
    } catch (error) {
      final res = (error as dynamic).response;
      onError.call(res?.data?["message"]??"An unknown error occurred");
    }
  }

  // static Future<void> uploadImage({
  //   required String apiEndpoint,
  //   required BuildContext context,
  //   required String imagePath,
  //   bool? showLoading,
  //   required Function(dynamic) onSuccess,
  //   required Function onError,
  //   ProgressCallback? onSendProgress,
  //
  // }) async {
  //   try {
  //     File file = File(imagePath);
  //     String fileType = imagePath.substring(imagePath.lastIndexOf(".") + 1);
  //
  //     var image = await MultipartFile.fromFile(file.path,
  //         filename: imagePath.split("/").last, contentType: MediaType(AppUtils.getFileType(imagePath) ?? "", fileType));
  //
  //     var apiRequest = await BaseClient.handleRequest(
  //       ApiRequest(
  //         url: apiEndpoint,
  //         onSendProgress: onSendProgress??(count,total){},
  //         requestType: RequestType.post,
  //         contentType: "multipart/form-data; boundary=<calculated when request is sent>",
  //         body: FormData.fromMap({"image": image}),ff
  //       ),
  //     );
  //
  //     if (apiRequest["success"] == true) {
  //       onSuccess.call(apiRequest["body"]);
  //     } else {
  //       throw Exception(apiRequest["message"] ?? "Something went wrong");
  //     }
  //   } catch (error) {
  //     final res = (error as dynamic).response;
  //     WidgetsBinding.instance.addPostFrameCallback((_) {
  //       if (context.mounted) {
  //         AppToasts.callToast(
  //           type: MessageType.error,
  //           context: context,
  //           message: res?.data?["message"] ?? "An unknown error occurred",
  //         );
  //       }
  //     });
  //     onError.call(res?.data?["message"] ?? "An unknown error occurred");
  //   }
  // }


  // static Future<dynamic> uploadAttachments({
  //   required String apiEndpoint,
  //   required BuildContext context,
  //   required String imagePath,
  //   bool? showLoading,
  //   ProgressCallback? onSendProgress,
  // }) async {
  //   try {
  //     File file = File(imagePath);
  //     String fileType = imagePath.substring(imagePath.lastIndexOf(".") + 1);
  //
  //     var image = await MultipartFile.fromFile(
  //       file.path,
  //       filename: imagePath.split("/").last,
  //       contentType: MediaType(AppUtils.getFileType(imagePath) ?? "", fileType),
  //     );
  //
  //     var apiRequest = await BaseClient.handleRequest(
  //       ApiRequest(
  //         url: apiEndpoint,
  //         onSendProgress: onSendProgress ?? (count, total) {},
  //         requestType: RequestType.post,
  //         contentType: "multipart/form-data; boundary=<calculated when request is sent>",
  //         body: FormData.fromMap({"image": image}),
  //       ),
  //     );
  //
  //     if (apiRequest["success"] == true) {
  //       return apiRequest["body"]; // 🔥 Return the API response so it can be awaited
  //     } else {
  //       throw Exception(apiRequest["message"] ?? "Something went wrong");
  //     }
  //   } catch (error) {
  //     final res = (error as dynamic).response;
  //     WidgetsBinding.instance.addPostFrameCallback((_) {
  //       if (context.mounted) {
  //         AppToasts.callToast(
  //           type: MessageType.error,
  //           context: context,
  //           message: res?.data?["message"] ?? "An unknown error occurred",
  //         );
  //       }
  //     });
  //     throw Exception(res?.data?["message"] ?? "An unknown error occurred"); // 🔥 Throw error instead of calling a callback
  //   }
  // }

  static Future<void> get({
    required String apiEndpoint,
    required BuildContext context,
    required Function(dynamic) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      var apiRequest = await BaseClient.handleRequest(ApiRequest(
        url: apiEndpoint,
        requestType: RequestType.get,
      ));
      if (apiRequest["success"] == true) {
        onSuccess.call(apiRequest["data"]);
      } else {
        onError.call(apiRequest["message"]);
      }
    } catch (error) {
      final res = (error as dynamic).response;
      onError.call(res??"An unknown error occurred");
    }
  }
}
