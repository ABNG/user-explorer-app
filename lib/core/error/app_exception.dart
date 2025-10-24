import 'package:dio/dio.dart';

class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException(this.message, {this.statusCode});

  factory AppException.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return AppException("request timed out. Please try again.");
      case DioExceptionType.badResponse:
        final status = error.response?.statusCode;
        String msg;
        if (status != null && status >= 500) {
          msg = "Server is currently unavailable. Please try again later.";
        } else if (status != null && status >= 400) {
          msg = "Something went wrong with your request. Please try again.";
        } else {
          msg = "An unexpected error occurred. Please try again.";
        }
        return AppException("Server error: $msg", statusCode: status);
      case DioExceptionType.cancel:
        return AppException("Request was cancelled.");
      case DioExceptionType.connectionError:
        return AppException("No internet connection.");
      case DioExceptionType.unknown:
      default:
        return AppException("Something went wrong. Please try again.");
    }
  }
}
