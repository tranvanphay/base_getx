import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// Log Request và Response để hỗ trợ debug
class APILog extends Interceptor {
  APILog();
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print('┌───────────────── Start Request ──────────────────────');
    print('│ uri : ${options.uri}');
    // Print request
    _printRequest(options);
    // Body
    _printBody(options);
    print('└───────────────── End Request ───────────────────────');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    _printResponse(response);
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    _printError(err);
    log("error...");
    Response? response = err.response;
    if (response != null) {
      handler.resolve(response);
      if (response.statusCode == 401) {
        // authRepoImpl.refreshUserSession();
      } else {
        EasyLoading.showError(err.response?.data['message']);
      }
      return;
    }
    handler.next(err);
  }

  // =====================================
  // =========      Request      =========
  // =====================================
  void _printRequest(RequestOptions options) {
    print('│ method : ${options.method}');
    print('│ responseType : ${options.responseType.toString()}');
    final String header = jsonEncode(options.headers);
    print('│ headers : $header');
  }

  void _printBody(RequestOptions options) {
    dynamic data = options.data;
    if (data is Map) {
      final String body = jsonEncode(data);
      print('│ body data : $body');
    } else if (data is FormData) {
      print('│ body fields : ${data.fields}');
    }
  }

  // =====================================
  // ========     Response       =========
  // =====================================
  void _printResponse(Response response) {
    print('┌───────────────── Response ──────────────────────');
    print('│ uri : ${response.requestOptions.uri}');
    print('│ statusCode : ${response.statusCode}');
    print('│ Response : ${jsonEncode(response.data)}');
    print('└───────────────── End Response ───────────────────────');
  }

  // =====================================
  // ========      Error         =========
  // =====================================
  void _printError(DioError error) {
    print('┌───────────────── Response Error ──────────────────────');
    print('│ uri : ${error.requestOptions.uri}');
    print('│ error : ${error.error}');
    print('│ error code : ${error.response?.statusCode}');
    print('│ error message : ${error.message}');
    print('│ error response : ${error.response.toString()}');
    print('└───────────────── End Response ───────────────────────');
  }

  void print(String msg) {
    log(msg);
  }
}
