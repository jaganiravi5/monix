import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:network/category/data/api/all_category_api.dart';
import 'package:network/category/data/model/all_category_model.dart';

import 'package:network/core/shared_preferences/preferences.dart';
import '../../../core/network/dio_exceptions.dart';
import '../../../core/shared_preferences/helper.dart';

class AllCategoryRepository {
  final AllCategoryApi _allCategoryApi;
  final SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper(Preference());

  AllCategoryRepository(this._allCategoryApi);

  Future<AllCategoryModel> allCategoryRepo({
    String? jwtToken,
    // required Map<String, dynamic> queryParams,
  }) async {
    try {
      final res = await _allCategoryApi.getAllCategoryApi(
        // jwtToken: sharedPreferenceHelper.authToken,
        // queryParams: queryParams,
      );
      final responseModel = AllCategoryModel.fromJson(
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
