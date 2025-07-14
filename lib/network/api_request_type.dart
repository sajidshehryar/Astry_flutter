import 'package:dio/dio.dart';

enum RequestType { post, get, delete, put }

class ApiRequest {
  final String url;
  final RequestType requestType;
  final Map<String, dynamic>? headers;
  final String? contentType;
  final String? token;
  final dynamic body;
  final ProgressCallback? onSendProgress;

  ApiRequest({required this.url, this.headers, required this.requestType, this.body, this.contentType,this.token, this.onSendProgress});
}
