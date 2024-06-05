import 'dart:math';

import 'package:common/common.dart';
import 'package:dio/dio.dart';
import 'package:network/core/core.dart';

class ApiExceptionsHandle {
  static Future<bool> isValidException(
      {required DioException e, bool? edisShowToast}) async {
    if (e.response?.statusCode == HttpOptions.statusCode401 ||
        e.response?.statusCode == HttpOptions.statusCode403) {
      return true;
    } else {
      if (e.response != null &&
          e.response!.data != null &&
          e.response!.data['message']) {
        showToast(msg: e.response!.data['message']);
      } else if (e.message != null) {
        showToast(msg: e.message ?? 'Something went wrong, try again later');
      }
    }
    return false;
  }
}
