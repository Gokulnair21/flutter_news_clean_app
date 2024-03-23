import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/env_manager.dart';
import 'package:news_app/di/config.dart';

class CommonHeaderInterceptor extends Interceptor {
  final EnvManager envManager;

  CommonHeaderInterceptor(this.envManager);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({"X-Api-Key": envManager.apiKey()});
    super.onRequest(options, handler);
  }
}
