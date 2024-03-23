import 'package:news_app/core/network/helpers/api_error_response.dart';

sealed class ApiResult {
  const ApiResult();
}

final class ApiSuccess extends ApiResult {
  const ApiSuccess(this.value);

  final dynamic value;
}

final class ApiError extends ApiResult {
  const ApiError(this.errorResponse);

  final ApiErrorResponse errorResponse;
}
