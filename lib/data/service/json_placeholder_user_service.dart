import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:user_explorer/core/error/app_exception.dart';
import 'package:user_explorer/data/model/user_model.dart';

@lazySingleton
class JsonPlaceholderUserService {
  final Dio _dioClient;
  JsonPlaceholderUserService(Dio dioClient) : _dioClient = dioClient;

  Future<List<UserModel>> getUsers() async {
    try {
      Response response = await _dioClient.get('users');
      return (response.data as List)
          .map((data) => UserModel.fromJson(data))
          .toList();
    } on DioException catch (e) {
      log(e.toString());
      throw AppException.fromDioError(e);
    } catch (e) {
      log(e.toString());
      throw AppException("data parsing error");
    }
  }
}
