import 'package:dio/dio.dart';
import 'package:news_app/core/env_manager.dart';
import 'package:news_app/di/config.dart';

class CommonHeaderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({"X-Api-Key": getIt.get<EnvManager>().apiKey()});
    super.onRequest(options, handler);
  }
}
