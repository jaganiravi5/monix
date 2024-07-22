import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:network/core/core.dart';

class SearchApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  SearchApi(this._dioClient);

  Future<Map<String, dynamic>> getSearchApi({
    // String? jwtToken,
    required Map<String, dynamic> queryParams,
  }) async {
    // final SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper(Preference());
    try {
      print("---->>>>>>>>>>$queryParams");
      final Response res = await _dioClient.get(
        Endpoints.search,
        options: HttpOptions.getOptions(
          HttpOptions.getHeader(
              // sharedPreferenceHelper.authToken ?? '',
              ),
        ),
        queryParameters: queryParams,
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
