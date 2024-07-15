import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:network/core/core.dart';

class SubCategoryApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  SubCategoryApi(this._dioClient);

  Future<Map<String, dynamic>> getSubCategoryApi({
    String? catId,
  }) async {
    // final SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper(Preference());
    try {
      if (catId != null && catId.isNotEmpty) {
        final Response res = await _dioClient.get(
          "${Endpoints.subCategory}/category/$catId",
          options: HttpOptions.getOptions(
            HttpOptions.getHeader(
                // sharedPreferenceHelper.authToken ?? '',
                ),
          ),
          // queryParameters: queryParams,
        );
        return res.data;
      } else {
        final Response res = await _dioClient.get(
          Endpoints.subCategory,
          options: HttpOptions.getOptions(
            HttpOptions.getHeader(
                // sharedPreferenceHelper.authToken ?? '',
                ),
          ),
          // queryParameters: queryParams,
        );
        return res.data;
      }
    } on DioException catch (e) {
      if (e.error is SocketException) {
        Fluttertoast.showToast(msg: "Internet not available !");
      }
      return e.response?.data;
    }
  }
}
