import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:network/images/data/api/all_images_api.dart';
import 'package:network/images/data/model/all_images_model.dart';
import 'package:network/search/data/api/search_api.dart';
import 'package:network/search/data/model/search_model.dart';
import '../../../core/network/dio_exceptions.dart';

class SearchRepository {
  final SearchApi _searchApi;

  SearchRepository(this._searchApi);

  Future<SearchModel> searchRepo({
    // String? jwtToken,
    required Map<String, dynamic> queryParams,
  }) async {
    try {
      final res = await _searchApi.getSearchApi(
        queryParams: queryParams
        // jwtToken: jwtToken,queryParams: queryParams
      );
      final responseModel = SearchModel.fromJson(
        res,
      );
      log("response::::of:::::IMG$responseModel");
      print("response::::of:::::IMG2$responseModel");
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
