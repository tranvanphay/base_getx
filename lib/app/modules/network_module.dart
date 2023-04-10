import 'package:base_getx/constant/globals.dart';
import 'package:base_getx/repositories/api_log.dart';
import 'package:base_getx/repositories/remote/auth_api.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class NetworkModule {
  static void init() {
    Dio dio = _createDio();
    Get.put<Dio>(dio);

    AuthApi authService = AuthApi(dio);
    Get.put(authService);
  }

  static Dio _createDio() {
    final Dio dio = Dio(); // Provide a dio instance
    dio.options.sendTimeout = 15000;
    dio.options.connectTimeout = 15000;
    dio.options.receiveTimeout = 15000;
    dio.options.contentType = Headers.jsonContentType;
    dio.options.headers['Connection'] = 'keep-alive';
    dio.options.headers['User-Agent'] = 'Chrome/102.0.5005.134';
    dio.options.headers['Authorization'] = token;

    dio.interceptors.addAll([
      APILog(), // For Log
    ]);

    return dio;
  }
}
