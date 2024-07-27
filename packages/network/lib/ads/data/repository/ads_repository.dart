import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:network/ads/data/api/ads_api.dart';
import 'package:network/ads/data/model/ads_model.dart';
import 'package:network/core/shared_preferences/preferences.dart';
import '../../../core/network/dio_exceptions.dart';
import '../../../core/shared_preferences/helper.dart';

class AdsRepository {
  final AdsApi _adsApi;
  final SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper(Preference());

  AdsRepository(this._adsApi);

  Future<AdsModel> adsRepo({
    String? jwtToken,
    // required Map<String, dynamic> queryParams,
  }) async {
    try {
      final res = await _adsApi.getAdsApi(
        // jwtToken: sharedPreferenceHelper.authToken,
        // queryParams: queryParams,
      );
      final responseModel = AdsModel.fromJson(
        res,
      );
      return responseModel;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(
        errorMessage.toString(),
      );
      Fluttertoast.showToast(
        msg: errorMessage.toString(),
        backgroundColor: Colors.red[50],
        gravity: ToastGravity.TOP,
        textColor: Colors.red,
      );
      rethrow;
    }
  }
}
