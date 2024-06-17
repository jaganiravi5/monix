import 'dart:io';

import 'package:dio/dio.dart';
import 'package:network/core/core.dart';

class HttpOptions {
  static Map<String, dynamic> getHeader({String? xAuth}) {
    return {
      // "Authorization": "Bearer $xAuth" ?? '',
      'Accept': 'application/json',
      'Connection': 'keep-alive',
    };
  }

  static Options getOptions(Map<String, dynamic>? header) {
    return Options(
      headers: header ?? {},
      contentType: "application/json",
    );
  }

  static Options getMultipartOptions(Map<String, dynamic>? header, var formData) {
    return Options(
      headers: header ?? {},
      contentType: 'multipart/form-data; boundary=${formData.boundary}',
    );
  }

  static const int statusCode401 = 401;
  static const int statusCode403 = 403;
}
