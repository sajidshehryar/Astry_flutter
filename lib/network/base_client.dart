import 'dart:async';
import 'dart:io';
import 'package:astro_talk/utils/get_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'api_request_type.dart';
import 'app_exceptions.dart';


class BaseClient {
  static final Dio _dio = Dio();
  static Future<dynamic> handleRequest(ApiRequest apiRequest) async {
    _dio.options.followRedirects = false;
    _dio.options.connectTimeout = const Duration(seconds: 20);
    _dio.options.receiveTimeout = const Duration(seconds: 20);
    _dio.interceptors.clear();
    _dio.interceptors.add(AppExceptions());

    bool isOnline = await hasNetwork();
    if (!isOnline) {
      // DialogHelper.showErrorToast(message: 'No Internet, Please try later!');
     /* Get.to(() => NoInternetPage(
            callBack: (apiRequest) {
              handleRequest(apiRequest);
            },
            apiRequest: apiRequest,
          ));*/

      return;
    }

    Map<String, dynamic> headers = {
      'Accept': '*/*',
      'Content-Type': apiRequest.contentType ?? 'application/x-www-form-urlencoded',
    };
    if (apiRequest.headers != null) {
      headers.addAll(apiRequest.headers!);
    }

    if (SharedPreferenceHelper().getUserToken() != null || apiRequest.token != null) {
      headers.putIfAbsent('Authorization', () => 'Bearer ${SharedPreferenceHelper().getUserToken() ?? apiRequest.token}');
    }

    switch (apiRequest.requestType) {
      case RequestType.post:
        var res = await _dio.post(apiRequest.url,
            data: apiRequest.body,
            onSendProgress: apiRequest.onSendProgress,
            options: Options(
              headers: headers,
            ));
        return res.data;
      case RequestType.get:
        var response = await _dio.get(apiRequest.url,
            data: apiRequest.body,
            options: Options(
              headers: headers,
            ));

        return response.data;
      case RequestType.delete:
        var response = await _dio.delete(apiRequest.url,
            data: apiRequest.body,
            options: Options(
              headers: headers,
            ));
        return response.data;

      case RequestType.put:
        var response = await _dio.put(apiRequest.url,
            data: apiRequest.body,
            options: Options(
              headers: headers,
            ));
        if (kDebugMode) {
          print(response.data);
        }
        return response.data;
    }
  }

  static Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
