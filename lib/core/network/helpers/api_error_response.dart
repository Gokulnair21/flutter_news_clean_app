

import 'dart:convert';

ApiErrorResponse apiErrorResponseFromJson(String str) => ApiErrorResponse.fromJson(json.decode(str));

String apiErrorResponseToJson(ApiErrorResponse data) => json.encode(data.toJson());

class ApiErrorResponse {
  String status;
  String code;
  String message;

  ApiErrorResponse({
    required this.status,
    required this.code,
    required this.message,
  });

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) => ApiErrorResponse(
    status: json["status"],
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
  };
}
