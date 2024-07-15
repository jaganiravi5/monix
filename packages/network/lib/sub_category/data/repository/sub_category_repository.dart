import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:network/category/data/api/all_category_api.dart';
import 'package:network/category/data/model/all_category_model.dart';

import 'package:network/core/shared_preferences/preferences.dart';
import 'package:network/sub_category/data/api/sub_category_api.dart';
import 'package:network/sub_category/data/model/sub_category_model.dart';
import '../../../core/network/dio_exceptions.dart';
import '../../../core/shared_preferences/helper.dart';

class SubCategoryRepository {
  final SubCategoryApi _subCategoryApi;
  final SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper(Preference());

  SubCategoryRepository(this._subCategoryApi);

  Future<SubCategoryModel> subCategoryRepo({
    String? catId,
  }) async {
    try {
      final res = await _subCategoryApi.getSubCategoryApi(
        catId : catId,
      );
      final responseModel = SubCategoryModel.fromJson(
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
