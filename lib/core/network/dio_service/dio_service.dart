import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/env_manager.dart';
import 'package:news_app/core/network/api_error_response.dart';
import 'package:news_app/core/network/network_manager.dart';
import 'package:news_app/di/config.dart';

import '../network_result.dart';
import 'interceptors/common_header_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

@Singleton(as: NetworkManager)
class DioService implements NetworkManager {
  /*
  This class will contains the following methods
  When initialized will created the dio main service,which will include all the interceptors and its confiugations


  Other than that this class will have
  the following http request
  1.GET
  2.POST
  3.PATCH
  4.Delete

  For interceptors needs to create a
  Note: Order do matter like in Android
  1.APIKEYINTERCEPTOR
  2.LoggingInterceptor


  Later I will inject this into repository


  As of now for DI thougth about following things
  1.Using get_it with injectable else need to do it manually
  2.Using JsonSerializable package for toReadJson and MapReadjSon -> Will think about it and make it user a online library




   */
  late Dio _dio;

  DioService() {
    final baseOption = BaseOptions(
      baseUrl: getIt.get<EnvManager>().baseUrl(),
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      // sendTimeout: const Duration(seconds: 60)
    );
    _dio = Dio(baseOption);
    _dio.interceptors.addAll([CommonHeaderInterceptor(), LoggingInterceptor()]);
  }

  @override
  Future<ApiResult> get(
      {required String endPoint,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) async {
    final response = await _dio.get(endPoint,
        queryParameters: queryParams, options: Options(headers: headers));
    if (response.statusCode == 200) {
      return ApiSuccess(response.data);
    } else {
      return ApiError(apiErrorResponseFromJson(response.data));
    }
  }
}
