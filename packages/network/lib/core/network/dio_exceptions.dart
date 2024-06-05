import 'dart:io';

import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = 'Request to API server was cancelled';
        break;
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with API server';
        break;
      case DioExceptionType.unknown:
        if (dioError.error is SocketException) {
          message = 'No Internet or Server Error';
          break;
        } else if (dioError.error is HandshakeException) {
          message = 'Response data not found';
          break;
        }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return error['error']['message'] ?? 'Bad request';
      case 401:
        return error['error']['message'] ?? 'Unauthorized';
      case 403:
        return error['error']['message'] ?? 'Forbidden';
      case 404:
        return error['error']['message'];
      case 420:
        return 'Session Expired. Please LogIn again';
      case 500:
        return error['error']['message'] ?? 'Internal server error';
      case 502:
        return error['error']['message'] ?? 'Server unavailable';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
