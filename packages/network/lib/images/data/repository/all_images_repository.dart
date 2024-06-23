import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:network/images/data/api/all_images_api.dart';
import 'package:network/images/data/model/all_images_model.dart';
import '../../../core/network/dio_exceptions.dart';

class AllImagesRepository {
  final AllImagesApi _allImagesApi;

  AllImagesRepository(this._allImagesApi);

  Future<AllImageModel> allImagesRepo({
    // String? jwtToken,
    required Map<String, dynamic> queryParams,
  }) async {
    try {
      final res = await _allImagesApi.getAllImagesApi(
        queryParams: queryParams
        // jwtToken: jwtToken,queryParams: queryParams
      );
      final responseModel = AllImageModel.fromJson(
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
