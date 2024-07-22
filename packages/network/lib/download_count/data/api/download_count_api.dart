import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:network/core/core.dart';


class DownloadCountApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  DownloadCountApi(this._dioClient);

  Future<Map<String, dynamic>> downloadCountApi(
      // {
    String imageId,
    // required Map<String, dynamic> queryParams,
  // }
  ) async {
    // final SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper(Preference());
    try {
      final Response res = await _dioClient.patch(
        "${Endpoints.allImages}$imageId/incrementDownloadCount",
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
