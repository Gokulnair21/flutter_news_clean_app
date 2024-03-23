import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final httpMethod = options.method.toUpperCase();
    final url = options.baseUrl + options.path;
    debugPrint('--> $httpMethod $url \n');
    debugPrint('Headers');
    options.headers.forEach((k, Object? v) => debugPrint('\t\t$k: $v'));

    debugPrint('\n');
    if (options.queryParameters.isNotEmpty) {
      debugPrint('Query Params:');
      options.queryParameters
          .forEach((k, Object? v) => debugPrint('\t\t$k: $v'));
    }

    if (options.data != null) {
      debugPrint('\tBody: ${options.data}');
    }

    debugPrint('--> END $httpMethod');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('<-- RESPONSE');

    debugPrint('\tStatus code: ${response.statusCode}');

    // if (response.statusCode == 304) {
    //   debugPrint('\tSource: Cache');
    // } else {
    //   debugPrint('\tSource: Network');
    // }

    debugPrint('\tResponse: ${response.data}');

    debugPrint('<-- END HTTP');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('--> ERROR');
    debugPrint('Error : ${err.message}');
    debugPrint('<-- END Error');
    super.onError(err, handler);
  }
}
