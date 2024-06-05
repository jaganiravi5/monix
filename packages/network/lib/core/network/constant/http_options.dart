import 'package:dio/dio.dart';

class HttpOptions {
  static Map<String, dynamic> getHeaderWithToken() {
    return {
      'Authorization': 'Token 13efc27ff423d28c3757ca30657462fb123e8a7a',
      'Accept': 'application/json',
      'Connection': 'keep-alive',
    };
  }

  static Options getOptions(Map<String, dynamic>? header) {
    return Options(
      headers: header ?? {},
      contentType: 'application/octet-stream',
    );
  }

  static Options getMultipartOptions(Map<String, dynamic>? header) {
    return Options(
      headers: header ?? {},
      contentType: 'multipart/form-data',
    );
  }

  static const int statusCode401 = 401;
  static const int statusCode403 = 403;
}
