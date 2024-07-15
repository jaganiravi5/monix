import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:network/core/shared_preferences/preferences.dart';
import 'package:network/suggestion/data/api/suggestion_api.dart';
import 'package:network/suggestion/data/model/suggestion_model.dart';
import '../../../core/network/dio_exceptions.dart';
import '../../../core/shared_preferences/helper.dart';

class SuggestionRepository {
  final SuggestionApi _suggestionApi;
  final SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper(Preference());

  SuggestionRepository(this._suggestionApi);

  Future<SuggestionModel> suggestionRepo(
   
  ) async {
    try {
      final res = await _suggestionApi.submitSuggestionApi(queryParams: {}
        
       
      );
      final responseModel = SuggestionModel.fromJson(
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
