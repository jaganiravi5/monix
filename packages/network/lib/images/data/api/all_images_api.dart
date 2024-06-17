import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:network/core/core.dart';

class AllImagesApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  AllImagesApi(this._dioClient);

  Future<Map<String, dynamic>> getAllImagesApi({
    // String? jwtToken,
    required Map<String, dynamic> queryParams,
  }) async {
    // final SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper(Preference());
    try {
      final Response res = await _dioClient.get(
        Endpoints.allImages,
        options: HttpOptions.getOptions(
          HttpOptions.getHeader(
              // sharedPreferenceHelper.authToken ?? '',
              ),
        ),
        // queryParameters: queryParams,
      );

      return res.data;
    } on DioException catch (e) {
      if (e.error is SocketException) {
        Fluttertoast.showToast(msg: "Internet not available !");
      }
      return e.response?.data;
    }
  }
}
