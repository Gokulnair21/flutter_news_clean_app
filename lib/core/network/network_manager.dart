import 'network_result.dart';

abstract class NetworkManager {

   Future<ApiResult> get({required String endPoint,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers});




}

