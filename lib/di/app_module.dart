import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../core/env_manager.dart';
import '../core/network/interceptors/common_header_interceptor.dart';
import '../core/network/interceptors/logging_interceptor.dart';

@module
abstract class AppModule {
  @Singleton()
  Dio createDioInstance(EnvManager envManager) {
    final baseOption = BaseOptions(
      baseUrl: envManager.baseUrl(),
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      // sendTimeout: const Duration(seconds: 60)
    );
    return Dio(baseOption)
      ..interceptors
          .addAll([CommonHeaderInterceptor(envManager), LoggingInterceptor()]);
  }

  @Singleton()
  EnvManager provideEnvManagerInstance() {
    return EnvManager();
  }
}
