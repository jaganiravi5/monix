import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:network/download_count/data/api/download_count_api.dart';
import 'package:network/download_count/data/model/download_count_model.dart';
import 'package:network/images/data/api/all_images_api.dart';
import 'package:network/images/data/model/all_images_model.dart';
import '../../../core/network/dio_exceptions.dart';

class DownloadCountRepository {
  final DownloadCountApi _downloadCountApi;

  DownloadCountRepository(this._downloadCountApi);

  Future<DownloadCountModel> downloadCountRepo({
    required String imageId,
  }) async {
    try {
      final res = await _downloadCountApi.downloadCountApi(imageId);
      final responseModel = DownloadCountModel.fromJson(
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
