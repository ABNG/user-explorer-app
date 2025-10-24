import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @Named("baseUrl")
  String get baseUrl => 'https://jsonplaceholder.typicode.com/';

  @lazySingleton
  Dio dio(@Named("baseUrl") String baseUrl) =>
      Dio(
          BaseOptions(
            contentType: "application/json",
            baseUrl: baseUrl,
            connectTimeout: Duration(seconds: 30),
            receiveTimeout: Duration(seconds: 30),
          ),
        )
        ..interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            enabled: kDebugMode,
          ),
        );
}
