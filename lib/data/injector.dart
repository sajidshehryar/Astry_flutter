import 'dart:convert';
import 'dart:io';
import 'package:astro_talk/utils/get_storage.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import '../utils/helper/storage_helper.dart';
import '../utils/shared/utility.dart';

class Injector {

  static final Injector _singleton = Injector._internal();
  static final _dio = Dio();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  Dio getDio(){
    BaseOptions options =
    BaseOptions(receiveTimeout: Duration(seconds: 5), connectTimeout: Duration(milliseconds: 180000));
    _dio.options = options;
    _dio.options.followRedirects = false;
    _dio.options.headers["Content-Type"] = "application/json";
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
    _dio.interceptors.clear();
    _dio.interceptors.add(LoggingInterceptors());
    return _dio;
  }

  static Options? getHeaderToken(){
    String? token = SharedPreferenceHelper().getUserToken();
    if (token != null) {
      Utility.showLog("token => " + token);
      var headerOptions = Options(headers: {"Authorization":'Bearer ${token}' ,});
      return headerOptions;
    }
    return null;
  }
}

class LoggingInterceptors extends Interceptor {

  String showLogObject(Object? object) {
    try {
      final jsonStr = json.encode(object);
      final decoded = json.decode(jsonStr);

      if (decoded is Map || decoded is List) {
        JsonEncoder encoder = const JsonEncoder.withIndent('  ');
        return encoder.convert(decoded);
      } else {
        return decoded.toString();
      }
    } catch (e) {
      return object.toString();
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Utility.showLog("--> ${options.method.toUpperCase()} ${"" + (options.baseUrl) + (options.path)}");
    Utility.showLog("Headers:");
    options.headers.forEach((k, v) => Utility.showLog('$k: $v'));
    Utility.showLog("queryParameters:");
    options.queryParameters.forEach((k, v) => Utility.showLog('$k: $v'));
    if (options.data != null) {
      try{
        // showLog("Body: ${showLogObject(options.data)}");
        if (options.data is FormData) {
          FormData formData = options.data as FormData;
          Utility.showLog("Body:");
          var buffer = [];
          for (MapEntry<String, String> pair in formData.fields) {
            buffer.add(pair.key + ':' + pair.value);
          }
          Utility.showLog("Body:{${buffer.join(', ')}}");
        } else {
          Utility.showLog("Body: ${showLogObject(options.data)}");
        }

      }catch(e){
        Utility.showLog("Body: ${showLogObject(options.data)}");
      }
    }
    Utility.showLog("--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError dioError, ErrorInterceptorHandler handler) {
    showLogObject("<-- ${dioError.message} ${(dioError.response?.requestOptions != null ? (dioError.response!.requestOptions.baseUrl + dioError.response!.requestOptions.path) : 'URL')}");
    Utility.showLog("${dioError.response != null ? dioError.response!.data : 'Unknown Error'}");
    Utility.showLog("<-- End error");
    return super.onError(dioError, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Utility.showLog("<-- ${response.statusCode} ${(response.requestOptions != null ? (response.requestOptions.baseUrl + response.requestOptions.path) : 'URL')}");
    Utility.showLog("Headers:");
    response.headers.forEach((k, v) => Utility.showLog('$k: $v'));
    Utility.showLog("Response: ${response.data}");
    Utility.showLog("<-- END HTTP");
    return super.onResponse(response, handler);
  }
}